// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return _Settings.fromJson(json);
}

/// @nodoc
mixin _$Settings {
  bool get isCoverBlur => throw _privateConstructorUsedError;
  bool get isTagTranslate => throw _privateConstructorUsedError;
  bool get dynamicColor => throw _privateConstructorUsedError;
  SearchSort get searchSort => throw _privateConstructorUsedError;
  bool get showTags => throw _privateConstructorUsedError;
  TagLayoutOnCard get tagLayoutOnCard => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res>;
  $Res call(
      {bool isCoverBlur,
      bool isTagTranslate,
      bool dynamicColor,
      SearchSort searchSort,
      bool showTags,
      TagLayoutOnCard tagLayoutOnCard});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  final Settings _value;
  // ignore: unused_field
  final $Res Function(Settings) _then;

  @override
  $Res call({
    Object? isCoverBlur = freezed,
    Object? isTagTranslate = freezed,
    Object? dynamicColor = freezed,
    Object? searchSort = freezed,
    Object? showTags = freezed,
    Object? tagLayoutOnCard = freezed,
  }) {
    return _then(_value.copyWith(
      isCoverBlur: isCoverBlur == freezed
          ? _value.isCoverBlur
          : isCoverBlur // ignore: cast_nullable_to_non_nullable
              as bool,
      isTagTranslate: isTagTranslate == freezed
          ? _value.isTagTranslate
          : isTagTranslate // ignore: cast_nullable_to_non_nullable
              as bool,
      dynamicColor: dynamicColor == freezed
          ? _value.dynamicColor
          : dynamicColor // ignore: cast_nullable_to_non_nullable
              as bool,
      searchSort: searchSort == freezed
          ? _value.searchSort
          : searchSort // ignore: cast_nullable_to_non_nullable
              as SearchSort,
      showTags: showTags == freezed
          ? _value.showTags
          : showTags // ignore: cast_nullable_to_non_nullable
              as bool,
      tagLayoutOnCard: tagLayoutOnCard == freezed
          ? _value.tagLayoutOnCard
          : tagLayoutOnCard // ignore: cast_nullable_to_non_nullable
              as TagLayoutOnCard,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$$_SettingsCopyWith(
          _$_Settings value, $Res Function(_$_Settings) then) =
      __$$_SettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isCoverBlur,
      bool isTagTranslate,
      bool dynamicColor,
      SearchSort searchSort,
      bool showTags,
      TagLayoutOnCard tagLayoutOnCard});
}

/// @nodoc
class __$$_SettingsCopyWithImpl<$Res> extends _$SettingsCopyWithImpl<$Res>
    implements _$$_SettingsCopyWith<$Res> {
  __$$_SettingsCopyWithImpl(
      _$_Settings _value, $Res Function(_$_Settings) _then)
      : super(_value, (v) => _then(v as _$_Settings));

  @override
  _$_Settings get _value => super._value as _$_Settings;

  @override
  $Res call({
    Object? isCoverBlur = freezed,
    Object? isTagTranslate = freezed,
    Object? dynamicColor = freezed,
    Object? searchSort = freezed,
    Object? showTags = freezed,
    Object? tagLayoutOnCard = freezed,
  }) {
    return _then(_$_Settings(
      isCoverBlur: isCoverBlur == freezed
          ? _value.isCoverBlur
          : isCoverBlur // ignore: cast_nullable_to_non_nullable
              as bool,
      isTagTranslate: isTagTranslate == freezed
          ? _value.isTagTranslate
          : isTagTranslate // ignore: cast_nullable_to_non_nullable
              as bool,
      dynamicColor: dynamicColor == freezed
          ? _value.dynamicColor
          : dynamicColor // ignore: cast_nullable_to_non_nullable
              as bool,
      searchSort: searchSort == freezed
          ? _value.searchSort
          : searchSort // ignore: cast_nullable_to_non_nullable
              as SearchSort,
      showTags: showTags == freezed
          ? _value.showTags
          : showTags // ignore: cast_nullable_to_non_nullable
              as bool,
      tagLayoutOnCard: tagLayoutOnCard == freezed
          ? _value.tagLayoutOnCard
          : tagLayoutOnCard // ignore: cast_nullable_to_non_nullable
              as TagLayoutOnCard,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Settings implements _Settings {
  const _$_Settings(
      {this.isCoverBlur = false,
      this.isTagTranslate = false,
      this.dynamicColor = true,
      this.searchSort = SearchSort.recent,
      this.showTags = false,
      this.tagLayoutOnCard = TagLayoutOnCard.wrap});

  factory _$_Settings.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsFromJson(json);

  @override
  @JsonKey()
  final bool isCoverBlur;
  @override
  @JsonKey()
  final bool isTagTranslate;
  @override
  @JsonKey()
  final bool dynamicColor;
  @override
  @JsonKey()
  final SearchSort searchSort;
  @override
  @JsonKey()
  final bool showTags;
  @override
  @JsonKey()
  final TagLayoutOnCard tagLayoutOnCard;

  @override
  String toString() {
    return 'Settings(isCoverBlur: $isCoverBlur, isTagTranslate: $isTagTranslate, dynamicColor: $dynamicColor, searchSort: $searchSort, showTags: $showTags, tagLayoutOnCard: $tagLayoutOnCard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Settings &&
            const DeepCollectionEquality()
                .equals(other.isCoverBlur, isCoverBlur) &&
            const DeepCollectionEquality()
                .equals(other.isTagTranslate, isTagTranslate) &&
            const DeepCollectionEquality()
                .equals(other.dynamicColor, dynamicColor) &&
            const DeepCollectionEquality()
                .equals(other.searchSort, searchSort) &&
            const DeepCollectionEquality().equals(other.showTags, showTags) &&
            const DeepCollectionEquality()
                .equals(other.tagLayoutOnCard, tagLayoutOnCard));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isCoverBlur),
      const DeepCollectionEquality().hash(isTagTranslate),
      const DeepCollectionEquality().hash(dynamicColor),
      const DeepCollectionEquality().hash(searchSort),
      const DeepCollectionEquality().hash(showTags),
      const DeepCollectionEquality().hash(tagLayoutOnCard));

  @JsonKey(ignore: true)
  @override
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      __$$_SettingsCopyWithImpl<_$_Settings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsToJson(
      this,
    );
  }
}

abstract class _Settings implements Settings {
  const factory _Settings(
      {final bool isCoverBlur,
      final bool isTagTranslate,
      final bool dynamicColor,
      final SearchSort searchSort,
      final bool showTags,
      final TagLayoutOnCard tagLayoutOnCard}) = _$_Settings;

  factory _Settings.fromJson(Map<String, dynamic> json) = _$_Settings.fromJson;

  @override
  bool get isCoverBlur;
  @override
  bool get isTagTranslate;
  @override
  bool get dynamicColor;
  @override
  SearchSort get searchSort;
  @override
  bool get showTags;
  @override
  TagLayoutOnCard get tagLayoutOnCard;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}
