import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_poster.freezed.dart';
part 'comment_poster.g.dart';

@freezed
class CommentPoster with _$CommentPoster {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CommentPoster({
    @JsonKey(name: 'id') int? posterId,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'is_superuser') bool? isSuperuser,
    @JsonKey(name: 'is_staff') bool? isStaff,
  }) = _CommentPoster;

  factory CommentPoster.fromJson(Map<String, dynamic> json) =>
      _$CommentPosterFromJson(json);
}
