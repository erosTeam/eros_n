import 'package:freezed_annotation/freezed_annotation.dart';
part 'gallery_image.freezed.dart';
part 'gallery_image.g.dart';

@freezed
class GalleryImage with _$GalleryImage {
  const factory GalleryImage({
    int? index,
    String? href,
    String? imageUrl,
    String? thumbUrl,
    int? imgHeight,
    int? imgWidth,
    int? thumbHeight,
    int? thumbWidth,
  }) = _GalleryImage;

  factory GalleryImage.fromJson(Map<String, Object?> json) =>
      _$GalleryImageFromJson(json);
}
