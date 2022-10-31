import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/read/read_state.dart';
import 'package:eros_n/pages/read/read_view.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_android_volume_keydown/flutter_android_volume_keydown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../utils/logger.dart';

class ReadNotifier extends StateNotifier<ReadState> {
  ReadNotifier(super.state, this.ref)
      : preloadPageController = PreloadPageController(
            initialPage:
                ref.read(galleryProvider(currentGalleryGid)).currentPageIndex,
            keepPage: true);
  final Ref ref;

  final PreloadPageController preloadPageController;

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  bool get isPageView {
    return ref.watch(settingsProvider.select((s) => s.readModelPageView));
  }

  int get currentPageIndex {
    return ref.read(galleryProvider(currentGalleryGid)).currentPageIndex;
  }

  int get totPageCount {
    return ref.read(galleryProvider(currentGalleryGid)).images.pages.length;
  }

  bool get isRightToLeft {
    return ref.read(settingsProvider).readModel == ReadModel.rightToLeft;
  }

  void toPrev() {
    if (isPageView) {
      preloadPageController.previousPage(
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    } else {
      itemScrollController.scrollTo(
          index: max(0, currentPageIndex - 1),
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease);
    }
  }

  void toNext() {
    if (isPageView) {
      preloadPageController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    } else {
      itemScrollController.scrollTo(
          index: min(totPageCount - 1, currentPageIndex + 1),
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease);
    }
  }

  void tapLeft() {
    if (isRightToLeft) {
      toNext();
    } else {
      toPrev();
    }
  }

  void tapRight() {
    if (isRightToLeft) {
      toPrev();
    } else {
      toNext();
    }
  }

  void jumpToPage(int index) {
    if (isPageView) {
      preloadPageController.jumpToPage(index);
    } else {
      itemScrollController.jumpTo(index: index);
    }
  }

  Future<void> handOnTapCenter(BuildContext context) async {
    logger.v('handOnTapCenter');

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

    offsetTopHide = -kTopBarHeight -
        max(MediaQueryData.fromWindow(window).padding.top,
            context.mediaQueryPadding.top);

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
      });
    }
  }

  Future<void> unFullscreen() async {
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    await 100.milliseconds.delay();
  }

  bool conditionItemIndex = true;
  int tempIndex = 0;
  int minImageIndex = 0;
  int maxImageIndex = 0;

  /// 竖屏阅读下页码变化的监听
  void handItemPositionsChange(
    Iterable<ItemPosition> positions, {
    ValueChanged<int>? onChanged,
  }) {
    int min;
    int max;
    if (positions.isNotEmpty) {
      // Determine the first visible item by finding the item with the
      // smallest trailing edge that is greater than 0.  i.e. the first
      // item whose trailing edge in visible in the viewport.
      min = positions
          .where((ItemPosition position) => position.itemTrailingEdge > 0)
          .reduce((ItemPosition min, ItemPosition position) =>
              position.itemTrailingEdge < min.itemTrailingEdge ? position : min)
          .index;
      // Determine the last visible item by finding the item with the
      // greatest leading edge that is less than 1.  i.e. the last
      // item whose leading edge in visible in the viewport.
      max = positions
          .where((ItemPosition position) => position.itemLeadingEdge < 1)
          .reduce((ItemPosition max, ItemPosition position) =>
              position.itemLeadingEdge > max.itemLeadingEdge ? position : max)
          .index;

      tempIndex = (min + max) ~/ 2;
      // logger.d('max $max  min $min tempIndex ${vState.tempIndex}');

      minImageIndex = min;
      maxImageIndex = max;

      onChanged?.call(tempIndex);
    }
  }

  StreamSubscription? _volumeKeyDownSubscription;

  void addVolumeKeydownListen() {
    logger.d('addVolumeKeydownListen');
    final volumeKeyTurnPage =
        ref.read(settingsProvider.select((s) => s.volumeKeyTurnPage));
    if (volumeKeyTurnPage) {
      _volumeKeyDownSubscription =
          FlutterAndroidVolumeKeydown.stream.listen((event) {
        if (event == HardwareButton.volume_down) {
          toNext();
        } else if (event == HardwareButton.volume_up) {
          toPrev();
        }
      });
    }
  }

  void closeVolumeKeydownListen() {
    logger.d('closeVolumeKeydownListen');
    _volumeKeyDownSubscription?.cancel();
  }

  Timer? _autoReadTimer;

  void toggleAutoRead() {
    if (state.autoRead) {
      stopAutoRead();
    } else {
      startAutoRead();
    }
  }

  void stopAutoRead() {
    state = state.copyWith(autoRead: false);
    _autoReadTimer?.cancel();
    _autoReadTimer = null;
  }

  void startAutoRead() {
    state = state.copyWith(autoRead: true);
    _autoReadTimer?.cancel();
    _autoReadTimer = null;

    final autoReadInterval =
        ref.read(settingsProvider.select((s) => s.autoReadInterval));
    final autoReadDuration =
        Duration(milliseconds: (autoReadInterval * 1000).round());

    _autoReadTimer = Timer.periodic(
      autoReadDuration,
      (timer) async {
        if (state.autoRead) {
          toNext();
        } else {
          timer.cancel();
        }
      },
    );
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
