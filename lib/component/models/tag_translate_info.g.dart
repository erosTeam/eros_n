// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_translate_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TagTranslateInfo _$$_TagTranslateInfoFromJson(Map<String, dynamic> json) =>
    _$_TagTranslateInfo(
      version: json['version'] as String?,
      remoteVersion: json['remote_version'] as String?,
      lastReleaseUrl: json['last_release_url'] as String?,
      nhTagVersion: json['nh_tag_version'] as String?,
    );

Map<String, dynamic> _$$_TagTranslateInfoToJson(_$_TagTranslateInfo instance) =>
    <String, dynamic>{
      'version': instance.version,
      'remote_version': instance.remoteVersion,
      'last_release_url': instance.lastReleaseUrl,
      'nh_tag_version': instance.nhTagVersion,
    };
