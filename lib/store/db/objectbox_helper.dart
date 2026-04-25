import 'package:collection/collection.dart';
import 'package:eros_n/component/models/tag.dart';
import 'package:eros_n/objectbox.g.dart';
import 'package:eros_n/store/db/db_store.dart';
import 'package:eros_n/store/db/entity/gallery_history.dart';
import 'package:eros_n/store/db/entity/nh_tag.dart';
import 'package:eros_n/store/db/entity/tag_translate.dart';
import 'package:eros_n/store/db/objectbox.dart';
import 'package:eros_n/utils/eros_utils.dart';
import 'package:eros_n/utils/logger.dart';

class ObjectBoxHelper implements DbStore {
  late final Store _store;

  late final Box<GalleryHistory> _historyBox;
  late final Box<TagTranslate> _tagTranslateBox;
  late final Box<NhTag> _nhTagBox;

  @override
  Future<void> init({String? path}) async {
    _store = await openObjectBox(path: path);
    _historyBox = Box<GalleryHistory>(_store);
    _tagTranslateBox = Box<TagTranslate>(_store);
    _nhTagBox = Box<NhTag>(_store);
  }

  @override
  void close() {
    _store.close();
  }

  // ---------------------------------------------------------------------------
  // GalleryHistory
  // ---------------------------------------------------------------------------

  @override
  List<GalleryHistory> getAllHistory() {
    final query = _historyBox
        .query()
        .order(GalleryHistory_.lastReadTime, flags: Order.descending)
        .build();
    final result = query.find();
    query.close();
    return result;
  }

  @override
  Future<void> addHistory(GalleryHistory galleryHistory) async {
    _historyBox.put(galleryHistory);
  }

  @override
  Future<void> removeHistory(int? gid) async {
    if (gid != null) {
      _historyBox.remove(gid);
    }
  }

  @override
  Future<void> clearHistory() async {
    _historyBox.removeAll();
  }

  // ---------------------------------------------------------------------------
  // TagTranslate
  // ---------------------------------------------------------------------------

  @override
  Future<void> putAllTagTranslate(List<TagTranslate> tagTranslates) async {
    // Upsert by (name, namespace): load existing id map, fill ids, then putMany
    final existing = _tagTranslateBox.getAll();
    final existingMap = <String, int>{};
    for (final t in existing) {
      existingMap['${t.name}|${t.namespace}'] = t.id;
    }
    for (final t in tagTranslates) {
      final key = '${t.name}|${t.namespace}';
      if (existingMap.containsKey(key)) {
        t.id = existingMap[key]!;
      }
    }
    _tagTranslateBox.putMany(tagTranslates);
  }

  @override
  Future<void> putTagTranslate(TagTranslate tagTranslate) async {
    final existing = _tagTranslateBox
        .query(
          TagTranslate_.name
              .equals(tagTranslate.name)
              .and(TagTranslate_.namespace.equals(tagTranslate.namespace)),
        )
        .build()
        .findFirst();
    if (existing != null) {
      tagTranslate.id = existing.id;
    }
    _tagTranslateBox.put(tagTranslate);
  }

  @override
  Future<void> deleteAllTagTranslate() async {
    _tagTranslateBox.removeAll();
  }

  @override
  Future<List<String>> findAllTagNamespace() async {
    final all = _tagTranslateBox.getAll();
    return all.map((t) => t.namespace).toSet().toList();
  }

  @override
  TagTranslate? findTagTranslate(String name, {String? namespace}) {
    if (name.contains('|')) {
      name = name.split('|').first.trim();
    }
    if (namespace != null && namespace.isNotEmpty) {
      final query = _tagTranslateBox
          .query(
            TagTranslate_.name
                .equals(name)
                .and(TagTranslate_.namespace.equals(namespace)),
          )
          .build();
      final result = query.find();
      query.close();
      return result.lastOrNull;
    } else {
      final query = _tagTranslateBox
          .query(
            TagTranslate_.name
                .equals(name)
                .and(TagTranslate_.namespace.notEquals('rows')),
          )
          .build();
      final result = query.find();
      query.close();
      return result.lastOrNull;
    }
  }

  @override
  Future<TagTranslate?> findTagTranslateAsync(
    String name, {
    String? namespace,
  }) async {
    return findTagTranslate(name, namespace: namespace);
  }

