// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gallery_images.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GalleryImages _$GalleryImagesFromJson(Map<String, dynamic> json) {
  return _GalleryImages.fromJson(json);
}

/// @nodoc
mixin _$GalleryImages {
  @JsonKey(name: 'pages')
  List<GalleryImage> get pages => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover')
  GalleryImage get cover => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail')
  GalleryImage get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryImagesCopyWith<GalleryImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryImagesCopyWith<$Res> {
  factory $GalleryImagesCopyWith(
          GalleryImages value, $Res Function(GalleryImages) then) =
      _$GalleryImagesCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'pages') List<GalleryImage> pages,
      @JsonKey(name: 'cover') GalleryImage cover,
      @JsonKey(name: 'thumbnail') GalleryImage thumbnail});

  $GalleryImageCopyWith<$Res> get cover;
  $GalleryImageCopyWith<$Res> get thumbnail;
}

/// @nodoc
class _$GalleryImagesCopyWithImpl<$Res>
    implements $GalleryImagesCopyWith<$Res> {
  _$GalleryImagesCopyWithImpl(this._value, this._then);

  final GalleryImages _value;
  // ignore: unused_field
  final $Res Function(GalleryImages) _then;

  @override
  $Res call({
    Object? pages = freezed,
    Object? cover = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      pages: pages == freezed
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<GalleryImage>,
      cover: cover == freezed
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as GalleryImage,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as GalleryImage,
    ));
  }

  @override
  $GalleryImageCopyWith<$Res> get cover {
    return $GalleryImageCopyWith<$Res>(_value.cover, (value) {
      return _then(_value.copyWith(cover: value));
    });
  }

  @override
  $GalleryImageCopyWith<$Res> get thumbnail {
    return $GalleryImageCopyWith<$Res>(_value.thumbnail, (value) {
      return _then(_value.copyWith(thumbnail: value));
    });
  }
}

/// @nodoc
abstract class _$$_GalleryImagesCopyWith<$Res>
    implements $GalleryImagesCopyWith<$Res> {
  factory _$$_GalleryImagesCopyWith(
          _$_GalleryImages value, $Res Function(_$_GalleryImages) then) =
      __$$_GalleryImagesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'pages') List<GalleryImage> pages,
      @JsonKey(name: 'cover') GalleryImage cover,
      @JsonKey(name: 'thumbnail') GalleryImage thumbnail});

  @override
  $GalleryImageCopyWith<$Res> get cover;
  @override
  $GalleryImageCopyWith<$Res> get thumbnail;
}

/// @nodoc
class __$$_GalleryImagesCopyWithImpl<$Res>
    extends _$GalleryImagesCopyWithImpl<$Res>
    implements _$$_GalleryImagesCopyWith<$Res> {
  __$$_GalleryImagesCopyWithImpl(
      _$_GalleryImages _value, $Res Function(_$_GalleryImages) _then)
      : super(_value, (v) => _then(v as _$_GalleryImages));

  @override
  _$_GalleryImages get _value => super._value as _$_GalleryImages;

  @override
  $Res call({
    Object? pages = freezed,
    Object? cover = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_$_GalleryImages(
      pages: pages == freezed
          ? _value._pages
          : pages // ignore: cast_nullable_to_non_nullable
              as List<GalleryImage>,
      cover: cover == freezed
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as GalleryImage,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as GalleryImage,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_GalleryImages implements _GalleryImages {
  const _$_GalleryImages(
      {@JsonKey(name: 'pages')
          final List<GalleryImage> pages = const <GalleryImage>[],
      @JsonKey(name: 'cover')
          this.cover = const GalleryImage(),
      @JsonKey(name: 'thumbnail')
          this.thumbnail = const GalleryImage()})
      : _pages = pages;

  factory _$_GalleryImages.fromJson(Map<String, dynamic> json) =>
      _$$_GalleryImagesFromJson(json);

  final List<GalleryImage> _pages;
  @override
  @JsonKey(name: 'pages')
  List<GalleryImage> get pages {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pages);
  }

  @override
  @JsonKey(name: 'cover')
  final GalleryImage cover;
  @override
  @JsonKey(name: 'thumbnail')
  final GalleryImage thumbnail;

  @override
  String toString() {
    return 'GalleryImages(pages: $pages, cover: $cover, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryImages &&
            const DeepCollectionEquality().equals(other._pages, _pages) &&
            const DeepCollectionEquality().equals(other.cover, cover) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pages),
      const DeepCollectionEquality().hash(cover),
      const DeepCollectionEquality().hash(thumbnail));

  @JsonKey(ignore: true)
  @override
  _$$_GalleryImagesCopyWith<_$_GalleryImages> get copyWith =>
      __$$_GalleryImagesCopyWithImpl<_$_GalleryImages>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GalleryImagesToJson(
      this,
    );
  }
}

abstract class _GalleryImages implements GalleryImages {
  const factory _GalleryImages(
          {@JsonKey(name: 'pages') final List<GalleryImage> pages,
          @JsonKey(name: 'cover') final GalleryImage cover,
          @JsonKey(name: 'thumbnail') final GalleryImage thumbnail}) =
      _$_GalleryImages;

  factory _GalleryImages.fromJson(Map<String, dynamic> json) =
      _$_GalleryImages.fromJson;

  @override
  @JsonKey(name: 'pages')
  List<GalleryImage> get pages;
  @override
  @JsonKey(name: 'cover')
  GalleryImage get cover;
  @override
  @JsonKey(name: 'thumbnail')
  GalleryImage get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryImagesCopyWith<_$_GalleryImages> get copyWith =>
      throw _privateConstructorUsedError;
}
