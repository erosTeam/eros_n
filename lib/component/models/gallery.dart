import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/component/models/comment.dart';
import 'package:eros_n/component/models/gallery_images.dart';
import 'package:eros_n/component/models/gallery_title.dart';
import 'package:eros_n/component/models/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery.freezed.dart';
part 'gallery.g.dart';

@freezed
abstract class Gallery with _$Gallery {
  const factory Gallery({
    @JsonKey(name: 'id') @Default(0) int gid,
    @JsonKey(name: 'media_id') String? mediaId,
    @Default(GalleryTitle()) GalleryTitle title,
    @Default(GalleryImages()) GalleryImages images,
    String? scanlator,
    @JsonKey(name: 'upload_date') int? uploadDate,
    @JsonKey(name: 'num_pages') int? numPages,
    @JsonKey(name: 'num_favorites') int? numFavorites,
    @Default(<Tag>[]) List<Tag> tags,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(<Tag>[])
    List<Tag> simpleTags,
    @JsonKey(includeFromJson: false, includeToJson: false) String? languageCode,
    @JsonKey(includeFromJson: false, includeToJson: false) int? viewTime,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(<Comment>[])
    List<Comment> comments,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(<Gallery>[])
    List<Gallery> moreLikeGallerys,
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(0)
    int currentPageIndex,
    @JsonKey(includeFromJson: false, includeToJson: false) bool? isFavorited,
    @JsonKey(includeFromJson: false, includeToJson: false)
    String? uploadedDateTime,
    @JsonKey(includeFromJson: false, includeToJson: false) String? csrfToken,
  }) = _Gallery;

  const Gallery._();

  factory Gallery.fromJson(Map<String, Object?> json) =>
      _$GalleryFromJson(json);

  @JsonKey(includeFromJson: false, includeToJson: false)
  DateTime? get uploadedDate =>
      DateTime.tryParse(uploadedDateTime ?? '')?.toLocal();

  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get thumbUrl => mediaId != null
      ? 'https://t.nhentai.net/galleries/$mediaId/thumb.${NHConst.extMap[images.thumbnail.type]}'
      : null;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get coverUrl => mediaId != null
      ? 'https://t.nhentai.net/galleries/$mediaId/cover.${NHConst.extMap[images.cover.type]}'
      : null;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get url => 'https://nhentai.net/g/$gid/';
}
