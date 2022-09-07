import 'package:get/get.dart';

class HomeState {
  HomeState() {
    ///Initialize variables
  }

  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int val) => _selectedIndex.value = val;
}
