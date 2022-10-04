import 'package:eros_n/utils/get_utils/extensions/export.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'index_state.dart';

class IndexNotifier extends StateNotifier<IndexState> {
  IndexNotifier() : super(IndexState());

  final Map<int, ScrollController> scrollControllerMap = {};
  bool tapAwait = false;

  Future<void> setIndex(int index,
      {required BuildContext context, bool jumpToPage = false}) async {
    if (index == state.selectedIndex) {
      // logger.d('state.scrollControllerMap len ${scrollControllerMap.length}');
      await doubleTapBar(
        duration: const Duration(milliseconds: 800),
        awaitComplete: false,
        onTap: () {
          scrollControllerMap[state.selectedIndex]
              ?.animateTo(0, duration: 300.milliseconds, curve: Curves.ease);
        },
      );
    }

    if (jumpToPage) {
      state.pageController.jumpToPage(index);
    }
    state = state.copyWith(selectedIndex: index);
  }

  void hideNavigationBar() {
    if (!state.hideNavigationBar) {
      state = state.copyWith(hideNavigationBar: true);
    }
  }

  void showNavigationBar() {
    if (state.hideNavigationBar) {
      state = state.copyWith(hideNavigationBar: false);
    }
  }

  void addScrollController(ScrollController scrollController) {
    scrollControllerMap[state.selectedIndex] = scrollController;
    logger.d('state.scrollControllerMap len ${scrollControllerMap.length}');
  }

  /// 双击bar的处理
  Future<void> doubleTapBar({
    required VoidCallback onTap,
    VoidCallback? onDoubleTap,
    required Duration duration,
    required bool awaitComplete,
  }) async {
    if (!tapAwait) {
      tapAwait = true;

      if (awaitComplete) {
        await Future<void>.delayed(duration);
        if (tapAwait) {
//        loggerNoStack.v('等待结束 执行单击事件');
          tapAwait = false;
          onTap();
        }
      } else {
        onTap();
        await Future<void>.delayed(duration);
        tapAwait = false;
      }
    } else {
      tapAwait = false;
      onDoubleTap?.call();
    }
  }
}

final indexProvider = StateNotifierProvider<IndexNotifier, IndexState>((ref) {
  return IndexNotifier();
});
