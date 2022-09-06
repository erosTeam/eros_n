import 'package:get/get.dart';

class HomeState {
  HomeState() {
    ///Initialize variables
  }

  final _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;
  set selectedIndex(val) => _selectedIndex.value = val;
}
