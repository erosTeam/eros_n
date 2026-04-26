import 'dart:async';

import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/nav/front/front_provider.dart';
import 'package:eros_n/pages/nav/front/list_view_state.dart';
import 'package:eros_n/pages/nav/search/search_history_provider.dart';
import 'package:eros_n/store/db/entity/nh_tag.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
class SearchGallerys extends _$SearchGallerys with GalleryListOps<Gallery> {
  @override
  List<Gallery> build(int depth) {
    ref.onDispose(() {
      logger.d('searchGallerysProvider $depth dispose');
    });
    return [];
  }
}

@Riverpod(keepAlive: true)
class SearchNotifier extends _$SearchNotifier {
  String _query = '';

  late final TextEditingController searchController;
  late final FocusNode searchFocusNode;

  @override
  ListViewState build(int depth) {
    searchController = TextEditingController();
    searchFocusNode = FocusNode();
    ref.onDispose(() {
      searchController.dispose();
      searchFocusNode.dispose();
    });
    return const ListViewState();
  }

  String get query => _query;

  SearchGallerys get _searchGalleryNotifier =>
      ref.read(searchGallerysProvider(currentSearchDepth).notifier);

  void appendNhTagQuery(NhTag tag, {bool search = false}) {
    // Always emit the singular form; nhentai search syntax is `tag:`,
    // `parody:`, etc. Old cached entries may still hold the plural form.
    final type = singularizeTagType(tag.type ?? '');
    late String newQuery;
    if ((tag.name ?? '').contains(' ')) {
      newQuery = '$type:"${tag.name}"';
    } else {
      newQuery = '$type:${tag.name}';
    }

    final currQryText = searchController.text.split(RegExp(r'[ ;"]')).last;

    newQuery = searchController.text.replaceFirst(
      RegExp('$currQryText\$'),
      newQuery,
    );

    searchController.value = TextEditingValue(
      text: '$newQuery ',
      selection: TextSelection.collapsed(offset: '$newQuery '.length),
    );

    objectBoxHelper.updateNhTagTime(tag.id);

    if (search) {
      searchFocusNode.unfocus();
      this.search();
    } else {
      searchFocusNode.requestFocus();
    }
  }

  Future<void> search() async {
    _query = searchController.text;
    if (_query.trim().isEmpty) {
      return;
    }
    // Record before firing so the entry is kept even when the request fails.
    // Awaited so that the Hive flush completes before the provider/page might
    // be disposed; unawaited futures can be dropped under memory pressure.
    await ref.read(searchHistoryProvider.notifier).add(_query);
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

    if (_query.trim().isEmpty) {
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
      if (_searchGalleryNotifier.state.isEmpty || first) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          state = state.copyWith(status: LoadStatus.loading);
        });
      }
    }

    final toPage =
        page ?? (next ? state.curPage + 1 : (prev ? state.curPage - 1 : 1));

    late final String realQuery;

    final searchLanguagesFilter = ref.read(
      settingsProvider.select((s) => s.searchLanguagesFilter),
    );
    if (searchLanguagesFilter != LanguagesFilter.all && _query.isNotEmpty) {
      realQuery = '$_query language:${searchLanguagesFilter.value}';
    } else {
      realQuery = _query;
    }

    try {
      final result = await searchGallery(
        query: realQuery,
        page: toPage,
        refresh: refresh || next || prev,
        sort: ref.read(settingsProvider).searchSort,
      );
      final galleryList = result.gallerys ?? [];
      if (next) {
        _searchGalleryNotifier.addGallerys(galleryList);
      } else if (prev) {
        _searchGalleryNotifier.insertGallerys(galleryList);
      } else {
        _searchGalleryNotifier.clearGallerys();
        _searchGalleryNotifier.addGallerys(galleryList);
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

final _searchDepthList = <int>[0];
int get currentSearchDepth {
  return _searchDepthList.last;
}

void pushSearchDepth() {
  _searchDepthList.add(_searchDepthList.last + 1);
}

void popSearchDepth() {
  _searchDepthList.removeLast();
}
