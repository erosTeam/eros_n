// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Gallery _$GalleryFromJson(Map<String, dynamic> json) => _Gallery(
  gid: (json['id'] as num?)?.toInt() ?? 0,
  mediaId: json['media_id'] as String?,
  title: json['title'] == null
      ? const GalleryTitle()
      : GalleryTitle.fromJson(json['title'] as Map<String, dynamic>),
  images: json['images'] == null
      ? const GalleryImages()
      : GalleryImages.fromJson(json['images'] as Map<String, dynamic>),
  scanlator: json['scanlator'] as String?,
  uploadDate: (json['upload_date'] as num?)?.toInt(),
  numPages: (json['num_pages'] as num?)?.toInt(),
  numFavorites: (json['num_favorites'] as num?)?.toInt(),
  tags:
      (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <Tag>[],
);

Map<String, dynamic> _$GalleryToJson(_Gallery instance) => <String, dynamic>{
  'id': instance.gid,
  'media_id': instance.mediaId,
  'title': instance.title,
  'images': instance.images,
  'scanlator': instance.scanlator,
  'upload_date': instance.uploadDate,
  'num_pages': instance.numPages,
  'num_favorites': instance.numFavorites,
  'tags': instance.tags,
};
