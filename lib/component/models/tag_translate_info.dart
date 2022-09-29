import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_translate_info.freezed.dart';
part 'tag_translate_info.g.dart';

@freezed
class TagTranslateInfo with _$TagTranslateInfo {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory TagTranslateInfo({
    String? version,
    String? remoteVersion,
    String? lastReleaseUrl,
  }) = _TagTranslateInfo;
  
  

  factory TagTranslateInfo.fromJson(Map<String, dynamic> json) =>
      _$TagTranslateInfoFromJson(json);
}