// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Comment _$CommentFromJson(Map<String, dynamic> json) => _Comment(
  commentId: (json['id'] as num?)?.toInt(),
  gid: (json['gallery_id'] as num?)?.toInt(),
  postDate: (json['post_date'] as num?)?.toInt(),
  commentText: json['body'] as String?,
  poster: json['poster'] == null
      ? null
      : CommentPoster.fromJson(json['poster'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommentToJson(_Comment instance) => <String, dynamic>{
  'id': instance.commentId,
  'gallery_id': instance.gid,
  'post_date': instance.postDate,
  'body': instance.commentText,
  'poster': instance.poster?.toJson(),
};
