import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'comment_poster.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory Comment({
    @JsonKey(name: 'id') int? commentId,
    @JsonKey(name: 'gallery_id') int? gid,
    @JsonKey(name: 'post_date') int? postDate,
    @JsonKey(name: 'body') String? commentText,
    @JsonKey(name: 'poster') CommentPoster? poster,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
