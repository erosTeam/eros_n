import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';

part 'tag.g.dart';

@freezed
class Tag with _$Tag {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Tag({
    int? id,
    String? type,
    String? name,
    String? url,
    int? count,
    @JsonKey(ignore: true) String? translatedName,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
