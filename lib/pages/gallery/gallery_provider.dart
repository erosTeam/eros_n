import 'package:eros_n/component/dialog/cf_dialog.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'gallery_page_state.dart';

class GalleryNotifier extends StateNotifier<Gallery> {
  GalleryNotifier(super.state, this.ref);

  final Ref ref;

  void initFromGallery(Gallery gallery) {
    logger.d('${gallery.toString()} ');
    state = state.copyWith(
      thumbUrl: gallery.thumbUrl,
      thumbWidth: gallery.thumbWidth,
      thumbHeight: gallery.thumbHeight,
      gid: gallery.gid,
      title: gallery.title,
      url: gallery.url,
      imageKey: gallery.imageKey,
    );

    loadData();
  }

  void setInitialPage(int page) {
    state = state.copyWith(currentPageIndex: page);
  }

  Future<void> loadData({bool refresh = false}) async {
    if (state.images.isEmpty) {
      ref
          .read(pageStateProvider(state.gid).notifier)
          .update((state) => state.copyWith(pageStatus: PageStatus.loading));
    }

    try {
      final gallery = await getGalleryDetail(
        url: state.url ?? '',
        refresh: refresh,
      );
      state = state.copyWith(
        images: gallery.images,
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
  }

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
    StateNotifierProvider.family<GalleryNotifier, Gallery, String?>(
  (ref, gid) {
    return GalleryNotifier(Gallery(gid: gid), ref);
  },
);

final pageStateProvider =
    StateProvider.family<GalleryViewState, String?>((ref, gid) {
  return const GalleryViewState(pageStatus: PageStatus.none);
});

String getGalleryImageUrl(String imageKey, int index) {
  final subDomain = radomList(['', '3', '5', '7']);
  return 'https://i.nhentai.net/galleries/$imageKey/${index + 1}.jpg';
  // return 'https://i$subDomain.nhentai.net/galleries/$imageKey/${index + 1}.jpg';
}
