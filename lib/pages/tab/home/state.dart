import 'package:get/get.dart';

class HomeState {
  HomeState() {
    ///Initialize variables
  }

  // int currentIndex = 0;

  final _currentIndex = 0.obs;
  get currentIndex => _currentIndex.value;
  set currentIndex(val) => _currentIndex.value = val;
}
