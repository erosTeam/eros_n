import 'package:eros_n/models/index.dart';
import 'package:eros_n/pages/enum.dart';
import 'package:get/get.dart';

class FrontState {
  FrontState() {
    ///Initialize variables
  }

  final galleryProviders = <GalleryProvider>[].obs;

  final _curPage = 1.obs;
  int get curPage => _curPage.value;
  set curPage(int val) => _curPage.value = val;

  final _maxPage = 1.obs;
  int get maxPage => _maxPage.value;
  set maxPage(int val) => _maxPage.value = val;

  final _status = LoadStatus.loading.obs;
  LoadStatus get status => _status.value;
  set status(LoadStatus val) => _status.value = val;

  bool get isLoadMore => status == LoadStatus.loadingMore;
  bool get isLoading => status == LoadStatus.loading;
  bool get isLoadEmpty => status == LoadStatus.empty;
  bool get isLoadError => status == LoadStatus.error;
  bool get isLoadSuccess => status == LoadStatus.success;
}
