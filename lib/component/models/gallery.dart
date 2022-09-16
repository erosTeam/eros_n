import 'package:eros_n/component/models/gallery_image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'gallery_image.dart';
part 'gallery.freezed.dart';
part 'gallery.g.dart';

@freezed
class Gallery with _$Gallery {
  const factory Gallery({
    String? gid,
    String? imageKey,
    String? title,
    String? url,
    String? thumbUrl,
    int? imgHeight,
    int? imgWidth,
    @Default([]) List<GalleryImage> images,
    @Default(0) int currentPageIndex,
  }) = _Gallery;

  factory Gallery.fromJson(Map<String, Object?> json) =>
      _$GalleryFromJson(json);
}
