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
      await isar.tagTranslates.putAllByNameNamespace(tagTranslates);
    });
  }

  Future<void> putTagTranslate(TagTranslate tagTranslate) async {
    await isar.writeTxn(() async {
      await isar.tagTranslates.putByNameNamespace(tagTranslate);
    });
  }

  Future<void> deleteAllTagTranslate() async {
    await isar.writeTxn(() async {
      await isar.tagTranslates.where().deleteAll();
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
      final result =
          await isar.tagTranslates.getByNameNamespace(name, namespace);
      return result;
    } else {
      final result = await isar.tagTranslates
          .where()
          .nameEqualToNamespaceNotEqualTo(name, 'rows')
          .findFirst();
      return result;
    }
  }

  Future<List<TagTranslate>> findTagTranslateContains(
      String text, int limit) async {
    final result = await isar.tagTranslates
        .where(sort: Sort.desc)
        .anyLastUseTime()
        .filter()
        .not()
        .namespaceEqualTo('rows')
        .and()
        .nameContains(text)
        .or()
        .translateNameContains(text)
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

  Future<void> putNhTag(NhTag tag) async {
    await isar.writeTxn(() async {
      await isar.nhTags.put(tag);
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

  Future<List<NhTag>> findNhTagContains(String text, int limit) async {
    final result = await isar.nhTags
        .where(sort: Sort.desc)
        .anyLastUseTime()
        .filter()
        .nameContains(text)
        .or()
        .translateNameContains(text)
        .limit(limit)
        .findAll();

    logger.v('result.len ${result.length}');

    return result;
  }

  Future<void> updateNhTagTime(int nhTagId) async {
    final NhTag? oriNhTag = await isar.nhTags.get(nhTagId);
    final newTag = oriNhTag?.copyWith(
      lastUseTime: DateTime.now().millisecondsSinceEpoch,
    );

    if (newTag != null) {
      await isar.writeTxn(() async {
        await isar.nhTags.put(newTag);
      });
    }
  }
}
