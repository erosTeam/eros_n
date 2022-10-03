// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Gallery _$$_GalleryFromJson(Map<String, dynamic> json) => _$_Gallery(
      gid: json['id'] as String?,
      mediaId: json['media_id'] as String?,
      title: json['title'] == null
          ? const GalleryTitle()
          : GalleryTitle.fromJson(json['title'] as Map<String, dynamic>),
      url: json['url'] as String?,
      thumbUrl: json['thumbUrl'] as String?,
      thumbHeight: json['thumbHeight'] as int?,
      thumbWidth: json['thumbWidth'] as int?,
      viewTime: json['viewTime'] as int?,
      images: json['images'] == null
          ? const GalleryImages()
          : GalleryImages.fromJson(json['images'] as Map<String, dynamic>),
      scanlator: json['scanlator'] as String?,
      uploadDate: json['upload_date'] as int?,
      numPages: json['num_pages'] as int?,
      numFavorites: json['num_favorites'] as int?,
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Tag>[],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Comment>[],
    );

Map<String, dynamic> _$$_GalleryToJson(_$_Gallery instance) =>
    <String, dynamic>{
      'id': instance.gid,
      'media_id': instance.mediaId,
      'title': instance.title,
      'url': instance.url,
      'thumbUrl': instance.thumbUrl,
      'thumbHeight': instance.thumbHeight,
      'thumbWidth': instance.thumbWidth,
      'viewTime': instance.viewTime,
      'images': instance.images,
      'scanlator': instance.scanlator,
      'upload_date': instance.uploadDate,
      'num_pages': instance.numPages,
      'num_favorites': instance.numFavorites,
      'tags': instance.tags,
      'comments': instance.comments,
    };
