// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User implements DiagnosticableTreeMixin {

 String? get userName; String? get avatarUrl; String? get userId; String? get userUrl; String? get sessionid;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'User'))
    ..add(DiagnosticsProperty('userName', userName))..add(DiagnosticsProperty('avatarUrl', avatarUrl))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('userUrl', userUrl))..add(DiagnosticsProperty('sessionid', sessionid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userUrl, userUrl) || other.userUrl == userUrl)&&(identical(other.sessionid, sessionid) || other.sessionid == sessionid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,avatarUrl,userId,userUrl,sessionid);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'User(userName: $userName, avatarUrl: $avatarUrl, userId: $userId, userUrl: $userUrl, sessionid: $sessionid)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String? userName, String? avatarUrl, String? userId, String? userUrl, String? sessionid
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userName = freezed,Object? avatarUrl = freezed,Object? userId = freezed,Object? userUrl = freezed,Object? sessionid = freezed,}) {
  return _then(_self.copyWith(
userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,userUrl: freezed == userUrl ? _self.userUrl : userUrl // ignore: cast_nullable_to_non_nullable
as String?,sessionid: freezed == sessionid ? _self.sessionid : sessionid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? userName,  String? avatarUrl,  String? userId,  String? userUrl,  String? sessionid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.userName,_that.avatarUrl,_that.userId,_that.userUrl,_that.sessionid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? userName,  String? avatarUrl,  String? userId,  String? userUrl,  String? sessionid)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.userName,_that.avatarUrl,_that.userId,_that.userUrl,_that.sessionid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? userName,  String? avatarUrl,  String? userId,  String? userUrl,  String? sessionid)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.userName,_that.avatarUrl,_that.userId,_that.userUrl,_that.sessionid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User extends User with DiagnosticableTreeMixin {
  const _User({this.userName, this.avatarUrl, this.userId, this.userUrl, this.sessionid}): super._();
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String? userName;
@override final  String? avatarUrl;
@override final  String? userId;
@override final  String? userUrl;
@override final  String? sessionid;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'User'))
    ..add(DiagnosticsProperty('userName', userName))..add(DiagnosticsProperty('avatarUrl', avatarUrl))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('userUrl', userUrl))..add(DiagnosticsProperty('sessionid', sessionid));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.userUrl, userUrl) || other.userUrl == userUrl)&&(identical(other.sessionid, sessionid) || other.sessionid == sessionid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userName,avatarUrl,userId,userUrl,sessionid);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'User(userName: $userName, avatarUrl: $avatarUrl, userId: $userId, userUrl: $userUrl, sessionid: $sessionid)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String? userName, String? avatarUrl, String? userId, String? userUrl, String? sessionid
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userName = freezed,Object? avatarUrl = freezed,Object? userId = freezed,Object? userUrl = freezed,Object? sessionid = freezed,}) {
  return _then(_User(
userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,userUrl: freezed == userUrl ? _self.userUrl : userUrl // ignore: cast_nullable_to_non_nullable
as String?,sessionid: freezed == sessionid ? _self.sessionid : sessionid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
