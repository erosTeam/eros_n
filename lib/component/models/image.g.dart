// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GalleryImage _$$_GalleryImageFromJson(Map<String, dynamic> json) =>
    _$_GalleryImage(
      type: json['t'] as String? ?? 'j',
      imgHeight: json['h'] as int?,
      imgWidth: json['w'] as int?,
    );

Map<String, dynamic> _$$_GalleryImageToJson(_$_GalleryImage instance) =>
    <String, dynamic>{
      't': instance.type,
      'h': instance.imgHeight,
      'w': instance.imgWidth,
    };
