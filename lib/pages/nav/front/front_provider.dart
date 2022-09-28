import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/dialog/cf_dialog.dart';
import 'package:eros_n/component/models/gallery.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/utils/get_utils/extensions/export.dart';
import 'package:eros_n/utils/logger.dart';
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

class PopularNotifier extends GallerysNotifier {
  PopularNotifier() : super([]);
}

final gallerysProvider =
    StateNotifierProvider<GallerysNotifier, List<Gallery>>((ref) {
  return GallerysNotifier([]);
});

final popularProvider =
    StateNotifierProvider<PopularNotifier, List<Gallery>>((ref) {
  return PopularNotifier();
});

class FrontNotifier extends StateNotifier<FrontState> {
  FrontNotifier(this.ref) : super(const FrontState());

  final Ref ref;

  GallerysNotifier get gallerysNoti => ref.read(gallerysProvider.notifier);

  PopularNotifier get popularNoti => ref.read(popularProvider.notifier);

  Future<bool> getGalleryData({
    bool refresh = false,
    bool showWebViewDialogOnFail = true,
    int? page,
    bool next = false,
    bool prev = false,
    bool first = false,
  }) async {
    if (state.isLoading || state.isLoadMore) {
      return false;
    }

    final rCookies =
        await Global.cookieJar.loadForRequest(Uri.parse(NHConst.baseUrl));
    logger.v('bf rCookies \n${rCookies.map((e) => e.toString()).join('\n')}');

    if (next) {
      if (state.curPage == state.maxPage) {
        return false;
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
      final gallerySet = await getGalleryList(
        refresh: refresh || next || prev,
        page: toPage,
      );
      final populars = gallerySet.populars ?? [];
      final gallerys = gallerySet.gallerys ?? [];

      if (next) {
        gallerysNoti.addGallerys(gallerys);
      } else if (prev) {
        gallerysNoti.insertGallerys(gallerys);
      } else {
        gallerysNoti.clearGallerys();
        gallerysNoti.addGallerys(gallerys);

        popularNoti.clearGallerys();
        popularNoti.addGallerys(populars);
      }

      state = state.copyWith(
        maxPage: gallerySet.maxPage ?? 1,
        status: LoadStatus.success,
        curPage: toPage,
      );

      return gallerySet.fromCache ?? false;
    } on HttpException catch (e) {
      logger.d('state.status ${state.status}');
      if (showWebViewDialogOnFail &&
          (e.code == 403 || e.code == 503) &&
          state.status != LoadStatus.getToken) {
        logger.e('code ${e.code}');
        if (!mounted) {
          return false;
        }
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
    return false;
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

final frontProvider = StateNotifierProvider<FrontNotifier, FrontState>((ref) {
  return FrontNotifier(ref);
});
