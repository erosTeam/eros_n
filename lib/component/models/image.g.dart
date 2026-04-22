// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GalleryImage _$GalleryImageFromJson(Map<String, dynamic> json) =>
    _GalleryImage(
      type: json['t'] as String? ?? 'j',
      imgHeight: (json['h'] as num?)?.toInt(),
      imgWidth: (json['w'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GalleryImageToJson(_GalleryImage instance) =>
    <String, dynamic>{
      't': instance.type,
      'h': instance.imgHeight,
      'w': instance.imgWidth,
    };
