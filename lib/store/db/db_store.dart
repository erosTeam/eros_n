import 'package:eros_n/component/models/tag.dart';
import 'package:eros_n/store/db/entity/gallery_history.dart';
import 'package:eros_n/store/db/entity/nh_tag.dart';
import 'package:eros_n/store/db/entity/tag_translate.dart';

/// Backend-agnostic database interface.
/// Current implementation: ObjectBox. Future: ffastdb or any pure-Dart store.
abstract class DbStore {
  Future<void> init({String? path});
  void close();

  // GalleryHistory
  List<GalleryHistory> getAllHistory();
  Future<void> addHistory(GalleryHistory galleryHistory);
  Future<void> removeHistory(int? gid);
  Future<void> clearHistory();

  // TagTranslate
  Future<void> putAllTagTranslate(List<TagTranslate> tagTranslates);
  Future<void> putTagTranslate(TagTranslate tagTranslate);
  Future<void> deleteAllTagTranslate();
  Future<List<String>> findAllTagNamespace();
  TagTranslate? findTagTranslate(String name, {String? namespace});
  Future<TagTranslate?> findTagTranslateAsync(String name, {String? namespace});
  Future<List<TagTranslate>> findTagTranslateContains(String text, int limit);

  // NhTag
  Future<void> putAllNhTag(List<NhTag> tags);
  Future<void> putNhTag(NhTag tag);
  NhTag? findNhTag(int? id);
  Future<NhTag?> findNhTagAsync(int? id);
  Future<List<NhTag>> getAllNhTag();
  Future<List<NhTag>> findNhTagContains(String text, int limit);
  Future<void> updateNhTagTime(int nhTagId);
  Future<void> learnNhTags(List<Tag> tags);
}
