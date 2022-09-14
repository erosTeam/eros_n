import 'package:eros_n/utils/logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'home_state.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(HomeState());

  void setIndex(int index) {
    state.pageController.jumpToPage(index);
    state = state.cpoyWith(selectedIndex: index);
  }
}

final homeProvider = StateNotifierProvider<HomeNotifier, HomeState>((ref) {
  return HomeNotifier();
});
