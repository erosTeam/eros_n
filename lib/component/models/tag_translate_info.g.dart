// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_translate_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagTranslateInfo _$TagTranslateInfoFromJson(Map<String, dynamic> json) =>
    _TagTranslateInfo(
      version: json['version'] as String?,
      remoteVersion: json['remote_version'] as String?,
      lastReleaseUrl: json['last_release_url'] as String?,
      nhTagVersion: json['nh_tag_version'] as String?,
    );

Map<String, dynamic> _$TagTranslateInfoToJson(_TagTranslateInfo instance) =>
    <String, dynamic>{
      'version': instance.version,
      'remote_version': instance.remoteVersion,
      'last_release_url': instance.lastReleaseUrl,
      'nh_tag_version': instance.nhTagVersion,
    };