  @override
  Future<List<TagTranslate>> findTagTranslateContains(
    String text,
    int limit,
  ) async {
    final query =
        _tagTranslateBox
            .query(
              TagTranslate_.namespace
                  .notEquals('rows')
                  .and(
                    TagTranslate_.name
                        .contains(text)
                        .or(TagTranslate_.translateName.contains(text)),
                  ),
            )
            .order(TagTranslate_.lastUseTime, flags: Order.descending)
            .build()
          ..limit = limit;
    final result = query.find();
    query.close();
    logger.d('result.len ${result.length}');
    return result;
  }

  // ---------------------------------------------------------------------------
  // NhTag
  // ---------------------------------------------------------------------------

  @override
  Future<void> putAllNhTag(List<NhTag> tags) async {
    _nhTagBox.putMany(tags);
  }

  @override
  Future<void> putNhTag(NhTag tag) async {
    _nhTagBox.put(tag);
  }

  @override
  NhTag? findNhTag(int? id) {
    if (id == null) {
      return null;
    }
    return _nhTagBox.get(id);
  }

  @override
  Future<NhTag?> findNhTagAsync(int? id) async {
    return findNhTag(id);
  }

  @override
  Future<List<NhTag>> getAllNhTag() async {
    return _nhTagBox.getAll();
  }

  @override
  Future<List<NhTag>> findNhTagContains(String text, int limit) async {
    final query =
        _nhTagBox
            .query(
              NhTag_.name
                  .contains(text)
                  .or(NhTag_.translateName.contains(text)),
            )
            .order(NhTag_.lastUseTime, flags: Order.descending)
            .build()
          ..limit = limit;
    final result = query.find();
    query.close();
    logger.t('result.len ${result.length}');
    return result;
  }

  @override
  Future<void> updateNhTagTime(int nhTagId) async {
    final oriNhTag = _nhTagBox.get(nhTagId);
    if (oriNhTag == null) {
      return;
    }
    final newTag = oriNhTag.copyWith(
      lastUseTime: DateTime.now().millisecondsSinceEpoch,
    );
    _nhTagBox.put(newTag);
  }

  /// Persist tags learned from a gallery detail page or autocomplete result
  /// into the local NhTag cache. Existing entries (same id) keep their
  /// `lastUseTime`. Type is normalized to singular lowercase form so it
  /// matches nhentai's search syntax. If a tag has no `translatedName`,
  /// the local TagTranslate database is consulted to fill it in.
  ///
  /// Each operation yields back to the event loop between iterations so
  /// long tag lists (~30 entries on a typical detail page) don't block
  /// the UI thread enough to trigger an ANR — every TagTranslate lookup
  /// is a 41k-row contains() scan and adds up quickly otherwise.
  @override
  Future<void> learnNhTags(List<Tag> tags) async {
    if (tags.isEmpty) {
      return;
    }
    final candidates = tags
        .where((t) => t.id != null && t.id != 0 && (t.name ?? '').isNotEmpty)
        .toList();
    if (candidates.isEmpty) {
      return;
    }

    // Yield once before doing any work so callers that fire-and-forget
    // (e.g. parseGalleryDetail) return to the caller immediately.
    await Future<void>.delayed(Duration.zero);

    final ids = candidates.map((t) => t.id!).toList();
    final existingMap = <int, NhTag>{};
    for (final t in _nhTagBox.getMany(ids).whereType<NhTag>()) {
      existingMap[t.id] = t;
    }

    final toWrite = <NhTag>[];
    for (var i = 0; i < candidates.length; i++) {
      final tag = candidates[i];
      final name = tag.name!.trim();
      if (name.isEmpty) {
        continue;
      }
      final type = tag.type == null || tag.type!.isEmpty
          ? null
          : singularizeTagType(tag.type!);
      final existing = existingMap[tag.id!];

      var translateName = tag.translatedName;
      if (translateName == null || translateName.isEmpty) {
        translateName = existing?.translateName;
      }
      if ((translateName == null || translateName.isEmpty) && type != null) {
        // For general tags / categories TagTranslate has no canonical
        // namespace, so search across all when type is `tag`/`category`.
        final ns = (type == 'tag' || type == 'category') ? null : type;
        translateName = findTagTranslate(
          name,
          namespace: ns,
        )?.translateNameNotMD;
        // Yield every few lookups so a detail page with 30+ tags
        // doesn't stall the UI for half a second.
        if (i % 4 == 3) {
          await Future<void>.delayed(Duration.zero);
        }
      }

      toWrite.add(
        NhTag(
          id: tag.id!,
          name: name,
          type: type ?? existing?.type,
          count: tag.count ?? existing?.count,
          translateName: translateName,
          lastUseTime: existing?.lastUseTime ?? 0,
        ),
      );
    }
    if (toWrite.isNotEmpty) {
      _nhTagBox.putMany(toWrite);
    }
  }
}
