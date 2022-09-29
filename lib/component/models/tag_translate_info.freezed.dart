// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tag_translate_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TagTranslateInfo _$TagTranslateInfoFromJson(Map<String, dynamic> json) {
  return _TagTranslateInfo.fromJson(json);
}

/// @nodoc
mixin _$TagTranslateInfo {
  String? get version => throw _privateConstructorUsedError;
  String? get remoteVersion => throw _privateConstructorUsedError;
  String? get lastReleaseUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagTranslateInfoCopyWith<TagTranslateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagTranslateInfoCopyWith<$Res> {
  factory $TagTranslateInfoCopyWith(
          TagTranslateInfo value, $Res Function(TagTranslateInfo) then) =
      _$TagTranslateInfoCopyWithImpl<$Res>;
  $Res call({String? version, String? remoteVersion, String? lastReleaseUrl});
}

/// @nodoc
class _$TagTranslateInfoCopyWithImpl<$Res>
    implements $TagTranslateInfoCopyWith<$Res> {
  _$TagTranslateInfoCopyWithImpl(this._value, this._then);

  final TagTranslateInfo _value;
  // ignore: unused_field
  final $Res Function(TagTranslateInfo) _then;

  @override
  $Res call({
    Object? version = freezed,
    Object? remoteVersion = freezed,
    Object? lastReleaseUrl = freezed,
  }) {
    return _then(_value.copyWith(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteVersion: remoteVersion == freezed
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      lastReleaseUrl: lastReleaseUrl == freezed
          ? _value.lastReleaseUrl
          : lastReleaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TagTranslateInfoCopyWith<$Res>
    implements $TagTranslateInfoCopyWith<$Res> {
  factory _$$_TagTranslateInfoCopyWith(
          _$_TagTranslateInfo value, $Res Function(_$_TagTranslateInfo) then) =
      __$$_TagTranslateInfoCopyWithImpl<$Res>;
  @override
  $Res call({String? version, String? remoteVersion, String? lastReleaseUrl});
}

/// @nodoc
class __$$_TagTranslateInfoCopyWithImpl<$Res>
    extends _$TagTranslateInfoCopyWithImpl<$Res>
    implements _$$_TagTranslateInfoCopyWith<$Res> {
  __$$_TagTranslateInfoCopyWithImpl(
      _$_TagTranslateInfo _value, $Res Function(_$_TagTranslateInfo) _then)
      : super(_value, (v) => _then(v as _$_TagTranslateInfo));

  @override
  _$_TagTranslateInfo get _value => super._value as _$_TagTranslateInfo;

  @override
  $Res call({
    Object? version = freezed,
    Object? remoteVersion = freezed,
    Object? lastReleaseUrl = freezed,
  }) {
    return _then(_$_TagTranslateInfo(
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteVersion: remoteVersion == freezed
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      lastReleaseUrl: lastReleaseUrl == freezed
          ? _value.lastReleaseUrl
          : lastReleaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_TagTranslateInfo implements _TagTranslateInfo {
  const _$_TagTranslateInfo(
      {this.version, this.remoteVersion, this.lastReleaseUrl});

  factory _$_TagTranslateInfo.fromJson(Map<String, dynamic> json) =>
      _$$_TagTranslateInfoFromJson(json);

  @override
  final String? version;
  @override
  final String? remoteVersion;
  @override
  final String? lastReleaseUrl;

  @override
  String toString() {
    return 'TagTranslateInfo(version: $version, remoteVersion: $remoteVersion, lastReleaseUrl: $lastReleaseUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagTranslateInfo &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality()
                .equals(other.remoteVersion, remoteVersion) &&
            const DeepCollectionEquality()
                .equals(other.lastReleaseUrl, lastReleaseUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(remoteVersion),
      const DeepCollectionEquality().hash(lastReleaseUrl));

  @JsonKey(ignore: true)
  @override
  _$$_TagTranslateInfoCopyWith<_$_TagTranslateInfo> get copyWith =>
      __$$_TagTranslateInfoCopyWithImpl<_$_TagTranslateInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TagTranslateInfoToJson(
      this,
    );
  }
}

abstract class _TagTranslateInfo implements TagTranslateInfo {
  const factory _TagTranslateInfo(
      {final String? version,
      final String? remoteVersion,
      final String? lastReleaseUrl}) = _$_TagTranslateInfo;

  factory _TagTranslateInfo.fromJson(Map<String, dynamic> json) =
      _$_TagTranslateInfo.fromJson;

  @override
  String? get version;
  @override
  String? get remoteVersion;
  @override
  String? get lastReleaseUrl;
  @override
  @JsonKey(ignore: true)
  _$$_TagTranslateInfoCopyWith<_$_TagTranslateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
