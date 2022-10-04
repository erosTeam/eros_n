// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GallerySearch _$$_GallerySearchFromJson(Map<String, dynamic> json) =>
    _$_GallerySearch(
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Gallery>[],
      numPages: json['num_pages'] as int?,
      perPage: json['per_page'] as int?,
    );

Map<String, dynamic> _$$_GallerySearchToJson(_$_GallerySearch instance) =>
    <String, dynamic>{
      'result': instance.result,
      'num_pages': instance.numPages,
      'per_page': instance.perPage,
    };
