// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_translate_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TagTranslateInfo implements DiagnosticableTreeMixin {

 String? get version; String? get remoteVersion; String? get lastReleaseUrl; String? get nhTagVersion;@JsonKey(includeToJson: false, includeFromJson: false) bool get isUpdating;
/// Create a copy of TagTranslateInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagTranslateInfoCopyWith<TagTranslateInfo> get copyWith => _$TagTranslateInfoCopyWithImpl<TagTranslateInfo>(this as TagTranslateInfo, _$identity);

  /// Serializes this TagTranslateInfo to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagTranslateInfo'))
    ..add(DiagnosticsProperty('version', version))..add(DiagnosticsProperty('remoteVersion', remoteVersion))..add(DiagnosticsProperty('lastReleaseUrl', lastReleaseUrl))..add(DiagnosticsProperty('nhTagVersion', nhTagVersion))..add(DiagnosticsProperty('isUpdating', isUpdating));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TagTranslateInfo&&(identical(other.version, version) || other.version == version)&&(identical(other.remoteVersion, remoteVersion) || other.remoteVersion == remoteVersion)&&(identical(other.lastReleaseUrl, lastReleaseUrl) || other.lastReleaseUrl == lastReleaseUrl)&&(identical(other.nhTagVersion, nhTagVersion) || other.nhTagVersion == nhTagVersion)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,remoteVersion,lastReleaseUrl,nhTagVersion,isUpdating);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagTranslateInfo(version: $version, remoteVersion: $remoteVersion, lastReleaseUrl: $lastReleaseUrl, nhTagVersion: $nhTagVersion, isUpdating: $isUpdating)';
}


}

