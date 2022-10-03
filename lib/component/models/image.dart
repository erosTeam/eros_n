import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';

part 'image.g.dart';

@freezed
class GalleryImage with _$GalleryImage {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory GalleryImage({
    @JsonKey(name: 't') String? type,
    @JsonKey(name: 'h') String? imgHeight,
    @JsonKey(name: 'w') String? imgWidth,
    @JsonKey(ignore: true) String? imageUrl,
    @JsonKey(ignore: true) String? href,
    @JsonKey(ignore: true) int? thumbHeight,
    @JsonKey(ignore: true) int? thumbWidth,
    @JsonKey(ignore: true) String? thumbUrl,
  }) = _GalleryImage;

  factory GalleryImage.fromJson(Map<String, dynamic> json) =>
      _$GalleryImageFromJson(json);
}
