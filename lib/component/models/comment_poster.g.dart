// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_poster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentPoster _$$_CommentPosterFromJson(Map<String, dynamic> json) =>
    _$_CommentPoster(
      posterId: json['id'] as int?,
      username: json['username'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      isSuperuser: json['is_superuser'] as bool?,
      isStaff: json['is_staff'] as bool?,
    );

Map<String, dynamic> _$$_CommentPosterToJson(_$_CommentPoster instance) =>
    <String, dynamic>{
      'id': instance.posterId,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'is_superuser': instance.isSuperuser,
      'is_staff': instance.isStaff,
    };
