import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';

part 'image.g.dart';

@freezed
abstract class GalleryImage with _$GalleryImage {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory GalleryImage({
    @Default('j') @JsonKey(name: 't') String type,
    @JsonKey(name: 'h') int? imgHeight,
    @JsonKey(name: 'w') int? imgWidth,
    @JsonKey(includeFromJson: false, includeToJson: false) String? imageUrl,
    @JsonKey(includeFromJson: false, includeToJson: false) String? href,
  }) = _GalleryImage;

  factory GalleryImage.fromJson(Map<String, dynamic> json) =>
      _$GalleryImageFromJson(json);
}
