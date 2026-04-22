// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_poster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentPoster _$CommentPosterFromJson(Map<String, dynamic> json) =>
    _CommentPoster(
      posterId: (json['id'] as num?)?.toInt(),
      username: json['username'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      isSuperuser: json['is_superuser'] as bool?,
      isStaff: json['is_staff'] as bool?,
    );

Map<String, dynamic> _$CommentPosterToJson(_CommentPoster instance) =>
    <String, dynamic>{
      'id': instance.posterId,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'is_superuser': instance.isSuperuser,
      'is_staff': instance.isStaff,
    };
