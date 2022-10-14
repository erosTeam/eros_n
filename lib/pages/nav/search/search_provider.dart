import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/nav/front/front_provider.dart';
import 'package:eros_n/pages/nav/front/front_state.dart';
import 'package:eros_n/utils/get_utils/extensions/duration_extensions.dart';
import 'package:eros_n/utils/get_utils/extensions/num_extensions.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchNotifier extends StateNotifier<FrontState> {
  SearchNotifier(this.ref) : super(const FrontState());
  final Ref ref;
  String query = '';

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  SearchGalleryNotifier get searchGalleryNotifier =>
      ref.read(searchGallerysProvider(currentSearchDepth).notifier);

  Future<void> setFloatingAppBar(bool floatingAppBar) async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      state = state.copyWith(floatingAppBar: floatingAppBar);
    });
    // await 3.seconds.delay();
    // state = state.copyWith(floatingAppBar: floatingAppBar);
  }

  Future<void> search() async {
    query = searchController.text;
    if (query.trim().isEmpty) {
      return;
    }
    await loadData();
  }

  Future<void> getGalleryData({
    bool refresh = false,
    bool showWebViewDialogOnFail = true,
    int? page,
    bool next = false,
    bool prev = false,
    bool first = false,
  }) async {
    if (state.isLoading) {
      return;
    }

    if (next && state.isLoadMore) {
      return;
    }

    if (query.trim().isEmpty) {
      return;
    }

    if (next) {
      if (state.curPage == state.maxPage) {
        return;
      }
      state = state.copyWith(status: LoadStatus.loadingMore);
    } else if (prev) {
      state = state.copyWith(status: LoadStatus.loadingMore);
    } else {
      if (searchGalleryNotifier.state.isEmpty) {
        // state = state.copyWith(status: LoadStatus.loading);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state = state.copyWith(status: LoadStatus.loading);
        });
      }
    }

    final toPage =
        page ?? (next ? state.curPage + 1 : (prev ? state.curPage - 1 : 1));

    try {
      final result = await searchGallery(
        query: query,
        page: toPage,
        refresh: refresh || next || prev,
        sort: ref.read(settingsProvider).searchSort,
      );
      final galleryList = result.gallerys ?? [];
      // logger.d('len: ${galleryList.length}');
      if (next) {
        searchGalleryNotifier.addGallerys(galleryList);
      } else if (prev) {
        searchGalleryNotifier.insertGallerys(galleryList);
      } else {
        searchGalleryNotifier.clearGallerys();
        searchGalleryNotifier.addGallerys(galleryList);
      }
      state = state.copyWith(
        maxPage: result.maxPage ?? 1,
        status: LoadStatus.success,
        curPage: toPage,
      );
    } on Exception catch (e) {
      logger.d('state.status ${state.status}');
      state = state.copyWith(status: LoadStatus.error);
      rethrow;
    }
  }

  Future<void> loadData() async {
    await getGalleryData(first: true, refresh: true);
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

class SearchGalleryNotifier extends GallerysNotifier {
  SearchGalleryNotifier() : super([]);
}

final searchGallerysProvider = StateNotifierProvider.autoDispose
    .family<SearchGalleryNotifier, List<Gallery>, int>((ref, depth) {
  ref.onDispose(() {
    logger.d('searchGallerysProvider $depth dispose');
  });
  return SearchGalleryNotifier();
});

final searchProvider =
    StateNotifierProvider.family<SearchNotifier, FrontState, int>((ref, depth) {
  return SearchNotifier(ref);
});

final _searchDepthList = <int>[0];
int get currentSearchDepth {
  return _searchDepthList.last;
}

void pushSearchDepth() {
  _searchDepthList.add(_searchDepthList.last + 1);
  logger.d('pushSearchDepth $_searchDepthList');
}

void popSearchDepth() {
  _searchDepthList.removeLast();
  logger.d('popSearchDepth $_searchDepthList');
}
