import 'package:collection/collection.dart';
import 'package:eros_n/store/db/entity/gallery_history.dart';
import 'package:eros_n/store/db/entity/nh_tag.dart';
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

  void clearHistory() {
    isar.writeTxn(() async {
      await isar.galleryHistorys.where().deleteAll();
    });
  }

  Future<void> putAllTagTranslate(
    List<TagTranslate> tagTranslates,
  ) async {
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
      final result = isar.tagTranslates
          .where()
          .namespaceNotEqualTo('rows')
          .filter()
          .nameEqualTo(name)
          .findAllSync();
      return result.lastOrNull;
    }
  }

  Future<TagTranslate?> findTagTranslateAsync(
    String name, {
    String? namespace,
  }) async {
    if (name.contains('|')) {
      name = name.split('|').first.trim();
    }
    if (namespace != null && namespace.isNotEmpty) {
      final result = await isar.tagTranslates
          .where()
          .nameEqualTo(name)
          .filter()
          .namespaceEqualTo(namespace)
          .findAll();
      return result.lastOrNull;
    } else {
      final result = await isar.tagTranslates
          .where()
          .namespaceNotEqualTo('rows')
          .filter()
          .nameEqualTo(name)
          .findAll();
      return result.lastOrNull;
    }
  }

  Future<List<TagTranslate>> findTagTranslateContains(
      String text, int limit) async {
    final result = await isar.tagTranslates
        .where()
        .namespaceNotEqualTo('rows')
        .filter()
        .nameEqualTo(text)
        .or()
        .nameContains(text)
        .limit(limit)
        .findAll();

    logger.d('result.len ${result.length}');

    return result;
  }

  Future<void> putAllNhTag(List<NhTag> tags) async {
    await isar.writeTxn(() async {
      await isar.nhTags.putAll(tags);
    });
  }

  NhTag? findNhTag(int? id) {
    return isar.nhTags.where().idEqualTo(id ?? 0).findFirstSync();
  }

  Future<NhTag?> findNhTagAsync(int? id) async {
    return await isar.nhTags.where().idEqualTo(id ?? 0).findFirst();
  }

  Future<List<NhTag>> getAllNhTag() {
    return isar.nhTags.where().findAll();
  }
}
