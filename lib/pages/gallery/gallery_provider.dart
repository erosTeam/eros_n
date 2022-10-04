import 'package:eros_n/component/dialog/cf_dialog.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/nav/history/history_provider.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/get_utils/extensions/duration_extensions.dart';
import 'package:eros_n/utils/get_utils/extensions/num_extensions.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tuple/tuple.dart';

import 'gallery_page_state.dart';

class GalleryNotifier extends StateNotifier<Gallery> {
  GalleryNotifier(super.state, this.ref);

  final Ref ref;

  void initFromGallery(Gallery gallery) {
    logger.d('${gallery.toString()} ');
    state = state.copyWith(
      images: gallery.images,
      gid: gallery.gid,
      title: gallery.title,
      mediaId: gallery.mediaId,
    );

    loadData();
    // add history
    500.milliseconds.delay(() {
      ref.read(historyProvider.notifier).addHistory(gallery);
    });
  }

  void setInitialPage(int page) {
    state = state.copyWith(currentPageIndex: page);
  }

  /// 加载数据
  Future<void> loadData({bool refresh = false}) async {
    logger.d('loadData refresh $refresh  url: ${state.url}');
    if (state.images.pages.isEmpty) {
      ref
          .read(pageStateProvider(state.gid).notifier)
          .update((state) => state.copyWith(pageStatus: PageStatus.loading));
    }

    // 获取画廊数据
    try {
      final gallery = await getGalleryDetail(
        url: state.url,
        refresh: refresh,
      );
      state = gallery.copyWith(
        images: gallery.images.copyWith(
          thumbnail: state.images.thumbnail,
        ),
        gid: state.gid,
        mediaId: state.mediaId,
        currentPageIndex: state.currentPageIndex,
      );
    } on HttpException catch (e) {
      if (e.code == 403 || e.code == 503) {
        logger.e('code ${e.code}');
        if (!mounted) {
          return;
        }
        await showInAppWebViewDialog(
          statusCode: e.code,
          onComplete: () async => await loadData(refresh: refresh),
        );
      } else {
        rethrow;
      }
    } finally {
      ref
          .read(pageStateProvider(state.gid).notifier)
          .update((state) => state.copyWith(pageStatus: PageStatus.none));
    }

    // 获取评论数据
    try {
      final comments = await getGalleryComments(
        gid: state.gid,
        refresh: refresh,
      );
      state = state.copyWith(comments: comments);
    } on HttpException catch (e) {
      if (e.code == 403 || e.code == 503) {
        logger.e('code ${e.code}');
        if (!mounted) {
          return;
        }
        await showInAppWebViewDialog(
          statusCode: e.code,
          onComplete: () async => await loadData(refresh: refresh),
        );
      } else {
        rethrow;
      }
    } finally {
      ref
          .read(pageStateProvider(state.gid).notifier)
          .update((state) => state.copyWith(pageStatus: PageStatus.none));
    }
  }

  /// 收藏
  Future<void> toggleFavorite() async {
    late final Tuple2<bool?, int?> result;
    if (state.isFavorited ?? false) {
      logger.d('取消收藏');
      result = await setFavorite(
        gid: state.gid,
        unfavorite: true,
        csrfToken: state.csrfToken,
      );
    } else {
      logger.d('收藏');
      result = await setFavorite(
        gid: state.gid,
        csrfToken: state.csrfToken,
      );
    }
    final int? numFavorite = result.item2;
    final bool? isFavorite = result.item1;

    if (isFavorite != null && numFavorite != null) {
      state = state.copyWith(
        isFavorited: isFavorite,
        numFavorites: numFavorite,
      );
    }
  }

  /// 重新加载
  Future<void> reloadData() async {
    await loadData(refresh: true);
  }

  void onPageChanged(int index) {
    state = state.copyWith(
      currentPageIndex: index,
    );
  }
}

final galleryProvider =
    StateNotifierProvider.family<GalleryNotifier, Gallery, int?>(
  (ref, gid) {
    return GalleryNotifier(Gallery(gid: gid), ref);
  },
);

final pageStateProvider =
    StateProvider.family<GalleryViewState, int?>((ref, gid) {
  return const GalleryViewState(pageStatus: PageStatus.none);
});

String getGalleryImageUrl(String imageKey, int index, String ext) {
  final subDomain = radomList(['', '3', '5', '7']);
  return 'https://i.nhentai.net/galleries/$imageKey/${index + 1}.$ext';
  // return 'https://i$subDomain.nhentai.net/galleries/$imageKey/${index + 1}.jpg';
}
