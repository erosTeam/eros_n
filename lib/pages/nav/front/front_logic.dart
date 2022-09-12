import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/dialog/cf_dialog.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:get/get.dart';

import 'front_state.dart';

class FrontLogic extends GetxController {
  final FrontState state = FrontState();

  @override
  void onInit() {
    super.onInit();
    getGalleryData();
  }

  Future<void> getGalleryData({
    bool refresh = false,
    bool showWebViewDialogOnFail = true,
    int? page,
    bool next = false,
    bool prev = false,
  }) async {
    final rCookies =
        await Global.cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
    logger.d('bf rCookies \n${rCookies.map((e) => e.toString()).join('\n')}');

    if (refresh) {
      if (state.galleryProviders.isEmpty) {
        state.status = LoadStatus.loading;
      }
    } else if (next) {
      state.status = LoadStatus.loadingMore;
    } else if (prev) {
      state.status = LoadStatus.loadingMore;
    }

    try {
      final galleryList = await getGalleryList(
        refresh: refresh || next || prev,
        page: page,
      );
      logger.d('get first gid ${galleryList.first.gid}');

      if (next) {
        state.status = LoadStatus.loadingMore;
        state.galleryProviders.addAll(galleryList);
      } else if (prev) {
        state.galleryProviders.insertAll(0, galleryList);
      } else {
        if (galleryList.isEmpty) {
          state.status = LoadStatus.empty;
        } else {
          state.galleryProviders.assignAll(galleryList);
          state.status = LoadStatus.success;
        }
      }
    } on HttpException catch (e) {
      if (showWebViewDialogOnFail && (e.code == 403 || e.code == 503)) {
        logger.e('code ${e.code}');
        await showInAppWebViewDialog(
          statusCode: e.code,
          onComplete: () async => await getGalleryData(
            refresh: refresh,
            showWebViewDialogOnFail: false,
            page: page,
            next: next,
            prev: prev,
          ),
        );
      } else {
        state.status = LoadStatus.error;
        rethrow;
      }
    }
  }

  Future<void> reloadData() async {
    await getGalleryData(refresh: true);
  }

  Future<void> loadNextPage() async {
    final toPage = state.currentPage + 1;
    await getGalleryData(next: true, page: toPage);
    state.currentPage = toPage;
  }

  Future<void> loadPrevPage() async {
    final toPage = state.currentPage - 1;
    await getGalleryData(prev: true, page: toPage);
    state.currentPage = toPage;
  }

  Future<void> loadFromPage(int page) async {
    await getGalleryData(page: page, refresh: true);
  }
}
