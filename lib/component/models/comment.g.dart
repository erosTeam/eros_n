// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$$_CommentFromJson(Map<String, dynamic> json) => _$_Comment(
      commentId: json['id'] as int?,
      gid: json['gallery_id'] as int?,
      postDate: json['post_date'] as int?,
      commentText: json['body'] as String?,
      poster: json['poster'] == null
          ? null
          : CommentPoster.fromJson(json['poster'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.commentId,
      'gallery_id': instance.gid,
      'post_date': instance.postDate,
      'body': instance.commentText,
      'poster': instance.poster?.toJson(),
    };
