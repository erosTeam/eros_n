import 'package:eros_n/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'index_state.dart';

class IndexNotifier extends StateNotifier<IndexState> {
  IndexNotifier() : super(IndexState());

  void setIndex(int index) {
    state.pageController.jumpToPage(index);
    state = state.cpoyWith(selectedIndex: index);
  }
}

final indexProvider = StateNotifierProvider<IndexNotifier, IndexState>((ref) {
  return IndexNotifier();
});
