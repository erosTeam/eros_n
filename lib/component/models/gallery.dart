import 'package:freezed_annotation/freezed_annotation.dart';
import 'gallery_image.dart';

part 'gallery.freezed.dart';
part 'gallery.g.dart';

@freezed
class Gallery with _$Gallery {
  const factory Gallery({
    String? gid,
    String? imageKey,
    String? csrfToken,
    String? title,
    String? secondTitle,
    String? url,
    String? thumbUrl,
    int? thumbHeight,
    int? thumbWidth,
    int? viewTime,
    @Default(<GalleryImage>[]) List<GalleryImage> images,
    @Default(0) int currentPageIndex,
    bool? isFavorited,
    String? favoritedNum,
    @Default(<Gallery>[]) List<Gallery> moreLikeGallerys,
  }) = _Gallery;

  const Gallery._();

  factory Gallery.fromJson(Map<String, Object?> json) =>
      _$GalleryFromJson(json);
}
