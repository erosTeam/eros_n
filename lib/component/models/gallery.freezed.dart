// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gallery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Gallery _$GalleryFromJson(Map<String, dynamic> json) {
  return _Gallery.fromJson(json);
}

/// @nodoc
mixin _$Gallery {
  String? get gid => throw _privateConstructorUsedError;
  String? get imageKey => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get thumbUrl => throw _privateConstructorUsedError;
  int? get imgHeight => throw _privateConstructorUsedError;
  int? get imgWidth => throw _privateConstructorUsedError;
  List<GalleryImage> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryCopyWith<Gallery> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryCopyWith<$Res> {
  factory $GalleryCopyWith(Gallery value, $Res Function(Gallery) then) =
      _$GalleryCopyWithImpl<$Res>;
  $Res call(
      {String? gid,
      String? imageKey,
      String? title,
      String? url,
      String? thumbUrl,
      int? imgHeight,
      int? imgWidth,
      List<GalleryImage> images});
}

/// @nodoc
class _$GalleryCopyWithImpl<$Res> implements $GalleryCopyWith<$Res> {
  _$GalleryCopyWithImpl(this._value, this._then);

  final Gallery _value;
  // ignore: unused_field
  final $Res Function(Gallery) _then;

  @override
  $Res call({
    Object? gid = freezed,
    Object? imageKey = freezed,
    Object? title = freezed,
    Object? url = freezed,
    Object? thumbUrl = freezed,
    Object? imgHeight = freezed,
    Object? imgWidth = freezed,
    Object? images = freezed,
  }) {
    return _then(_value.copyWith(
      gid: gid == freezed
          ? _value.gid
          : gid // ignore: cast_nullable_to_non_nullable
              as String?,
      imageKey: imageKey == freezed
          ? _value.imageKey
          : imageKey // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbUrl: thumbUrl == freezed
          ? _value.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imgHeight: imgHeight == freezed
          ? _value.imgHeight
          : imgHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      imgWidth: imgWidth == freezed
          ? _value.imgWidth
          : imgWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<GalleryImage>,
    ));
  }
}

/// @nodoc
abstract class _$$_GalleryCopyWith<$Res> implements $GalleryCopyWith<$Res> {
  factory _$$_GalleryCopyWith(
          _$_Gallery value, $Res Function(_$_Gallery) then) =
      __$$_GalleryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? gid,
      String? imageKey,
      String? title,
      String? url,
      String? thumbUrl,
      int? imgHeight,
      int? imgWidth,
      List<GalleryImage> images});
}

/// @nodoc
class __$$_GalleryCopyWithImpl<$Res> extends _$GalleryCopyWithImpl<$Res>
    implements _$$_GalleryCopyWith<$Res> {
  __$$_GalleryCopyWithImpl(_$_Gallery _value, $Res Function(_$_Gallery) _then)
      : super(_value, (v) => _then(v as _$_Gallery));

  @override
  _$_Gallery get _value => super._value as _$_Gallery;

  @override
  $Res call({
    Object? gid = freezed,
    Object? imageKey = freezed,
    Object? title = freezed,
    Object? url = freezed,
    Object? thumbUrl = freezed,
    Object? imgHeight = freezed,
    Object? imgWidth = freezed,
    Object? images = freezed,
  }) {
    return _then(_$_Gallery(
      gid: gid == freezed
          ? _value.gid
          : gid // ignore: cast_nullable_to_non_nullable
              as String?,
      imageKey: imageKey == freezed
          ? _value.imageKey
          : imageKey // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbUrl: thumbUrl == freezed
          ? _value.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imgHeight: imgHeight == freezed
          ? _value.imgHeight
          : imgHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      imgWidth: imgWidth == freezed
          ? _value.imgWidth
          : imgWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<GalleryImage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gallery implements _Gallery {
  const _$_Gallery(
      {this.gid,
      this.imageKey,
      this.title,
      this.url,
      this.thumbUrl,
      this.imgHeight,
      this.imgWidth,
      final List<GalleryImage> images = const []})
      : _images = images;

  factory _$_Gallery.fromJson(Map<String, dynamic> json) =>
      _$$_GalleryFromJson(json);

  @override
  final String? gid;
  @override
  final String? imageKey;
  @override
  final String? title;
  @override
  final String? url;
  @override
  final String? thumbUrl;
  @override
  final int? imgHeight;
  @override
  final int? imgWidth;
  final List<GalleryImage> _images;
  @override
  @JsonKey()
  List<GalleryImage> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'Gallery(gid: $gid, imageKey: $imageKey, title: $title, url: $url, thumbUrl: $thumbUrl, imgHeight: $imgHeight, imgWidth: $imgWidth, images: $images)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gallery &&
            const DeepCollectionEquality().equals(other.gid, gid) &&
            const DeepCollectionEquality().equals(other.imageKey, imageKey) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.thumbUrl, thumbUrl) &&
            const DeepCollectionEquality().equals(other.imgHeight, imgHeight) &&
            const DeepCollectionEquality().equals(other.imgWidth, imgWidth) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gid),
      const DeepCollectionEquality().hash(imageKey),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(thumbUrl),
      const DeepCollectionEquality().hash(imgHeight),
      const DeepCollectionEquality().hash(imgWidth),
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  _$$_GalleryCopyWith<_$_Gallery> get copyWith =>
      __$$_GalleryCopyWithImpl<_$_Gallery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GalleryToJson(
      this,
    );
  }
}

abstract class _Gallery implements Gallery {
  const factory _Gallery(
      {final String? gid,
      final String? imageKey,
      final String? title,
      final String? url,
      final String? thumbUrl,
      final int? imgHeight,
      final int? imgWidth,
      final List<GalleryImage> images}) = _$_Gallery;

  factory _Gallery.fromJson(Map<String, dynamic> json) = _$_Gallery.fromJson;

  @override
  String? get gid;
  @override
  String? get imageKey;
  @override
  String? get title;
  @override
  String? get url;
  @override
  String? get thumbUrl;
  @override
  int? get imgHeight;
  @override
  int? get imgWidth;
  @override
  List<GalleryImage> get images;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryCopyWith<_$_Gallery> get copyWith =>
      throw _privateConstructorUsedError;
}
