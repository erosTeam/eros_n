import 'package:freezed_annotation/freezed_annotation.dart';

import 'comment.dart';
import 'gallery_images.dart';
import 'gallery_title.dart';
import 'tag.dart';

part 'gallery.freezed.dart';

part 'gallery.g.dart';

@freezed
class Gallery with _$Gallery {
  const factory Gallery({
    @JsonKey(name: 'id')String? gid,
    @JsonKey(name: 'media_id') String? mediaId,
    @Default(GalleryTitle()) GalleryTitle title,
    String? url,
    String? thumbUrl,
    int? thumbHeight,
    int? thumbWidth,
    int? viewTime,
    @Default(GalleryImages()) GalleryImages images,
    String? scanlator,
    @JsonKey(name: 'upload_date') int? uploadDate,
    @JsonKey(name: 'num_pages') int? numPages,
    @JsonKey(name: 'num_favorites') int? numFavorites,
    @Default(<Tag>[]) List<Tag> tags,
    @Default(<Comment>[]) List<Comment> comments,
    @JsonKey(ignore: true) @Default(<Gallery>[]) List<Gallery> moreLikeGallerys,
    @JsonKey(ignore: true) @Default(0) int currentPageIndex,
    @JsonKey(ignore: true) bool? isFavorited,
    @JsonKey(ignore: true) String? uploadedDateTime,
    @JsonKey(ignore: true) String? csrfToken,
  }) = _Gallery;

  const Gallery._();

  factory Gallery.fromJson(Map<String, Object?> json) =>
      _$GalleryFromJson(json);

  @JsonKey(ignore: true)
  DateTime? get uploadedDate =>
      DateTime.tryParse(uploadedDateTime ?? '')?.toLocal();
}
