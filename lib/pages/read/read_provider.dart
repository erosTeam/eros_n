import 'dart:math';
import 'dart:ui';

import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/network/request.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/pages/read/read_state.dart';
import 'package:eros_n/pages/read/read_view.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/logger.dart';

class ReadNotifier extends StateNotifier<ReadState> {
  ReadNotifier(this.ref) : super(const ReadState());
  final Ref ref;

  GalleryNotifier get galleryNotifier =>
      ref.read(galleryProvider(state.gid).notifier);

  void setGid(int? gid) {
    state = state.copyWith(gid: gid);
  }

  void toPrev() {}

  void toNext() {}

  void tapLeft() {}

  void tapRight() {}

  void handOnTapCenter() {
    logger.d('handOnTapCenter');
    if (state.showAppBar) {
      hideAppBar();
    } else {
      showAppBar();
    }
  }

  void init(BuildContext context) {
    final bottomBarHeight = context.mediaQueryPadding.bottom +
        (!context.isTablet ? kBottomBarHeight : 0) +
        kSliderBarHeight +
        (state.showThumbList ? kThumbListViewHeight : 0);

    final paddingTop = max(MediaQueryData.fromWindow(window).padding.top, context.mediaQueryPadding.top);
    _offsetTopHide = -kTopBarHeight - paddingTop;
    logger.d('init _offsetTopHide $_offsetTopHide');

    state = state.copyWith(
      bottomBarHeight: bottomBarHeight,
      context: context,
      topBarOffset: _offsetTopHide,
      bottomBarOffset: -bottomBarHeight,
    );
  }

  late double _offsetTopHide;

  void showAppBar() {
    state = state.copyWith(
      showAppBar: true,
      bottomBarOffset: 0,
      topBarOffset: 0,
    );
  }

  void hideAppBar() {
    state = state.copyWith(
      showAppBar: false,
      bottomBarOffset: -(state.bottomBarHeight ?? 0),
      topBarOffset: _offsetTopHide,
    );
  }
}

final readProvider = StateNotifierProvider<ReadNotifier, ReadState>((ref) {
  return ReadNotifier(ref);
});
