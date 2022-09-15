import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/dialog/cf_dialog.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../network/app_dio/pdio.dart';
import 'front_state.dart';

class GallerysNotifier extends StateNotifier<List<Gallery>> {
  GallerysNotifier(super.create);

  void addGallerys(List<Gallery> gallerys) {
    state = [...state, ...gallerys];
  }

  void insertGallerys(List<Gallery> gallerys) {
    state = [...gallerys, ...state];
  }

  void clearGallerys() {
    state = [];
  }
}

final gallerysProvider =
    StateNotifierProvider<GallerysNotifier, List<Gallery>>((ref) {
  return GallerysNotifier([]);
});

class FrontNotifier extends StateNotifier<FrontState> {
  FrontNotifier(this.ref) : super(const FrontState());

  final Ref ref;

  GallerysNotifier get gallerysNoti => ref.read(gallerysProvider.notifier);

  Future<void> getGalleryData({
    bool refresh = false,
    bool showWebViewDialogOnFail = true,
    int? page,
    bool next = false,
    bool prev = false,
  }) async {
    if (state.isLoading || state.isLoadMore) {
      return;
    }

    final rCookies =
        await Global.cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
    logger.d('bf rCookies \n${rCookies.map((e) => e.toString()).join('\n')}');

    if (next) {
      if (state.curPage == state.maxPage) {
        return;
      }
      state = state.copyWith(status: LoadStatus.loadingMore);
    } else if (prev) {
      state = state.copyWith(status: LoadStatus.loadingMore);
    } else {
      if (gallerysNoti.state.isEmpty) {
        state = state.copyWith(status: LoadStatus.loading);
      }
    }

    final toPage =
        page ?? (next ? state.curPage + 1 : (prev ? state.curPage - 1 : 1));

    try {
      final galleryList = await getGalleryList(
        refresh: refresh || next || prev,
        page: toPage,
      );
      final gallerys = galleryList.gallerys ?? [];

      if (next) {
        gallerysNoti.addGallerys(gallerys);
      } else if (prev) {
        gallerysNoti.insertGallerys(gallerys);
      } else {
        gallerysNoti.clearGallerys();
        gallerysNoti.addGallerys(gallerys);
      }

      state = state.copyWith(
        maxPage: galleryList.maxPage ?? 1,
        status: LoadStatus.success,
        curPage: toPage,
      );
    } on HttpException catch (e) {
      state = state.copyWith(status: LoadStatus.none);
      if (showWebViewDialogOnFail && (e.code == 403 || e.code == 503)) {
        logger.e('code ${e.code}');
        if (!mounted) {
          return;
        }
        await showInAppWebViewDialog(
          statusCode: e.code,
          onComplete: () async => await getGalleryData(
            refresh: refresh,
            showWebViewDialogOnFail: false,
            next: next,
            prev: prev,
          ),
        );
      } else {
        state = state.copyWith(status: LoadStatus.error);
        rethrow;
      }
    }
  }

  Future<void> loadData() async {
    await getGalleryData();
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

final frontProvider = StateNotifierProvider<FrontNotifier, FrontState>((ref) {
  return FrontNotifier(ref);
});
