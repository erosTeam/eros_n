import 'package:eros_n/common/global.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/pages/nav/front/list_view_state.dart';
import 'package:eros_n/store/db/entity/download_task.dart';
import 'package:eros_n/store/db/entity/gallery_history.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'history_provider.g.dart';

@Riverpod(keepAlive: true)
class HistoryNotifier extends _$HistoryNotifier {
  @override
  ListViewState build() => const ListViewState();

  HistoryGallerys get _historyGalleryNotifier =>
      ref.read(historyGallerysProvider.notifier);

  void setAppBarSearch(bool val) {
    if (!val) {
      ref.read(searchKeyProvider.notifier).set('');
    }
    state = state.copyWith(appBarSearch: val);
  }

  Future<void> addHistory(Gallery gallery) async {
    final existing = ref
        .read(historyGallerysProvider)
        .where((h) => h.gid == gallery.gid)
        .firstOrNull;

    final galleryHistory = GalleryHistory()
      ..gid = gallery.gid
      ..title = gallery.title.englishTitle ?? ''
      ..thumbUrl = gallery.thumbUrl
      ..coverImgWidth = gallery.images.cover.imgWidth
      ..coverImgHeight = gallery.images.cover.imgHeight
      ..url = gallery.url
      ..mediaId = gallery.mediaId
      ..lastReadTime = DateTime.now().millisecondsSinceEpoch
      ..lastReadIndex = existing?.lastReadIndex;

    _historyGalleryNotifier.insertGallery(galleryHistory);
    await objectBoxHelper.addHistory(galleryHistory);
  }

  /// Create a history entry from a completed download task when no entry
  /// exists yet. Called before offline reading starts so that onPageChanged
  /// → updateReadIndex can persist progress immediately.
  Future<void> addHistoryFromTask(DownloadTask task) async {
    final existing = ref
        .read(historyGallerysProvider)
        .where((h) => h.gid == task.gid)
        .firstOrNull;
    if (existing != null) return;

    final galleryHistory = GalleryHistory(gid: task.gid)
      ..title = task.title
      ..mediaId = task.mediaId
      ..thumbUrl = task.thumbUrl.isNotEmpty ? task.thumbUrl : null
      ..url = 'https://nhentai.net/g/${task.gid}/'
      ..lastReadTime = DateTime.now().millisecondsSinceEpoch;

    _historyGalleryNotifier.insertGallery(galleryHistory);
    await objectBoxHelper.addHistory(galleryHistory);
  }

  Future<void> removeHistory(int? gid) async {
    _historyGalleryNotifier.deleteGallerys(gid);
    await objectBoxHelper.removeHistory(gid);
  }

  void clearHistory() {
    _historyGalleryNotifier.clearGallerys();
    objectBoxHelper.clearHistory();
  }

  Future<void> updateReadIndex(int gid, int index) async {
    _historyGalleryNotifier.updateReadIndex(gid, index);
    await objectBoxHelper.updateHistoryReadIndex(gid, index);
  }
}

@Riverpod(keepAlive: true)
class HistoryGallerys extends _$HistoryGallerys {
  @override
  List<GalleryHistory> build() => objectBoxHelper.getAllHistory();

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

  void updateReadIndex(int gid, int index) {
    state = [
      for (final h in state)
        if (h.gid == gid) (h..lastReadIndex = index) else h,
    ];
  }
}

@Riverpod(keepAlive: true)
List<GalleryHistory> filteredHistoryGallerys(Ref ref) {
  final historyGallerys = ref.watch(historyGallerysProvider);
  final searchKey = ref.watch(searchKeyProvider);
  if (searchKey.isEmpty) {
    return historyGallerys;
  }
  return historyGallerys.where((GalleryHistory his) {
    return (his.title ?? '').toLowerCase().contains(searchKey.toLowerCase()) ||
        (his.japaneseTitle ?? '').toLowerCase().contains(
          searchKey.toLowerCase(),
        );
  }).toList();
}

@Riverpod(keepAlive: true)
class SearchKey extends _$SearchKey {
  @override
  String build() => '';

  void set(String value) => state = value;
}
