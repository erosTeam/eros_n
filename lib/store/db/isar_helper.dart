import 'package:eros_n/store/db/entity/gallery_history.dart';
import 'package:isar/isar.dart';

import 'isar.dart';

class IsarHelper {
  late final Isar isar;

  Future<void> initIsar() async {
    isar = await openIsar();
  }

  List<GalleryHistory> getAllHistory() {
    final galleryHistory =
        isar.galleryHistorys.where().sortByLastReadTimeDesc().findAllSync();
    return galleryHistory;
  }

  Future<void> addHistory(GalleryHistory galleryHistory) async {
    await isar.writeTxn(() async {
      await isar.galleryHistorys.put(galleryHistory);
    });
  }

  Future<void> removeHistory(int? gid) async {
    await isar.writeTxn(() async {
      await isar.galleryHistorys.delete(gid ?? 0);
    });
  }
}
