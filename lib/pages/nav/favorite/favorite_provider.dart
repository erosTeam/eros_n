import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/nav/front/list_view_state.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../front/front_provider.dart';

class FavoriteNotifier extends StateNotifier<ListViewState> {
  FavoriteNotifier(this.ref) : super(const ListViewState());
  final Ref ref;

  FavoriteGalleryNotifier get favoriteGalleryNotifier =>
      ref.read(favoriteGallerysProvider.notifier);

  Future<bool> getGalleryData({
    bool refresh = false,
    bool showWebViewDialogOnFail = true,
    int? page,
    bool next = false,
    bool prev = false,
    bool first = false,
  }) async {
    if (state.isLoading) {
      return false;
    }

    if (next && state.isLoadMore) {
      return false;
    }

    final rCookies =
        await Global.cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
    logger.d('bf rCookies \n${rCookies.map((e) => e.toString()).join('\n')}');

    if (next) {
      if (state.curPage == state.maxPage) {
        return false;
      }
      state = state.copyWith(status: LoadStatus.loadingMore);
    } else if (prev) {
      state = state.copyWith(status: LoadStatus.loadingMore);
    } else {
      if (favoriteGalleryNotifier.state.isEmpty) {
        state = state.copyWith(status: LoadStatus.loading);
      }
    }

    final toPage =
        page ?? (next ? state.curPage + 1 : (prev ? state.curPage - 1 : 1));

    try {
      final gallerySet = await getFavoriteList(
        refresh: refresh || next || prev,
        page: toPage,
      );
      final favorites = gallerySet.favorites ?? [];
      logger.v('favorites.length ${favorites.length}');

      if (next) {
        favoriteGalleryNotifier.addGallerys(favorites);
      } else if (prev) {
        favoriteGalleryNotifier.insertGallerys(favorites);
      } else {
        favoriteGalleryNotifier.clearGallerys();
        favoriteGalleryNotifier.addGallerys(favorites);
      }

      state = state.copyWith(
        maxPage: gallerySet.maxPage ?? 1,
        status: LoadStatus.success,
        curPage: toPage,
      );

      return gallerySet.fromCache ?? false;
    } on Exception catch (e) {
      logger.d('state.status ${state.status}');
      state = state.copyWith(
        status: LoadStatus.error,
        errorMessage: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> loadData() async {
    final fromCache = await getGalleryData(first: true);
    if (fromCache) {
      await 1.seconds.delay();
      await getGalleryData(refresh: true);
    }
  }

  Future<void> reloadData() async {
    await getGalleryData(refresh: true, page: 1);
  }

  Future<void> loadNextPage() async {
    await getGalleryData(next: true);
  }

  Future<void> loadPrevPage() async {
    await getGalleryData(prev: true);
  }

  Future<void> loadFromPage(int page) async {
    await getGalleryData(refresh: true);
  }
}

class FavoriteGalleryNotifier extends GallerysNotifier {
  FavoriteGalleryNotifier() : super([]);
}

final favoriteGallerysProvider =
    StateNotifierProvider<FavoriteGalleryNotifier, List<Gallery>>((ref) {
  return FavoriteGalleryNotifier();
});

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, ListViewState>((ref) {
  return FavoriteNotifier(ref);
});
