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
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../utils/logger.dart';

class ReadNotifier extends StateNotifier<ReadState> {
  ReadNotifier(this.ref)
      : preloadPageController = PreloadPageController(
            initialPage: ref
                .read(galleryProvider(ref.read(currentGidProvider)))
                .currentPageIndex),
        super(const ReadState());
  final Ref ref;

  final PreloadPageController preloadPageController;

  void toPrev() {}

  void toNext() {}

  void tapLeft() {}

  void tapRight() {}

  void jumpToPage(int index) {
    preloadPageController.jumpToPage(index);
  }

  void handOnTapCenter() {
    logger.d('handOnTapCenter');
    if (state.showAppBar) {
      hideAppBar();
    } else {
      showAppBar();
    }
  }

  void init(BuildContext context, int index) {
    final bottomBarHeight = context.mediaQueryPadding.bottom +
        (!context.isTablet ? kBottomBarHeight : 0) +
        kSliderBarHeight +
        (state.showThumbList ? kThumbListViewHeight : 0);

    _offsetTopHide =
        -kTopBarHeight - MediaQueryData.fromWindow(window).padding.top;
    logger.d('init _offsetTopHide $_offsetTopHide');

    state = state.copyWith(
      bottomBarHeight: bottomBarHeight,
      context: context,
      topBarOffset: _offsetTopHide,
      bottomBarOffset: -bottomBarHeight,
      showAppBar: false,
    );

    setFullscreen();
  }

  late double _offsetTopHide;

  void showAppBar() {
    state = state.copyWith(
      showAppBar: true,
      bottomBarOffset: 0,
      topBarOffset: 0,
    );
    unFullscreen();
  }

  void hideAppBar() {
    state = state.copyWith(
      showAppBar: false,
      bottomBarOffset: -(state.bottomBarHeight ?? 0),
      topBarOffset: _offsetTopHide,
    );
    setFullscreen();
  }

  void setFullscreen() {
    final fullScreenReader = ref.watch(settingsProvider).fullScreenReader;
    if (fullScreenReader) {
      400.milliseconds.delay(() {
        SystemChrome.setEnabledSystemUIMode(
          SystemUiMode.immersiveSticky,
        );
      });
    }
  }

  void unFullscreen() {
    400.milliseconds.delay(() {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.edgeToEdge,
      );
    });
  }
}

final readProvider =
    StateNotifierProvider.autoDispose<ReadNotifier, ReadState>((ref) {
  ref.onDispose(() {
    logger.d('readProvider dispose');
  });
  return ReadNotifier(ref);
});
