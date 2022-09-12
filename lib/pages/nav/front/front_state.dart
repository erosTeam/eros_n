import 'package:eros_n/models/index.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:get/get.dart';

class FrontState {
  FrontState() {
    ///Initialize variables
  }

  final galleryProviders = <GalleryProvider>[].obs;

  final _currentPage = 1.obs;
  int get currentPage => _currentPage.value;
  set currentPage(int val) => _currentPage.value = val;

  final _status = LoadStatus.loading.obs;
  LoadStatus get status => _status.value;
  set status(LoadStatus val) => _status.value = val;

  bool get isLoadMore => status == LoadStatus.loadingMore;
  bool get isLoading => status == LoadStatus.loading;
  bool get isLoadEmpty => status == LoadStatus.empty;
  bool get isLoadError => status == LoadStatus.error;
  bool get isLoadSuccess => status == LoadStatus.success;
}
