import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/dialog/cf_dialog.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/pages/nav/front/front_provider.dart';
import 'package:eros_n/pages/nav/front/front_state.dart';
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
      ref.read(searchGallerysProvider.notifier);

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
    if (state.isLoading || state.isLoadMore) {
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
        state = state.copyWith(status: LoadStatus.loading);
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
    } on HttpException catch (e) {
      logger.d('state.status ${state.status}');
      if (showWebViewDialogOnFail &&
          (e.code == 403 || e.code == 503) &&
          state.status != LoadStatus.getToken) {
        logger.e('code ${e.code}');
        // if (!mounted) {
        //   return false;
        // }
        state = state.copyWith(status: LoadStatus.getToken);
        await showInAppWebViewDialog(
          statusCode: e.code,
          onComplete: () async => await getGalleryData(
            refresh: refresh,
            showWebViewDialogOnFail: false,
            next: next,
            prev: prev,
          ),
        );
        state = state.copyWith(status: LoadStatus.none);
      } else {
        state = state.copyWith(status: LoadStatus.error);
        rethrow;
      }
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

final searchGallerysProvider =
    StateNotifierProvider<SearchGalleryNotifier, List<Gallery>>(
        (ref) {
  return SearchGalleryNotifier();
});

final searchProvider =
    StateNotifierProvider<SearchNotifier, FrontState>(
        (ref) {
  return SearchNotifier(ref);
});
