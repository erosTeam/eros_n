// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gallery_title.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GalleryTitle _$GalleryTitleFromJson(Map<String, dynamic> json) {
  return _GalleryTitle.fromJson(json);
}

/// @nodoc
mixin _$GalleryTitle {
  @JsonKey(name: 'english')
  String? get englishTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'japanese')
  String? get japaneseTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'pretty')
  String? get prettyTitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryTitleCopyWith<GalleryTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryTitleCopyWith<$Res> {
  factory $GalleryTitleCopyWith(
          GalleryTitle value, $Res Function(GalleryTitle) then) =
      _$GalleryTitleCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'english') String? englishTitle,
      @JsonKey(name: 'japanese') String? japaneseTitle,
      @JsonKey(name: 'pretty') String? prettyTitle});
}

/// @nodoc
class _$GalleryTitleCopyWithImpl<$Res> implements $GalleryTitleCopyWith<$Res> {
  _$GalleryTitleCopyWithImpl(this._value, this._then);

  final GalleryTitle _value;
  // ignore: unused_field
  final $Res Function(GalleryTitle) _then;

  @override
  $Res call({
    Object? englishTitle = freezed,
    Object? japaneseTitle = freezed,
    Object? prettyTitle = freezed,
  }) {
    return _then(_value.copyWith(
      englishTitle: englishTitle == freezed
          ? _value.englishTitle
          : englishTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      japaneseTitle: japaneseTitle == freezed
          ? _value.japaneseTitle
          : japaneseTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      prettyTitle: prettyTitle == freezed
          ? _value.prettyTitle
          : prettyTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_GalleryTitleCopyWith<$Res>
    implements $GalleryTitleCopyWith<$Res> {
  factory _$$_GalleryTitleCopyWith(
          _$_GalleryTitle value, $Res Function(_$_GalleryTitle) then) =
      __$$_GalleryTitleCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'english') String? englishTitle,
      @JsonKey(name: 'japanese') String? japaneseTitle,
      @JsonKey(name: 'pretty') String? prettyTitle});
}

/// @nodoc
class __$$_GalleryTitleCopyWithImpl<$Res>
    extends _$GalleryTitleCopyWithImpl<$Res>
    implements _$$_GalleryTitleCopyWith<$Res> {
  __$$_GalleryTitleCopyWithImpl(
      _$_GalleryTitle _value, $Res Function(_$_GalleryTitle) _then)
      : super(_value, (v) => _then(v as _$_GalleryTitle));

  @override
  _$_GalleryTitle get _value => super._value as _$_GalleryTitle;

  @override
  $Res call({
    Object? englishTitle = freezed,
    Object? japaneseTitle = freezed,
    Object? prettyTitle = freezed,
  }) {
    return _then(_$_GalleryTitle(
      englishTitle: englishTitle == freezed
          ? _value.englishTitle
          : englishTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      japaneseTitle: japaneseTitle == freezed
          ? _value.japaneseTitle
          : japaneseTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      prettyTitle: prettyTitle == freezed
          ? _value.prettyTitle
          : prettyTitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_GalleryTitle implements _GalleryTitle {
  const _$_GalleryTitle(
      {@JsonKey(name: 'english') this.englishTitle,
      @JsonKey(name: 'japanese') this.japaneseTitle,
      @JsonKey(name: 'pretty') this.prettyTitle});

  factory _$_GalleryTitle.fromJson(Map<String, dynamic> json) =>
      _$$_GalleryTitleFromJson(json);

  @override
  @JsonKey(name: 'english')
  final String? englishTitle;
  @override
  @JsonKey(name: 'japanese')
  final String? japaneseTitle;
  @override
  @JsonKey(name: 'pretty')
  final String? prettyTitle;

  @override
  String toString() {
    return 'GalleryTitle(englishTitle: $englishTitle, japaneseTitle: $japaneseTitle, prettyTitle: $prettyTitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryTitle &&
            const DeepCollectionEquality()
                .equals(other.englishTitle, englishTitle) &&
            const DeepCollectionEquality()
                .equals(other.japaneseTitle, japaneseTitle) &&
            const DeepCollectionEquality()
                .equals(other.prettyTitle, prettyTitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(englishTitle),
      const DeepCollectionEquality().hash(japaneseTitle),
      const DeepCollectionEquality().hash(prettyTitle));

  @JsonKey(ignore: true)
  @override
  _$$_GalleryTitleCopyWith<_$_GalleryTitle> get copyWith =>
      __$$_GalleryTitleCopyWithImpl<_$_GalleryTitle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GalleryTitleToJson(
      this,
    );
  }
}

abstract class _GalleryTitle implements GalleryTitle {
  const factory _GalleryTitle(
      {@JsonKey(name: 'english') final String? englishTitle,
      @JsonKey(name: 'japanese') final String? japaneseTitle,
      @JsonKey(name: 'pretty') final String? prettyTitle}) = _$_GalleryTitle;

  factory _GalleryTitle.fromJson(Map<String, dynamic> json) =
      _$_GalleryTitle.fromJson;

  @override
  @JsonKey(name: 'english')
  String? get englishTitle;
  @override
  @JsonKey(name: 'japanese')
  String? get japaneseTitle;
  @override
  @JsonKey(name: 'pretty')
  String? get prettyTitle;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryTitleCopyWith<_$_GalleryTitle> get copyWith =>
      throw _privateConstructorUsedError;
}
