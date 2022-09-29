import 'package:collection/collection.dart';
import 'package:eros_n/store/db/entity/gallery_history.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:isar/isar.dart';

import 'entity/tag_translate.dart';
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

  Future<void> putAllTagTranslate(List<TagTranslate> tagTranslates,
      {bool replaceOnConflict = true}) async {
    await isar.writeTxn(() async {
      await isar.tagTranslates.putAll(tagTranslates);
    });
  }

  Future<List<String?>> findAllTagNamespace() async {
    final result = await isar.tagTranslates
        .where()
        .distinctByNamespace()
        .nameProperty()
        .findAll();
    return result;
  }

  TagTranslate? findTagTranslate(String name, {String? namespace}) {
    if (name.contains('|')) {
      name = name.split('|').first.trim();
    }
    if (namespace != null && namespace.isNotEmpty) {
      final result = isar.tagTranslates
          .where()
          .nameEqualTo(name)
          .filter()
          .namespaceEqualTo(namespace)
          .findAllSync();
      return result.lastOrNull;
    } else {
      final result = isar.tagTranslates.where().nameEqualTo(name).findAllSync();
      return result.lastOrNull;
    }
  }

  Future<List<TagTranslate>> findTagTranslateContains(
      String text, int limit) async {
    final result = await isar.tagTranslates
        .filter()
        .nameEqualTo(text)
        .or()
        .nameContains(text)
        .limit(limit)
        .findAll();

    logger.d('result.len ${result.length}');

    return result;
  }
}
