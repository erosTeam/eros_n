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
      thumbHeight: json['thumbHeight'] as int?,
      thumbWidth: json['thumbWidth'] as int?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => GalleryImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentPageIndex: json['currentPageIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$$_GalleryToJson(_$_Gallery instance) =>
    <String, dynamic>{
      'gid': instance.gid,
      'imageKey': instance.imageKey,
      'title': instance.title,
      'url': instance.url,
      'thumbUrl': instance.thumbUrl,
      'thumbHeight': instance.thumbHeight,
      'thumbWidth': instance.thumbWidth,
      'images': instance.images,
      'currentPageIndex': instance.currentPageIndex,
    };
