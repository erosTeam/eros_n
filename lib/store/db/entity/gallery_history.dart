import 'package:isar/isar.dart';

part 'gallery_history.g.dart';

@Collection()
class GalleryHistory {
  @Index(unique: true, replace: true)
  Id? gid;
  String? mediaId;
  String? csrfToken;
  String? title;
  String? japaneseTitle;
  String? url;
  String? thumbUrl;
  int? thumbHeight;
  int? thumbWidth;
  @Index()
  int? lastReadTime;
}
