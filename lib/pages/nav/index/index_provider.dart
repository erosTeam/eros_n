import 'package:eros_n/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'index_state.dart';

class IndexNotifier extends StateNotifier<IndexState> {
  IndexNotifier() : super(IndexState());

  void setIndex(int index) {
    state.pageController.jumpToPage(index);
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
}

final indexProvider = StateNotifierProvider<IndexNotifier, IndexState>((ref) {
  return IndexNotifier();
});
