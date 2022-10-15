import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/pages/nav/front/list_view_state.dart';
import 'package:eros_n/store/db/entity/gallery_history.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryNotifier extends StateNotifier<ListViewState> {
  HistoryNotifier(this.ref) : super(const ListViewState());
  final Ref ref;

  HistoryGalleryNotifier get historyGalleryNotifier =>
      ref.read(historyGallerysProvider.notifier);

  Future<void> addHistory(Gallery gallery) async {
    final galleryHistory = GalleryHistory()
      ..gid = gallery.gid
      ..title = gallery.title.englishTitle ?? ''
      ..thumbUrl = gallery.thumbUrl
      ..coverImgWidth = gallery.images.cover.imgWidth
      ..coverImgHeight = gallery.images.cover.imgHeight
      ..url = gallery.url
      ..mediaId = gallery.mediaId
      ..lastReadTime = DateTime.now().millisecondsSinceEpoch;

    historyGalleryNotifier.insertGallery(galleryHistory);
    await isarHelper.addHistory(galleryHistory);
  }

  Future<void> removeHistory(int? gid) async {
    historyGalleryNotifier.deleteGallerys(gid);
    await isarHelper.removeHistory(gid);
  }

  void clearHistory() {
    historyGalleryNotifier.clearGallerys();
    isarHelper.clearHistory();
  }
}

class HistoryGalleryNotifier extends StateNotifier<List<GalleryHistory>> {
  HistoryGalleryNotifier(super.create);

  void addGallerys(List<GalleryHistory> gallerys) {
    state = [...state, ...gallerys];
  }

  void insertGallery(GalleryHistory gallery) {
    state.removeWhere((element) => element.gid == gallery.gid);
    state = [gallery, ...state];
  }

  void insertGallerys(List<GalleryHistory> gallerys) {
    state = [...gallerys, ...state];
  }

  void deleteGallerys(int? gid) {
    state = state.where((element) => element.gid != gid).toList();
  }

  void clearGallerys() {
    state = [];
  }
}

final historyGallerysProvider =
    StateNotifierProvider<HistoryGalleryNotifier, List<GalleryHistory>>((ref) {
  return HistoryGalleryNotifier(isarHelper.getAllHistory());
});

final historyProvider =
    StateNotifierProvider<HistoryNotifier, ListViewState>((ref) {
  return HistoryNotifier(ref);
});
