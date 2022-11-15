import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/enum.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/nav/front/front_provider.dart';
import 'package:eros_n/pages/nav/front/list_view_state.dart';
import 'package:eros_n/store/db/entity/nh_tag.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class SearchNotifier extends StateNotifier<ListViewState> {
  SearchNotifier(this.ref) : super(const ListViewState());
  final Ref ref;
  String query = '';

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  SearchGalleryNotifier get searchGalleryNotifier =>
      ref.read(searchGallerysProvider(currentSearchDepth).notifier);

  void appendNhTagQuery(NhTag tag, {bool search = false}) {
    late String newQuery;
    if ((tag.name ?? '').contains(' ')) {
      newQuery = '${tag.type}:"${tag.name}"';
    } else {
      newQuery = '${tag.type}:${tag.name}';
    }

    final currQryText = searchController.text.split(RegExp(r'[ ;"]')).last;

    newQuery =
        searchController.text.replaceFirst(RegExp('$currQryText\$'), newQuery);

    searchController.value = TextEditingValue(
      text: '$newQuery ',
      selection: TextSelection.collapsed(offset: '$newQuery '.length),
    );

    // searchController.text = '$newQuery ';
    // searchController.selection =
    //     TextSelection.collapsed(offset: '$newQuery '.length);
    if (search) {
      searchFocusNode.unfocus();
      this.search();
    } else {
      searchFocusNode.requestFocus();
    }
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
      if (searchGalleryNotifier.state.isEmpty || first) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state = state.copyWith(status: LoadStatus.loading);
        });
      }
    }

    final toPage =
        page ?? (next ? state.curPage + 1 : (prev ? state.curPage - 1 : 1));

    late final String realQuery;

    // final queryUuid = '-"${const Uuid().v4()}"';
    final searchLanguagesFilter =
        ref.read(settingsProvider.select((s) => s.searchLanguagesFilter));
    if (searchLanguagesFilter != LanguagesFilter.all && query.isNotEmpty) {
      realQuery = '$query language:${searchLanguagesFilter.value}';
    } else {
      realQuery = query;
    }

    try {
      final result = await searchGallery(
        query: realQuery,
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
      state = state.copyWith(
        status: LoadStatus.error,
        errorMessage: e.toString(),
      );
      logger.d('state.status ${state.status}');
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
    StateNotifierProvider.family<SearchNotifier, ListViewState, int>(
        (ref, depth) {
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
