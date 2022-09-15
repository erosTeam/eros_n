// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gallery_thumb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GalleryThumb _$GalleryThumbFromJson(Map<String, dynamic> json) {
  return _GalleryThumb.fromJson(json);
}

/// @nodoc
mixin _$GalleryThumb {
  int? get index => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get thumbUrl => throw _privateConstructorUsedError;
  int? get imgHeight => throw _privateConstructorUsedError;
  int? get imgWidth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryThumbCopyWith<GalleryThumb> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryThumbCopyWith<$Res> {
  factory $GalleryThumbCopyWith(
          GalleryThumb value, $Res Function(GalleryThumb) then) =
      _$GalleryThumbCopyWithImpl<$Res>;
  $Res call(
      {int? index,
      String? url,
      String? thumbUrl,
      int? imgHeight,
      int? imgWidth});
}

/// @nodoc
class _$GalleryThumbCopyWithImpl<$Res> implements $GalleryThumbCopyWith<$Res> {
  _$GalleryThumbCopyWithImpl(this._value, this._then);

  final GalleryThumb _value;
  // ignore: unused_field
  final $Res Function(GalleryThumb) _then;

  @override
  $Res call({
    Object? index = freezed,
    Object? url = freezed,
    Object? thumbUrl = freezed,
    Object? imgHeight = freezed,
    Object? imgWidth = freezed,
  }) {
    return _then(_value.copyWith(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ));
  }
}

/// @nodoc
abstract class _$$_GalleryThumbCopyWith<$Res>
    implements $GalleryThumbCopyWith<$Res> {
  factory _$$_GalleryThumbCopyWith(
          _$_GalleryThumb value, $Res Function(_$_GalleryThumb) then) =
      __$$_GalleryThumbCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? index,
      String? url,
      String? thumbUrl,
      int? imgHeight,
      int? imgWidth});
}

/// @nodoc
class __$$_GalleryThumbCopyWithImpl<$Res>
    extends _$GalleryThumbCopyWithImpl<$Res>
    implements _$$_GalleryThumbCopyWith<$Res> {
  __$$_GalleryThumbCopyWithImpl(
      _$_GalleryThumb _value, $Res Function(_$_GalleryThumb) _then)
      : super(_value, (v) => _then(v as _$_GalleryThumb));

  @override
  _$_GalleryThumb get _value => super._value as _$_GalleryThumb;

  @override
  $Res call({
    Object? index = freezed,
    Object? url = freezed,
    Object? thumbUrl = freezed,
    Object? imgHeight = freezed,
    Object? imgWidth = freezed,
  }) {
    return _then(_$_GalleryThumb(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GalleryThumb implements _GalleryThumb {
  const _$_GalleryThumb(
      {this.index, this.url, this.thumbUrl, this.imgHeight, this.imgWidth});

  factory _$_GalleryThumb.fromJson(Map<String, dynamic> json) =>
      _$$_GalleryThumbFromJson(json);

  @override
  final int? index;
  @override
  final String? url;
  @override
  final String? thumbUrl;
  @override
  final int? imgHeight;
  @override
  final int? imgWidth;

  @override
  String toString() {
    return 'GalleryThumb(index: $index, url: $url, thumbUrl: $thumbUrl, imgHeight: $imgHeight, imgWidth: $imgWidth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryThumb &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.thumbUrl, thumbUrl) &&
            const DeepCollectionEquality().equals(other.imgHeight, imgHeight) &&
            const DeepCollectionEquality().equals(other.imgWidth, imgWidth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(thumbUrl),
      const DeepCollectionEquality().hash(imgHeight),
      const DeepCollectionEquality().hash(imgWidth));

  @JsonKey(ignore: true)
  @override
  _$$_GalleryThumbCopyWith<_$_GalleryThumb> get copyWith =>
      __$$_GalleryThumbCopyWithImpl<_$_GalleryThumb>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GalleryThumbToJson(
      this,
    );
  }
}

abstract class _GalleryThumb implements GalleryThumb {
  const factory _GalleryThumb(
      {final int? index,
      final String? url,
      final String? thumbUrl,
      final int? imgHeight,
      final int? imgWidth}) = _$_GalleryThumb;

  factory _GalleryThumb.fromJson(Map<String, dynamic> json) =
      _$_GalleryThumb.fromJson;

  @override
  int? get index;
  @override
  String? get url;
  @override
  String? get thumbUrl;
  @override
  int? get imgHeight;
  @override
  int? get imgWidth;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryThumbCopyWith<_$_GalleryThumb> get copyWith =>
      throw _privateConstructorUsedError;
}
