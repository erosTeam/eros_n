import 'dart:async';

import 'package:collection/collection.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/network/app_dio/exception.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/gallery/gallery_page_state.dart';
import 'package:eros_n/pages/nav/history/history_provider.dart';
import 'package:eros_n/store/db/entity/download_task.dart';
import 'package:eros_n/utils/get_utils/extensions/duration_extensions.dart';
import 'package:eros_n/utils/get_utils/extensions/num_extensions.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:eros_n/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gallery_provider.g.dart';

@riverpod
class GalleryNotifier extends _$GalleryNotifier {
  late final TextEditingController commentEditingController;

  @override
  Gallery build(int gid) {
    logger.d('galleryProvider gid $gid');
    commentEditingController = TextEditingController();
    ref.onDispose(() {
      logger.d('galleryProvider $gid onDispose');
      commentEditingController.dispose();
    });
    return Gallery(gid: gid);
  }

  int _getSavedReadIndex(int gid) {
    return ref
            .read(historyGallerysProvider)
            .firstWhereOrNull((h) => h.gid == gid)
            ?.lastReadIndex ??
        0;
  }

  void initFromGallery(Gallery gallery) {
    logger.d('init ${gallery.toString()} ');

    state = state.copyWith(
      images: gallery.images,
      gid: gallery.gid,
      title: gallery.title,
      mediaId: gallery.mediaId,
      currentPageIndex: _getSavedReadIndex(gallery.gid),
    );

    loadData();
    500.milliseconds.delay(() {
      ref.read(historyProvider.notifier).addHistory(state);
    });
  }

  void initFromGid(int gid) {
    logger.d('init $gid');

    state = state.copyWith(gid: gid, currentPageIndex: _getSavedReadIndex(gid));

    loadData().then(
      (value) => ref.read(historyProvider.notifier).addHistory(state),
    );
  }

  void setInitialPage(int page) {
    state = state.copyWith(currentPageIndex: page);
  }

  /// Initialize minimal state from a completed download task so that the
  /// page indicator and slider are correct even before network data arrives.
  void initForOfflineRead(DownloadTask task) {
    final placeholderPages = List.generate(
      task.totalPages,
      (_) => const GalleryImage(),
    );

    state = state.copyWith(
      gid: task.gid,
      mediaId: task.mediaId,
      currentPageIndex: _getSavedReadIndex(task.gid),
      images: GalleryImages(pages: placeholderPages),
    );

    loadData();
  }

  /// Fetch detail + comments + favorite status.
  Future<void> loadData({bool refresh = false}) async {
    logger.d('loadData refresh $refresh  url: ${state.url}');
    if (state.images.pages.isEmpty) {
      ref
          .read(pageStateProvider(state.gid).notifier)
          .update((s) => s.copyWith(pageStatus: PageStatus.loading));
    }

    logger.d('url ${state.url}');
    try {
      final gallery = await getGalleryDetail(url: state.url, refresh: refresh);
      if (!ref.mounted) {
        return;
      }
      state = gallery.copyWith(
        mediaId: gallery.mediaId ?? state.mediaId,
        currentPageIndex: state.currentPageIndex,
        gid: state.gid,
      );
    } on HttpException {
      rethrow;
    } finally {
      if (ref.mounted) {
        ref
            .read(pageStateProvider(state.gid).notifier)
            .update((s) => s.copyWith(pageStatus: PageStatus.none));
      }
    }

    if (!ref.mounted) {
      return;
    }
    logger.d('url ${state.url}');
    try {
      final comments = await getGalleryComments(
        gid: state.gid,
        refresh: refresh,
      );
      if (!ref.mounted) {
        return;
      }
      state = state.copyWith(comments: comments);
    } on HttpException {
      rethrow;
    } finally {
      if (ref.mounted) {
        ref
            .read(pageStateProvider(state.gid).notifier)
            .update((s) => s.copyWith(pageStatus: PageStatus.none));
      }
    }

    if (!ref.mounted) {
      return;
    }
    // Resolve real favorite state via API. The SvelteKit detail HTML carries
    // no session info, so the parser leaves `isFavorited` as null and we fill
    // it in here. Best-effort: a failure just leaves the heart hollow.
    unawaited(_refreshFavoriteStatus());
  }

  Future<void> _refreshFavoriteStatus() async {
    try {
      final fav = await getGalleryFavoriteStatus(gid: state.gid);
      if (!ref.mounted) {
        return;
      }
      if (fav != null && fav != state.isFavorited) {
        state = state.copyWith(isFavorited: fav);
      }
    } catch (_) {
      // intentionally ignored — purely cosmetic enrichment
    }
  }

  bool _favoriteLoading = false;

  Future<void> toggleFavorite() async {
    if (_favoriteLoading) {
      return;
    }
    _favoriteLoading = true;
    try {
      final csrf = state.csrfToken ?? await getCsrfTokenFromCookie();
      final bool unfav = state.isFavorited ?? false;
      logger.d(unfav ? '取消收藏' : '收藏');

      final result = await setFavorite(
        gid: state.gid,
        csrfToken: csrf,
        unfavorite: unfav,
      );

      final bool? isFavorite = result.favorited;
      final int? numFavorite = result.favNum;

      if (isFavorite != null) {
        state = state.copyWith(
          isFavorited: isFavorite,
          numFavorites: numFavorite ?? state.numFavorites,
        );
        showSimpleToast(
          isFavorite
              ? L10n.current.favorite_added
              : L10n.current.favorite_removed,
        );
      } else {
        // API returned success but no favorited field — refresh to confirm.
        unawaited(_refreshFavoriteStatus());
      }
    } on UnauthorisedException {
      logger.e('toggleFavorite: session expired (401)');
      showSimpleToast(L10n.current.session_expired);
    } catch (e) {
      logger.e('toggleFavorite error: $e');
      showSimpleToast(L10n.current.favorite_failed(e.toString()));
    } finally {
      _favoriteLoading = false;
    }
  }

  Future<void> reloadData() async {
    await loadData(refresh: true);
  }

  void onPageChanged(int index) {
    state = state.copyWith(currentPageIndex: index);
    ref.read(historyProvider.notifier).updateReadIndex(state.gid, index);
  }

  Future<void> comment() async {
    final String comment = commentEditingController.text.trim();
    if (comment.isEmpty) {
      return;
    }
    final result = await postComment(
      gid: state.gid,
      comment: comment,
      csrfToken: state.csrfToken,
    );
    final success = result.ok;
    final Comment? commentData = result.comment;
    if (success) {
      commentEditingController.clear();
      state = state.copyWith(comments: [commentData!, ...state.comments]);
      loadData(refresh: true);
    }
  }
}

@riverpod
class PageState extends _$PageState {
  @override
  GalleryViewState build(int gid) =>
      const GalleryViewState(pageStatus: PageStatus.none);

  void update(GalleryViewState Function(GalleryViewState) cb) {
    state = cb(state);
  }
}

@Riverpod(keepAlive: true)
class ThumbHeroTagPrefix extends _$ThumbHeroTagPrefix {
  @override
  String build() => '';

  void set(String value) => state = value;
}

final _gidList = <int>[];
void pushGalleryPage(int gid) {
  _gidList.add(gid);
  logger.t('pushGalleryPage $_gidList');
}

void popGalleryPage() {
  _gidList.removeLast();
  logger.t('popGalleryPage $_gidList');
}

int get currentGalleryGid {
  return _gidList.lastOrNull ?? 0;
}

String getGalleryImageUrl(String imageKey, int index, String ext) {
  return 'https://i.nhentai.net/galleries/$imageKey/${index + 1}.$ext';
}
