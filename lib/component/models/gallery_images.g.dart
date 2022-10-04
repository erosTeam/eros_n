// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GalleryImages _$$_GalleryImagesFromJson(Map<String, dynamic> json) =>
    _$_GalleryImages(
      pages: (json['pages'] as List<dynamic>?)
              ?.map((e) => GalleryImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GalleryImage>[],
      cover: json['cover'] == null
          ? const GalleryImage()
          : GalleryImage.fromJson(json['cover'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] == null
          ? const GalleryImage()
          : GalleryImage.fromJson(json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GalleryImagesToJson(_$_GalleryImages instance) =>
    <String, dynamic>{
      'pages': instance.pages.map((e) => e.toJson()).toList(),
      'cover': instance.cover.toJson(),
      'thumbnail': instance.thumbnail.toJson(),
    };