/// @nodoc
abstract mixin class $TagTranslateInfoCopyWith<$Res>  {
  factory $TagTranslateInfoCopyWith(TagTranslateInfo value, $Res Function(TagTranslateInfo) _then) = _$TagTranslateInfoCopyWithImpl;
@useResult
$Res call({
 String? version, String? remoteVersion, String? lastReleaseUrl, String? nhTagVersion,@JsonKey(includeToJson: false, includeFromJson: false) bool isUpdating
});




}
/// @nodoc
class _$TagTranslateInfoCopyWithImpl<$Res>
    implements $TagTranslateInfoCopyWith<$Res> {
  _$TagTranslateInfoCopyWithImpl(this._self, this._then);

  final TagTranslateInfo _self;
  final $Res Function(TagTranslateInfo) _then;

/// Create a copy of TagTranslateInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = freezed,Object? remoteVersion = freezed,Object? lastReleaseUrl = freezed,Object? nhTagVersion = freezed,Object? isUpdating = null,}) {
  return _then(_self.copyWith(
version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,remoteVersion: freezed == remoteVersion ? _self.remoteVersion : remoteVersion // ignore: cast_nullable_to_non_nullable
as String?,lastReleaseUrl: freezed == lastReleaseUrl ? _self.lastReleaseUrl : lastReleaseUrl // ignore: cast_nullable_to_non_nullable
as String?,nhTagVersion: freezed == nhTagVersion ? _self.nhTagVersion : nhTagVersion // ignore: cast_nullable_to_non_nullable
as String?,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TagTranslateInfo].
extension TagTranslateInfoPatterns on TagTranslateInfo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TagTranslateInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TagTranslateInfo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TagTranslateInfo value)  $default,){
final _that = this;
switch (_that) {
case _TagTranslateInfo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TagTranslateInfo value)?  $default,){
final _that = this;
switch (_that) {
case _TagTranslateInfo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? version,  String? remoteVersion,  String? lastReleaseUrl,  String? nhTagVersion, @JsonKey(includeToJson: false, includeFromJson: false)  bool isUpdating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TagTranslateInfo() when $default != null:
return $default(_that.version,_that.remoteVersion,_that.lastReleaseUrl,_that.nhTagVersion,_that.isUpdating);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? version,  String? remoteVersion,  String? lastReleaseUrl,  String? nhTagVersion, @JsonKey(includeToJson: false, includeFromJson: false)  bool isUpdating)  $default,) {final _that = this;
switch (_that) {
case _TagTranslateInfo():
return $default(_that.version,_that.remoteVersion,_that.lastReleaseUrl,_that.nhTagVersion,_that.isUpdating);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? version,  String? remoteVersion,  String? lastReleaseUrl,  String? nhTagVersion, @JsonKey(includeToJson: false, includeFromJson: false)  bool isUpdating)?  $default,) {final _that = this;
switch (_that) {
case _TagTranslateInfo() when $default != null:
return $default(_that.version,_that.remoteVersion,_that.lastReleaseUrl,_that.nhTagVersion,_that.isUpdating);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _TagTranslateInfo with DiagnosticableTreeMixin implements TagTranslateInfo {
  const _TagTranslateInfo({this.version, this.remoteVersion, this.lastReleaseUrl, this.nhTagVersion, @JsonKey(includeToJson: false, includeFromJson: false) this.isUpdating = false});
  factory _TagTranslateInfo.fromJson(Map<String, dynamic> json) => _$TagTranslateInfoFromJson(json);

@override final  String? version;
@override final  String? remoteVersion;
@override final  String? lastReleaseUrl;
@override final  String? nhTagVersion;
@override@JsonKey(includeToJson: false, includeFromJson: false) final  bool isUpdating;

/// Create a copy of TagTranslateInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagTranslateInfoCopyWith<_TagTranslateInfo> get copyWith => __$TagTranslateInfoCopyWithImpl<_TagTranslateInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TagTranslateInfoToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TagTranslateInfo'))
    ..add(DiagnosticsProperty('version', version))..add(DiagnosticsProperty('remoteVersion', remoteVersion))..add(DiagnosticsProperty('lastReleaseUrl', lastReleaseUrl))..add(DiagnosticsProperty('nhTagVersion', nhTagVersion))..add(DiagnosticsProperty('isUpdating', isUpdating));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TagTranslateInfo&&(identical(other.version, version) || other.version == version)&&(identical(other.remoteVersion, remoteVersion) || other.remoteVersion == remoteVersion)&&(identical(other.lastReleaseUrl, lastReleaseUrl) || other.lastReleaseUrl == lastReleaseUrl)&&(identical(other.nhTagVersion, nhTagVersion) || other.nhTagVersion == nhTagVersion)&&(identical(other.isUpdating, isUpdating) || other.isUpdating == isUpdating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version,remoteVersion,lastReleaseUrl,nhTagVersion,isUpdating);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TagTranslateInfo(version: $version, remoteVersion: $remoteVersion, lastReleaseUrl: $lastReleaseUrl, nhTagVersion: $nhTagVersion, isUpdating: $isUpdating)';
}


}

/// @nodoc
abstract mixin class _$TagTranslateInfoCopyWith<$Res> implements $TagTranslateInfoCopyWith<$Res> {
  factory _$TagTranslateInfoCopyWith(_TagTranslateInfo value, $Res Function(_TagTranslateInfo) _then) = __$TagTranslateInfoCopyWithImpl;
@override @useResult
$Res call({
 String? version, String? remoteVersion, String? lastReleaseUrl, String? nhTagVersion,@JsonKey(includeToJson: false, includeFromJson: false) bool isUpdating
});




}
/// @nodoc
class __$TagTranslateInfoCopyWithImpl<$Res>
    implements _$TagTranslateInfoCopyWith<$Res> {
  __$TagTranslateInfoCopyWithImpl(this._self, this._then);

  final _TagTranslateInfo _self;
  final $Res Function(_TagTranslateInfo) _then;

/// Create a copy of TagTranslateInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = freezed,Object? remoteVersion = freezed,Object? lastReleaseUrl = freezed,Object? nhTagVersion = freezed,Object? isUpdating = null,}) {
  return _then(_TagTranslateInfo(
version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,remoteVersion: freezed == remoteVersion ? _self.remoteVersion : remoteVersion // ignore: cast_nullable_to_non_nullable
as String?,lastReleaseUrl: freezed == lastReleaseUrl ? _self.lastReleaseUrl : lastReleaseUrl // ignore: cast_nullable_to_non_nullable
as String?,nhTagVersion: freezed == nhTagVersion ? _self.nhTagVersion : nhTagVersion // ignore: cast_nullable_to_non_nullable
as String?,isUpdating: null == isUpdating ? _self.isUpdating : isUpdating // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
