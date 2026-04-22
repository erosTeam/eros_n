// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GalleryViewState {

 PageStatus? get pageStatus; bool get appBartTansparent;
/// Create a copy of GalleryViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryViewStateCopyWith<GalleryViewState> get copyWith => _$GalleryViewStateCopyWithImpl<GalleryViewState>(this as GalleryViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryViewState&&(identical(other.pageStatus, pageStatus) || other.pageStatus == pageStatus)&&(identical(other.appBartTansparent, appBartTansparent) || other.appBartTansparent == appBartTansparent));
}


@override
int get hashCode => Object.hash(runtimeType,pageStatus,appBartTansparent);

@override
String toString() {
  return 'GalleryViewState(pageStatus: $pageStatus, appBartTansparent: $appBartTansparent)';
}


}

/// @nodoc
abstract mixin class $GalleryViewStateCopyWith<$Res>  {
  factory $GalleryViewStateCopyWith(GalleryViewState value, $Res Function(GalleryViewState) _then) = _$GalleryViewStateCopyWithImpl;
@useResult
$Res call({
 PageStatus? pageStatus, bool appBartTansparent
});




}
/// @nodoc
class _$GalleryViewStateCopyWithImpl<$Res>
    implements $GalleryViewStateCopyWith<$Res> {
  _$GalleryViewStateCopyWithImpl(this._self, this._then);

  final GalleryViewState _self;
  final $Res Function(GalleryViewState) _then;

/// Create a copy of GalleryViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageStatus = freezed,Object? appBartTansparent = null,}) {
  return _then(_self.copyWith(
pageStatus: freezed == pageStatus ? _self.pageStatus : pageStatus // ignore: cast_nullable_to_non_nullable
as PageStatus?,appBartTansparent: null == appBartTansparent ? _self.appBartTansparent : appBartTansparent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GalleryViewState].
extension GalleryViewStatePatterns on GalleryViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GalleryViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GalleryViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GalleryViewState value)  $default,){
final _that = this;
switch (_that) {
case _GalleryViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GalleryViewState value)?  $default,){
final _that = this;
switch (_that) {
case _GalleryViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageStatus? pageStatus,  bool appBartTansparent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GalleryViewState() when $default != null:
return $default(_that.pageStatus,_that.appBartTansparent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageStatus? pageStatus,  bool appBartTansparent)  $default,) {final _that = this;
switch (_that) {
case _GalleryViewState():
return $default(_that.pageStatus,_that.appBartTansparent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageStatus? pageStatus,  bool appBartTansparent)?  $default,) {final _that = this;
switch (_that) {
case _GalleryViewState() when $default != null:
return $default(_that.pageStatus,_that.appBartTansparent);case _:
  return null;

}
}

}

/// @nodoc


class _GalleryViewState implements GalleryViewState {
  const _GalleryViewState({this.pageStatus, this.appBartTansparent = true});
  

@override final  PageStatus? pageStatus;
@override@JsonKey() final  bool appBartTansparent;

/// Create a copy of GalleryViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleryViewStateCopyWith<_GalleryViewState> get copyWith => __$GalleryViewStateCopyWithImpl<_GalleryViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GalleryViewState&&(identical(other.pageStatus, pageStatus) || other.pageStatus == pageStatus)&&(identical(other.appBartTansparent, appBartTansparent) || other.appBartTansparent == appBartTansparent));
}


@override
int get hashCode => Object.hash(runtimeType,pageStatus,appBartTansparent);

@override
String toString() {
  return 'GalleryViewState(pageStatus: $pageStatus, appBartTansparent: $appBartTansparent)';
}


}

/// @nodoc
abstract mixin class _$GalleryViewStateCopyWith<$Res> implements $GalleryViewStateCopyWith<$Res> {
  factory _$GalleryViewStateCopyWith(_GalleryViewState value, $Res Function(_GalleryViewState) _then) = __$GalleryViewStateCopyWithImpl;
@override @useResult
$Res call({
 PageStatus? pageStatus, bool appBartTansparent
});




}
/// @nodoc
class __$GalleryViewStateCopyWithImpl<$Res>
    implements _$GalleryViewStateCopyWith<$Res> {
  __$GalleryViewStateCopyWithImpl(this._self, this._then);

  final _GalleryViewState _self;
  final $Res Function(_GalleryViewState) _then;

/// Create a copy of GalleryViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageStatus = freezed,Object? appBartTansparent = null,}) {
  return _then(_GalleryViewState(
pageStatus: freezed == pageStatus ? _self.pageStatus : pageStatus // ignore: cast_nullable_to_non_nullable
as PageStatus?,appBartTansparent: null == appBartTansparent ? _self.appBartTansparent : appBartTansparent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
