import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'image.dart';

part 'gallery_images.freezed.dart';

part 'gallery_images.g.dart';

@freezed
class GalleryImages with _$GalleryImages {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory GalleryImages({
    @JsonKey(name: 'pages') @Default(<GalleryImage>[]) List<GalleryImage> pages,
    @JsonKey(name: 'cover') @Default(GalleryImage()) GalleryImage cover,
    @JsonKey(name: 'thumbnail') @Default(GalleryImage()) GalleryImage thumbnail,
  }) = _GalleryImages;

  factory GalleryImages.fromJson(Map<String, dynamic> json) =>
      _$GalleryImagesFromJson(json);
}
