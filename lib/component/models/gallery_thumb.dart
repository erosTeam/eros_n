import 'package:freezed_annotation/freezed_annotation.dart';
part 'gallery_thumb.freezed.dart';
part 'gallery_thumb.g.dart';

@freezed
class GalleryThumb with _$GalleryThumb {
  const factory GalleryThumb({
    int? index,
    String? url,
    String? thumbUrl,
    int? imgHeight,
    int? imgWidth,
  }) = _GalleryThumb;

  factory GalleryThumb.fromJson(Map<String, Object?> json) =>
      _$GalleryThumbFromJson(json);
}
