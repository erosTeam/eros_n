import 'package:isar/isar.dart';

part 'gallery_history.g.dart';

@Collection()
class GalleryHistory {
  @Index(unique: true, replace: true)
  Id? gid;
  String? imageKey;
  String? csrfToken;
  String? title;
  String? secondTitle;
  String? url;
  String? thumbUrl;
  int? thumbHeight;
  int? thumbWidth;
  @Index()
  int? lastReadTime;
}
