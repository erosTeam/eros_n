// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GallerySet _$$_GallerySetFromJson(Map<String, dynamic> json) =>
    _$_GallerySet(
      gallerys: (json['gallerys'] as List<dynamic>?)
          ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
          .toList(),
      populars: (json['populars'] as List<dynamic>?)
          ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
          .toList(),
      favorites: (json['favorites'] as List<dynamic>?)
          ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxPage: json['maxPage'] as int?,
      fromCache: json['fromCache'] as bool?,
    );

Map<String, dynamic> _$$_GallerySetToJson(_$_GallerySet instance) =>
    <String, dynamic>{
      'gallerys': instance.gallerys,
      'populars': instance.populars,
      'favorites': instance.favorites,
      'maxPage': instance.maxPage,
      'fromCache': instance.fromCache,
    };
