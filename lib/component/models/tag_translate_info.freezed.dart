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
  String? get nhTagVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TagTranslateInfoCopyWith<TagTranslateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagTranslateInfoCopyWith<$Res> {
  factory $TagTranslateInfoCopyWith(
          TagTranslateInfo value, $Res Function(TagTranslateInfo) then) =
      _$TagTranslateInfoCopyWithImpl<$Res, TagTranslateInfo>;
  @useResult
  $Res call(
      {String? version,
      String? remoteVersion,
      String? lastReleaseUrl,
      String? nhTagVersion});
}

/// @nodoc
class _$TagTranslateInfoCopyWithImpl<$Res, $Val extends TagTranslateInfo>
    implements $TagTranslateInfoCopyWith<$Res> {
  _$TagTranslateInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = freezed,
    Object? remoteVersion = freezed,
    Object? lastReleaseUrl = freezed,
    Object? nhTagVersion = freezed,
  }) {
    return _then(_value.copyWith(
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteVersion: freezed == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      lastReleaseUrl: freezed == lastReleaseUrl
          ? _value.lastReleaseUrl
          : lastReleaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nhTagVersion: freezed == nhTagVersion
          ? _value.nhTagVersion
          : nhTagVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TagTranslateInfoCopyWith<$Res>
    implements $TagTranslateInfoCopyWith<$Res> {
  factory _$$_TagTranslateInfoCopyWith(
          _$_TagTranslateInfo value, $Res Function(_$_TagTranslateInfo) then) =
      __$$_TagTranslateInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? version,
      String? remoteVersion,
      String? lastReleaseUrl,
      String? nhTagVersion});
}

/// @nodoc
class __$$_TagTranslateInfoCopyWithImpl<$Res>
    extends _$TagTranslateInfoCopyWithImpl<$Res, _$_TagTranslateInfo>
    implements _$$_TagTranslateInfoCopyWith<$Res> {
  __$$_TagTranslateInfoCopyWithImpl(
      _$_TagTranslateInfo _value, $Res Function(_$_TagTranslateInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = freezed,
    Object? remoteVersion = freezed,
    Object? lastReleaseUrl = freezed,
    Object? nhTagVersion = freezed,
  }) {
    return _then(_$_TagTranslateInfo(
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      remoteVersion: freezed == remoteVersion
          ? _value.remoteVersion
          : remoteVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      lastReleaseUrl: freezed == lastReleaseUrl
          ? _value.lastReleaseUrl
          : lastReleaseUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      nhTagVersion: freezed == nhTagVersion
          ? _value.nhTagVersion
          : nhTagVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_TagTranslateInfo
    with DiagnosticableTreeMixin
    implements _TagTranslateInfo {
  const _$_TagTranslateInfo(
      {this.version,
      this.remoteVersion,
      this.lastReleaseUrl,
      this.nhTagVersion});

  factory _$_TagTranslateInfo.fromJson(Map<String, dynamic> json) =>
      _$$_TagTranslateInfoFromJson(json);

  @override
  final String? version;
  @override
  final String? remoteVersion;
  @override
  final String? lastReleaseUrl;
  @override
  final String? nhTagVersion;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TagTranslateInfo(version: $version, remoteVersion: $remoteVersion, lastReleaseUrl: $lastReleaseUrl, nhTagVersion: $nhTagVersion)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TagTranslateInfo'))
      ..add(DiagnosticsProperty('version', version))
      ..add(DiagnosticsProperty('remoteVersion', remoteVersion))
      ..add(DiagnosticsProperty('lastReleaseUrl', lastReleaseUrl))
      ..add(DiagnosticsProperty('nhTagVersion', nhTagVersion));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TagTranslateInfo &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.remoteVersion, remoteVersion) ||
                other.remoteVersion == remoteVersion) &&
            (identical(other.lastReleaseUrl, lastReleaseUrl) ||
                other.lastReleaseUrl == lastReleaseUrl) &&
            (identical(other.nhTagVersion, nhTagVersion) ||
                other.nhTagVersion == nhTagVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, version, remoteVersion, lastReleaseUrl, nhTagVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
      final String? lastReleaseUrl,
      final String? nhTagVersion}) = _$_TagTranslateInfo;

  factory _TagTranslateInfo.fromJson(Map<String, dynamic> json) =
      _$_TagTranslateInfo.fromJson;

  @override
  String? get version;
  @override
  String? get remoteVersion;
  @override
  String? get lastReleaseUrl;
  @override
  String? get nhTagVersion;
  @override
  @JsonKey(ignore: true)
  _$$_TagTranslateInfoCopyWith<_$_TagTranslateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
