// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_poster.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentPoster implements DiagnosticableTreeMixin {

@JsonKey(name: 'id') int? get posterId;@JsonKey(name: 'username') String? get username;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'is_superuser') bool? get isSuperuser;@JsonKey(name: 'is_staff') bool? get isStaff;
/// Create a copy of CommentPoster
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentPosterCopyWith<CommentPoster> get copyWith => _$CommentPosterCopyWithImpl<CommentPoster>(this as CommentPoster, _$identity);

  /// Serializes this CommentPoster to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CommentPoster'))
    ..add(DiagnosticsProperty('posterId', posterId))..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('avatarUrl', avatarUrl))..add(DiagnosticsProperty('isSuperuser', isSuperuser))..add(DiagnosticsProperty('isStaff', isStaff));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentPoster&&(identical(other.posterId, posterId) || other.posterId == posterId)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isSuperuser, isSuperuser) || other.isSuperuser == isSuperuser)&&(identical(other.isStaff, isStaff) || other.isStaff == isStaff));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,posterId,username,avatarUrl,isSuperuser,isStaff);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CommentPoster(posterId: $posterId, username: $username, avatarUrl: $avatarUrl, isSuperuser: $isSuperuser, isStaff: $isStaff)';
}


}

/// @nodoc
abstract mixin class $CommentPosterCopyWith<$Res>  {
  factory $CommentPosterCopyWith(CommentPoster value, $Res Function(CommentPoster) _then) = _$CommentPosterCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? posterId,@JsonKey(name: 'username') String? username,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'is_superuser') bool? isSuperuser,@JsonKey(name: 'is_staff') bool? isStaff
});




}
/// @nodoc
class _$CommentPosterCopyWithImpl<$Res>
    implements $CommentPosterCopyWith<$Res> {
  _$CommentPosterCopyWithImpl(this._self, this._then);

  final CommentPoster _self;
  final $Res Function(CommentPoster) _then;

/// Create a copy of CommentPoster
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? posterId = freezed,Object? username = freezed,Object? avatarUrl = freezed,Object? isSuperuser = freezed,Object? isStaff = freezed,}) {
  return _then(_self.copyWith(
posterId: freezed == posterId ? _self.posterId : posterId // ignore: cast_nullable_to_non_nullable
as int?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,isSuperuser: freezed == isSuperuser ? _self.isSuperuser : isSuperuser // ignore: cast_nullable_to_non_nullable
as bool?,isStaff: freezed == isStaff ? _self.isStaff : isStaff // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentPoster].
extension CommentPosterPatterns on CommentPoster {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentPoster value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentPoster() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentPoster value)  $default,){
final _that = this;
switch (_that) {
case _CommentPoster():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentPoster value)?  $default,){
final _that = this;
switch (_that) {
case _CommentPoster() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? posterId, @JsonKey(name: 'username')  String? username, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'is_superuser')  bool? isSuperuser, @JsonKey(name: 'is_staff')  bool? isStaff)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentPoster() when $default != null:
return $default(_that.posterId,_that.username,_that.avatarUrl,_that.isSuperuser,_that.isStaff);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? posterId, @JsonKey(name: 'username')  String? username, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'is_superuser')  bool? isSuperuser, @JsonKey(name: 'is_staff')  bool? isStaff)  $default,) {final _that = this;
switch (_that) {
case _CommentPoster():
return $default(_that.posterId,_that.username,_that.avatarUrl,_that.isSuperuser,_that.isStaff);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? posterId, @JsonKey(name: 'username')  String? username, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'is_superuser')  bool? isSuperuser, @JsonKey(name: 'is_staff')  bool? isStaff)?  $default,) {final _that = this;
switch (_that) {
case _CommentPoster() when $default != null:
return $default(_that.posterId,_that.username,_that.avatarUrl,_that.isSuperuser,_that.isStaff);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _CommentPoster with DiagnosticableTreeMixin implements CommentPoster {
  const _CommentPoster({@JsonKey(name: 'id') this.posterId, @JsonKey(name: 'username') this.username, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'is_superuser') this.isSuperuser, @JsonKey(name: 'is_staff') this.isStaff});
  factory _CommentPoster.fromJson(Map<String, dynamic> json) => _$CommentPosterFromJson(json);

@override@JsonKey(name: 'id') final  int? posterId;
@override@JsonKey(name: 'username') final  String? username;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'is_superuser') final  bool? isSuperuser;
@override@JsonKey(name: 'is_staff') final  bool? isStaff;

/// Create a copy of CommentPoster
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentPosterCopyWith<_CommentPoster> get copyWith => __$CommentPosterCopyWithImpl<_CommentPoster>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentPosterToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'CommentPoster'))
    ..add(DiagnosticsProperty('posterId', posterId))..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('avatarUrl', avatarUrl))..add(DiagnosticsProperty('isSuperuser', isSuperuser))..add(DiagnosticsProperty('isStaff', isStaff));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentPoster&&(identical(other.posterId, posterId) || other.posterId == posterId)&&(identical(other.username, username) || other.username == username)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.isSuperuser, isSuperuser) || other.isSuperuser == isSuperuser)&&(identical(other.isStaff, isStaff) || other.isStaff == isStaff));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,posterId,username,avatarUrl,isSuperuser,isStaff);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'CommentPoster(posterId: $posterId, username: $username, avatarUrl: $avatarUrl, isSuperuser: $isSuperuser, isStaff: $isStaff)';
}


}

/// @nodoc
abstract mixin class _$CommentPosterCopyWith<$Res> implements $CommentPosterCopyWith<$Res> {
  factory _$CommentPosterCopyWith(_CommentPoster value, $Res Function(_CommentPoster) _then) = __$CommentPosterCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? posterId,@JsonKey(name: 'username') String? username,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'is_superuser') bool? isSuperuser,@JsonKey(name: 'is_staff') bool? isStaff
});




}
/// @nodoc
class __$CommentPosterCopyWithImpl<$Res>
    implements _$CommentPosterCopyWith<$Res> {
  __$CommentPosterCopyWithImpl(this._self, this._then);

  final _CommentPoster _self;
  final $Res Function(_CommentPoster) _then;

/// Create a copy of CommentPoster
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? posterId = freezed,Object? username = freezed,Object? avatarUrl = freezed,Object? isSuperuser = freezed,Object? isStaff = freezed,}) {
  return _then(_CommentPoster(
posterId: freezed == posterId ? _self.posterId : posterId // ignore: cast_nullable_to_non_nullable
as int?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,isSuperuser: freezed == isSuperuser ? _self.isSuperuser : isSuperuser // ignore: cast_nullable_to_non_nullable
as bool?,isStaff: freezed == isStaff ? _self.isStaff : isStaff // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
