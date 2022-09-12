import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeState {
  HomeState() {
    ///Initialize variables

    ever<int>(_selectedIndex, (val) => pageController.jumpToPage(val));
  }

  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int val) => _selectedIndex.value = val;

  final PageController pageController = PageController();
}
