import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/pages/nav/index/index_state.dart';
import 'package:eros_n/utils/get_utils/extensions/export.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'index_provider.g.dart';

@Riverpod(keepAlive: true)
class IndexNotifier extends _$IndexNotifier {
  final Map<int, ScrollController> scrollControllerMap = {};
  bool tapAwait = false;

  @override
  IndexState build() => IndexState();

  Future<void> setIndex(
    int index, {
    required BuildContext context,
    bool jumpToPage = false,
  }) async {
    if (index == state.selectedIndex) {
      await doubleTapBar(
        duration: const Duration(milliseconds: 800),
        awaitComplete: false,
        onTap: () {
          scrollControllerMap[state.selectedIndex]?.animateTo(
            0,
            duration: 300.milliseconds,
            curve: Curves.ease,
          );
        },
      );
    }

    if (jumpToPage) {
      state.pageController.jumpToPage(index);
    }
    state = state.copyWith(selectedIndex: index);
    showNavigationBar();
  }

  void hideNavigationBar() {
    final controller = scrollControllerMap[state.selectedIndex];
    if (controller == null ||
        !controller.hasClients ||
        controller.position.userScrollDirection != ScrollDirection.reverse) {
      return;
    }
    final hideBottomNavigationOnScroll = ref.read(
      settingsProvider.select(
        (settings) => settings.hideBottomNavigationOnScroll,
      ),
    );
    if (!state.hideNavigationBar && hideBottomNavigationOnScroll) {
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
    logger.t('state.scrollControllerMap len ${scrollControllerMap.length}');
  }

  /// Handle double-tap on the bottom navigation bar.
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
