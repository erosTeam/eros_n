// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GallerySet _$GallerySetFromJson(Map<String, dynamic> json) => _GallerySet(
  gallerys: (json['gallerys'] as List<dynamic>?)
      ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
      .toList(),
  populars: (json['populars'] as List<dynamic>?)
      ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
      .toList(),
  favorites: (json['favorites'] as List<dynamic>?)
      ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
      .toList(),
  maxPage: (json['maxPage'] as num?)?.toInt(),
  currentPage: (json['currentPage'] as num?)?.toInt(),
  fromCache: json['fromCache'] as bool?,
);

Map<String, dynamic> _$GallerySetToJson(_GallerySet instance) =>
    <String, dynamic>{
      'gallerys': instance.gallerys,
      'populars': instance.populars,
      'favorites': instance.favorites,
      'maxPage': instance.maxPage,
      'currentPage': instance.currentPage,
      'fromCache': instance.fromCache,
    };
