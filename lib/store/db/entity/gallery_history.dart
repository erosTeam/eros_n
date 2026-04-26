import 'package:objectbox/objectbox.dart';

@Entity()
class GalleryHistory {
  GalleryHistory({
    this.gid = 0,
    this.mediaId,
    this.csrfToken,
    this.title,
    this.japaneseTitle,
    this.url,
    this.thumbUrl,
    this.coverImgHeight,
    this.coverImgWidth,
    this.lastReadTime,
    this.lastReadIndex,
  });
  @Id(assignable: true)
  int gid;

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
  int? lastReadIndex;
}
