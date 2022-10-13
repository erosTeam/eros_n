import 'dart:ui';

import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/read/read_state.dart';
import 'package:eros_n/pages/read/read_view.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fullscreen/fullscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../utils/logger.dart';

class ReadNotifier extends StateNotifier<ReadState> {
  ReadNotifier(super.state, this.ref)
      : preloadPageController = PreloadPageController(
            initialPage:
                ref.read(galleryProvider(currentGalleryGid)).currentPageIndex);
  final Ref ref;

  final PreloadPageController preloadPageController;

  void toPrev() {
    preloadPageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void toNext() {
    preloadPageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void tapLeft() {
    toPrev();
  }

  void tapRight() {
    toNext();
  }

  void jumpToPage(int index) {
    preloadPageController.jumpToPage(index);
  }

  Future<void> handOnTapCenter(BuildContext context) async {
    logger.d('handOnTapCenter');

    // initBar(context);
    if (state.showAppBar) {
      hideAppBar();
    } else {
      await showAppBar();
      if (mounted) {
        calculateBar(context);
      }
    }
  }

  //
  void calculateBar(BuildContext context) {
    final bottomBarHeight = (!context.isTablet ? kBottomBarHeight : 0) +
        kSliderBarHeight +
        (state.showThumbList ? kThumbListViewHeight : 0) +
        context.mediaQueryPadding.bottom;

    offsetTopHide =
        -kTopBarHeight - MediaQueryData.fromWindow(window).padding.top;

    state = state.copyWith(
      paddingBottom: context.mediaQueryPadding.bottom,
      paddingTop: context.mediaQueryPadding.top,
      bottomBarHeight: bottomBarHeight,
    );
  }

  void resetBottomBarHeight(BuildContext context) {
    final bottomBarHeight = (!context.isTablet ? kBottomBarHeight : 0) +
        kSliderBarHeight +
        (state.showThumbList ? kThumbListViewHeight : 0) +
        context.mediaQueryPadding.bottom;
    if (state.bottomBarHeight != bottomBarHeight) {
      state = state.copyWith(bottomBarHeight: bottomBarHeight);
    }
  }

  late double offsetTopHide;

  Future<void> showAppBar() async {
    await unFullscreen();
    state = state.copyWith(
      showAppBar: true,
      bottomBarOffset: 0,
      topBarOffset: 0,
    );
    // FullScreen.exitFullScreen();
  }

  void hideAppBar() {
    state = state.copyWith(
      showAppBar: false,
      bottomBarOffset: -state.bottomBarHeight,
      topBarOffset: offsetTopHide,
    );
    setFullscreen();
  }

  void setFullscreen() {
    final fullScreenReader =
        ref.watch(settingsProvider.select((s) => s.fullScreenReader));
    if (fullScreenReader) {
      400.milliseconds.delay(() {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.immersiveSticky,
        );
        // FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
      });
    }
  }

  Future<void> unFullscreen() async {
    // await SystemChrome.setEnabledSystemUIMode(
    //   SystemUiMode.edgeToEdge,
    // );
    FullScreen.exitFullScreen();
    await 300.milliseconds.delay();
  }
}

final readProvider =
    StateNotifierProvider.autoDispose<ReadNotifier, ReadState>((ref) {
  ref.onDispose(() {
    logger.d('readProvider dispose');
  });

  const bottomBarHeight =
      kBottomBarHeight + kSliderBarHeight + kThumbListViewHeight;

  return ReadNotifier(
      const ReadState(
        showAppBar: false,
        bottomBarOffset: -bottomBarHeight,
        topBarOffset: -300,
        bottomBarHeight: bottomBarHeight,
      ),
      ref);
});
