import 'package:freezed_annotation/freezed_annotation.dart';

import 'gallery_thumb.dart';
part 'gallery.freezed.dart';
part 'gallery.g.dart';

@freezed
class Gallery with _$Gallery {
  const factory Gallery({
    String? gid,
    String? title,
    String? url,
    String? thumbUrl,
    int? imgHeight,
    int? imgWidth,
    @Default([]) List<GalleryThumb> thumbs,
  }) = _Gallery;

  factory Gallery.fromJson(Map<String, Object?> json) =>
      _$GalleryFromJson(json);
}
