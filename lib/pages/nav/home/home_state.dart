import 'package:flutter/widgets.dart';

@immutable
class HomeState {
  HomeState({this.selectedIndex = 0});

  final int selectedIndex;

  final PageController pageController = PageController();

  HomeState cpoyWith({int? selectedIndex}) {
    return HomeState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
