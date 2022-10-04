import 'package:flutter/widgets.dart';

@immutable
class IndexState {
  IndexState({this.selectedIndex = 0, this.hideNavigationBar = false});

  final int selectedIndex;

  final bool hideNavigationBar;

  final PageController pageController = PageController();



  IndexState copyWith({int? selectedIndex, bool? hideNavigationBar}) {
    return IndexState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      hideNavigationBar: hideNavigationBar ?? this.hideNavigationBar
    );
  }
}
