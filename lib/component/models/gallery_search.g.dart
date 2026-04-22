// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GallerySearch _$GallerySearchFromJson(Map<String, dynamic> json) =>
    _GallerySearch(
      result:
          (json['result'] as List<dynamic>?)
              ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Gallery>[],
      numPages: (json['num_pages'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GallerySearchToJson(_GallerySearch instance) =>
    <String, dynamic>{
      'result': instance.result,
      'num_pages': instance.numPages,
      'per_page': instance.perPage,
    };
