import 'package:isar/isar.dart';

part 'gallery_history.g.dart';

@Collection()
class GalleryHistory {
  @Index(unique: true, replace: true)
  Id gid = 0;
  String? mediaId;
  String? csrfToken;
  String? title;
  String? japaneseTitle;
  String? url;
  String? thumbUrl;
  int? coverImgHeight;
  int? coverImgWidth;
  @Index()
  int? lastReadTime;
}
