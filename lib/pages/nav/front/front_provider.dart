import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/component/models/gallery_set.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/nav/front/list_view_state.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'front_provider.g.dart';

// Shared list-mutation behaviour previously provided by `GallerysNotifier`.
// Each generated `_$FooNotifier` extends `$Notifier<List<Gallery>>`, so we
// can hang the helpers off of the framework `Notifier` and pick them up via
// extension instead of class inheritance (which `@riverpod`'s sealed
// `_$Foo` base class disallows).
mixin GalleryListOps<T> {
  List<T> get state;
  set state(List<T> value);

  void addGallerys(List<T> gallerys) {
    state = [...state, ...gallerys];
  }

  void insertGallerys(List<T> gallerys) {
    state = [...gallerys, ...state];
  }

  void clearGallerys() {
    state = [];
  }
}

@Riverpod(keepAlive: true)
class GallerysNotifier extends _$GallerysNotifier
    with GalleryListOps<Gallery> {
  @override
  List<Gallery> build() => [];
}

@Riverpod(keepAlive: true)
class PopularNotifier extends _$PopularNotifier with GalleryListOps<Gallery> {
  @override
  List<Gallery> build() => [];
}

@Riverpod(keepAlive: true)
class FrontNotifier extends _$FrontNotifier {
  @override
  ListViewState build() => const ListViewState();

  GallerysNotifier get _gallerysNoti => ref.read(gallerysProvider.notifier);

  PopularNotifier get _popularNoti => ref.read(popularProvider.notifier);

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

    logger.t('page: $page, next: $next, prev: $prev, first: $first');

    final rCookies = await Global.cookieJar.loadForRequest(
      Uri.parse(NHConst.baseUrl),
    );
    logger.t('bf rCookies \n${rCookies.map((e) => e.toString()).join('\n')}');

    if (next) {
      if (state.curPage == state.maxPage) {
        return false;
      }
      state = state.copyWith(status: LoadStatus.loadingMore);
    } else if (prev) {
      state = state.copyWith(status: LoadStatus.loadingMore);
    } else {
      if (_gallerysNoti.state.isEmpty) {
        state = state.copyWith(status: LoadStatus.loading);
      }
    }

    final toPage =
        page ?? (next ? state.curPage + 1 : (prev ? state.curPage - 1 : 1));
    logger.t('toPage: $toPage');

    try {
      // Popular galleries live on a dedicated v2 endpoint and only matter
      // for the first page; fire-and-forget so a slow popular response
      // can't block the main listing.
      if (toPage == 1 || refresh || first) {
        getPopularList(refresh: refresh || next || prev)
            .then((set) {
              final populars = set.populars ?? const [];
              _popularNoti.clearGallerys();
              _popularNoti.addGallerys(populars);
            })
            .catchError((Object e) {
              logger.w('getPopularList failed (non-fatal): $e');
            });
      }

      final filter = ref.read(settingsProvider).frontLanguagesFilter;
      final sort = ref.read(settingsProvider).searchSortOnFrontPage;

      // When a language filter is active, use the search endpoint with a
      // `language:xxx` qualifier. When language is "all" but sort is
      // non-default (i.e. not "recent"), the search endpoint is still needed
      // to pass the sort parameter — but it rejects an empty query. Use a
      // random UUID negative-query (`-"<uuid>"`) as a no-op filter that
      // effectively matches all galleries while satisfying the non-empty
      // query requirement. When both are default, use the lighter
      // `/api/v2/galleries` endpoint with no extra params.
      final GallerySet gallerySet;
      if (filter != LanguagesFilter.all) {
        gallerySet = await searchGallery(
          refresh: refresh || next || prev,
          page: toPage,
          query: 'language:${filter.value}',
          sort: sort,
        );
      } else if (sort != SearchSort.recent) {
        final noopQuery = '-"${const Uuid().v4()}"';
        gallerySet = await searchGallery(
          refresh: refresh || next || prev,
          page: toPage,
          query: noopQuery,
          sort: sort,
        );
      } else {
        gallerySet = await getGalleryList(
          refresh: refresh || next || prev,
          page: toPage,
        );
      }

      final gallerys = gallerySet.gallerys ?? [];

      if (next) {
        _gallerysNoti.addGallerys(gallerys);
      } else if (prev) {
        _gallerysNoti.insertGallerys(gallerys);
      } else {
        _gallerysNoti.clearGallerys();
        _gallerysNoti.addGallerys(gallerys);
      }

      state = state.copyWith(
        maxPage: gallerySet.maxPage ?? 1,
        status: LoadStatus.success,
        curPage: toPage,
      );

      return gallerySet.fromCache ?? false;
    } on Exception catch (e) {
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
      await reloadData();
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
