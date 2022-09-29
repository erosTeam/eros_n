// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Gallery _$$_GalleryFromJson(Map<String, dynamic> json) => _$_Gallery(
      gid: json['gid'] as String?,
      imageKey: json['imageKey'] as String?,
      csrfToken: json['csrfToken'] as String?,
      title: json['title'] as String?,
      secondTitle: json['secondTitle'] as String?,
      url: json['url'] as String?,
      thumbUrl: json['thumbUrl'] as String?,
      thumbHeight: json['thumbHeight'] as int?,
      thumbWidth: json['thumbWidth'] as int?,
      viewTime: json['viewTime'] as int?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => GalleryImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GalleryImage>[],
      currentPageIndex: json['currentPageIndex'] as int? ?? 0,
      isFavorited: json['isFavorited'] as bool?,
      favoritedNum: json['favoritedNum'] as String?,
      torrentUrl: json['torrentUrl'] as String?,
      moreLikeGallerys: (json['moreLikeGallerys'] as List<dynamic>?)
              ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Gallery>[],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Comment>[],
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Tag>[],
      uploadedDateTime: json['uploadedDateTime'] as String?,
    );

Map<String, dynamic> _$$_GalleryToJson(_$_Gallery instance) =>
    <String, dynamic>{
      'gid': instance.gid,
      'imageKey': instance.imageKey,
      'csrfToken': instance.csrfToken,
      'title': instance.title,
      'secondTitle': instance.secondTitle,
      'url': instance.url,
      'thumbUrl': instance.thumbUrl,
      'thumbHeight': instance.thumbHeight,
      'thumbWidth': instance.thumbWidth,
      'viewTime': instance.viewTime,
      'images': instance.images,
      'currentPageIndex': instance.currentPageIndex,
      'isFavorited': instance.isFavorited,
      'favoritedNum': instance.favoritedNum,
      'torrentUrl': instance.torrentUrl,
      'moreLikeGallerys': instance.moreLikeGallerys,
      'comments': instance.comments,
      'tags': instance.tags,
      'uploadedDateTime': instance.uploadedDateTime,
    };
