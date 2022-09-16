// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Gallery _$$_GalleryFromJson(Map<String, dynamic> json) => _$_Gallery(
      gid: json['gid'] as String?,
      imageKey: json['imageKey'] as String?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      thumbUrl: json['thumbUrl'] as String?,
      imgHeight: json['imgHeight'] as int?,
      imgWidth: json['imgWidth'] as int?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => GalleryImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_GalleryToJson(_$_Gallery instance) =>
    <String, dynamic>{
      'gid': instance.gid,
      'imageKey': instance.imageKey,
      'title': instance.title,
      'url': instance.url,
      'thumbUrl': instance.thumbUrl,
      'imgHeight': instance.imgHeight,
      'imgWidth': instance.imgWidth,
      'images': instance.images,
    };
