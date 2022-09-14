import 'package:flutter/widgets.dart';

@immutable
class IndexState {
  IndexState({this.selectedIndex = 0});

  final int selectedIndex;

  final PageController pageController = PageController();

  IndexState cpoyWith({int? selectedIndex}) {
    return IndexState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
