import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_title.freezed.dart';

part 'gallery_title.g.dart';

@freezed
class GalleryTitle with _$GalleryTitle {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory GalleryTitle({
    @JsonKey(name: 'english') String? englishTitle,
    @JsonKey(name: 'japanese') String? japaneseTitle,
    @JsonKey(name: 'pretty') String? prettyTitle,
  }) = _GalleryTitle;

  factory GalleryTitle.fromJson(Map<String, dynamic> json) =>
      _$GalleryTitleFromJson(json);
}
