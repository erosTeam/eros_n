// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'read_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReadState {

 bool get showAppBar; double get topBarOffset; double get bottomBarOffset; double get bottomBarHeight; bool get showThumbList; double get paddingTop; double get paddingBottom; bool get autoRead; Set<int> get loadCompleteIndexSet;
/// Create a copy of ReadState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadStateCopyWith<ReadState> get copyWith => _$ReadStateCopyWithImpl<ReadState>(this as ReadState, _$identity);

  /// Serializes this ReadState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadState&&(identical(other.showAppBar, showAppBar) || other.showAppBar == showAppBar)&&(identical(other.topBarOffset, topBarOffset) || other.topBarOffset == topBarOffset)&&(identical(other.bottomBarOffset, bottomBarOffset) || other.bottomBarOffset == bottomBarOffset)&&(identical(other.bottomBarHeight, bottomBarHeight) || other.bottomBarHeight == bottomBarHeight)&&(identical(other.showThumbList, showThumbList) || other.showThumbList == showThumbList)&&(identical(other.paddingTop, paddingTop) || other.paddingTop == paddingTop)&&(identical(other.paddingBottom, paddingBottom) || other.paddingBottom == paddingBottom)&&(identical(other.autoRead, autoRead) || other.autoRead == autoRead)&&const DeepCollectionEquality().equals(other.loadCompleteIndexSet, loadCompleteIndexSet));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showAppBar,topBarOffset,bottomBarOffset,bottomBarHeight,showThumbList,paddingTop,paddingBottom,autoRead,const DeepCollectionEquality().hash(loadCompleteIndexSet));

@override
String toString() {
  return 'ReadState(showAppBar: $showAppBar, topBarOffset: $topBarOffset, bottomBarOffset: $bottomBarOffset, bottomBarHeight: $bottomBarHeight, showThumbList: $showThumbList, paddingTop: $paddingTop, paddingBottom: $paddingBottom, autoRead: $autoRead, loadCompleteIndexSet: $loadCompleteIndexSet)';
}


}

/// @nodoc
abstract mixin class $ReadStateCopyWith<$Res>  {
  factory $ReadStateCopyWith(ReadState value, $Res Function(ReadState) _then) = _$ReadStateCopyWithImpl;
@useResult
$Res call({
 bool showAppBar, double topBarOffset, double bottomBarOffset, double bottomBarHeight, bool showThumbList, double paddingTop, double paddingBottom, bool autoRead, Set<int> loadCompleteIndexSet
});




}
/// @nodoc
class _$ReadStateCopyWithImpl<$Res>
    implements $ReadStateCopyWith<$Res> {
  _$ReadStateCopyWithImpl(this._self, this._then);

  final ReadState _self;
  final $Res Function(ReadState) _then;

/// Create a copy of ReadState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showAppBar = null,Object? topBarOffset = null,Object? bottomBarOffset = null,Object? bottomBarHeight = null,Object? showThumbList = null,Object? paddingTop = null,Object? paddingBottom = null,Object? autoRead = null,Object? loadCompleteIndexSet = null,}) {
  return _then(_self.copyWith(
showAppBar: null == showAppBar ? _self.showAppBar : showAppBar // ignore: cast_nullable_to_non_nullable
as bool,topBarOffset: null == topBarOffset ? _self.topBarOffset : topBarOffset // ignore: cast_nullable_to_non_nullable
as double,bottomBarOffset: null == bottomBarOffset ? _self.bottomBarOffset : bottomBarOffset // ignore: cast_nullable_to_non_nullable
as double,bottomBarHeight: null == bottomBarHeight ? _self.bottomBarHeight : bottomBarHeight // ignore: cast_nullable_to_non_nullable
as double,showThumbList: null == showThumbList ? _self.showThumbList : showThumbList // ignore: cast_nullable_to_non_nullable
as bool,paddingTop: null == paddingTop ? _self.paddingTop : paddingTop // ignore: cast_nullable_to_non_nullable
as double,paddingBottom: null == paddingBottom ? _self.paddingBottom : paddingBottom // ignore: cast_nullable_to_non_nullable
as double,autoRead: null == autoRead ? _self.autoRead : autoRead // ignore: cast_nullable_to_non_nullable
as bool,loadCompleteIndexSet: null == loadCompleteIndexSet ? _self.loadCompleteIndexSet : loadCompleteIndexSet // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadState].
extension ReadStatePatterns on ReadState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadState value)  $default,){
final _that = this;
switch (_that) {
case _ReadState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadState value)?  $default,){
final _that = this;
switch (_that) {
case _ReadState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showAppBar,  double topBarOffset,  double bottomBarOffset,  double bottomBarHeight,  bool showThumbList,  double paddingTop,  double paddingBottom,  bool autoRead,  Set<int> loadCompleteIndexSet)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadState() when $default != null:
return $default(_that.showAppBar,_that.topBarOffset,_that.bottomBarOffset,_that.bottomBarHeight,_that.showThumbList,_that.paddingTop,_that.paddingBottom,_that.autoRead,_that.loadCompleteIndexSet);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showAppBar,  double topBarOffset,  double bottomBarOffset,  double bottomBarHeight,  bool showThumbList,  double paddingTop,  double paddingBottom,  bool autoRead,  Set<int> loadCompleteIndexSet)  $default,) {final _that = this;
switch (_that) {
case _ReadState():
return $default(_that.showAppBar,_that.topBarOffset,_that.bottomBarOffset,_that.bottomBarHeight,_that.showThumbList,_that.paddingTop,_that.paddingBottom,_that.autoRead,_that.loadCompleteIndexSet);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showAppBar,  double topBarOffset,  double bottomBarOffset,  double bottomBarHeight,  bool showThumbList,  double paddingTop,  double paddingBottom,  bool autoRead,  Set<int> loadCompleteIndexSet)?  $default,) {final _that = this;
switch (_that) {
case _ReadState() when $default != null:
return $default(_that.showAppBar,_that.topBarOffset,_that.bottomBarOffset,_that.bottomBarHeight,_that.showThumbList,_that.paddingTop,_that.paddingBottom,_that.autoRead,_that.loadCompleteIndexSet);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _ReadState extends ReadState {
  const _ReadState({this.showAppBar = false, this.topBarOffset = 0.0, this.bottomBarOffset = 0.0, this.bottomBarHeight = 0.0, this.showThumbList = false, this.paddingTop = 0.0, this.paddingBottom = 0.0, this.autoRead = false, final  Set<int> loadCompleteIndexSet = const {}}): _loadCompleteIndexSet = loadCompleteIndexSet,super._();
  factory _ReadState.fromJson(Map<String, dynamic> json) => _$ReadStateFromJson(json);

@override@JsonKey() final  bool showAppBar;
@override@JsonKey() final  double topBarOffset;
@override@JsonKey() final  double bottomBarOffset;
@override@JsonKey() final  double bottomBarHeight;
@override@JsonKey() final  bool showThumbList;
@override@JsonKey() final  double paddingTop;
@override@JsonKey() final  double paddingBottom;
@override@JsonKey() final  bool autoRead;
 final  Set<int> _loadCompleteIndexSet;
@override@JsonKey() Set<int> get loadCompleteIndexSet {
  if (_loadCompleteIndexSet is EqualUnmodifiableSetView) return _loadCompleteIndexSet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_loadCompleteIndexSet);
}


/// Create a copy of ReadState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadStateCopyWith<_ReadState> get copyWith => __$ReadStateCopyWithImpl<_ReadState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadState&&(identical(other.showAppBar, showAppBar) || other.showAppBar == showAppBar)&&(identical(other.topBarOffset, topBarOffset) || other.topBarOffset == topBarOffset)&&(identical(other.bottomBarOffset, bottomBarOffset) || other.bottomBarOffset == bottomBarOffset)&&(identical(other.bottomBarHeight, bottomBarHeight) || other.bottomBarHeight == bottomBarHeight)&&(identical(other.showThumbList, showThumbList) || other.showThumbList == showThumbList)&&(identical(other.paddingTop, paddingTop) || other.paddingTop == paddingTop)&&(identical(other.paddingBottom, paddingBottom) || other.paddingBottom == paddingBottom)&&(identical(other.autoRead, autoRead) || other.autoRead == autoRead)&&const DeepCollectionEquality().equals(other._loadCompleteIndexSet, _loadCompleteIndexSet));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showAppBar,topBarOffset,bottomBarOffset,bottomBarHeight,showThumbList,paddingTop,paddingBottom,autoRead,const DeepCollectionEquality().hash(_loadCompleteIndexSet));

@override
String toString() {
  return 'ReadState(showAppBar: $showAppBar, topBarOffset: $topBarOffset, bottomBarOffset: $bottomBarOffset, bottomBarHeight: $bottomBarHeight, showThumbList: $showThumbList, paddingTop: $paddingTop, paddingBottom: $paddingBottom, autoRead: $autoRead, loadCompleteIndexSet: $loadCompleteIndexSet)';
}


}

/// @nodoc
abstract mixin class _$ReadStateCopyWith<$Res> implements $ReadStateCopyWith<$Res> {
  factory _$ReadStateCopyWith(_ReadState value, $Res Function(_ReadState) _then) = __$ReadStateCopyWithImpl;
@override @useResult
$Res call({
 bool showAppBar, double topBarOffset, double bottomBarOffset, double bottomBarHeight, bool showThumbList, double paddingTop, double paddingBottom, bool autoRead, Set<int> loadCompleteIndexSet
});




}
/// @nodoc
class __$ReadStateCopyWithImpl<$Res>
    implements _$ReadStateCopyWith<$Res> {
  __$ReadStateCopyWithImpl(this._self, this._then);

  final _ReadState _self;
  final $Res Function(_ReadState) _then;

/// Create a copy of ReadState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showAppBar = null,Object? topBarOffset = null,Object? bottomBarOffset = null,Object? bottomBarHeight = null,Object? showThumbList = null,Object? paddingTop = null,Object? paddingBottom = null,Object? autoRead = null,Object? loadCompleteIndexSet = null,}) {
  return _then(_ReadState(
showAppBar: null == showAppBar ? _self.showAppBar : showAppBar // ignore: cast_nullable_to_non_nullable
as bool,topBarOffset: null == topBarOffset ? _self.topBarOffset : topBarOffset // ignore: cast_nullable_to_non_nullable
as double,bottomBarOffset: null == bottomBarOffset ? _self.bottomBarOffset : bottomBarOffset // ignore: cast_nullable_to_non_nullable
as double,bottomBarHeight: null == bottomBarHeight ? _self.bottomBarHeight : bottomBarHeight // ignore: cast_nullable_to_non_nullable
as double,showThumbList: null == showThumbList ? _self.showThumbList : showThumbList // ignore: cast_nullable_to_non_nullable
as bool,paddingTop: null == paddingTop ? _self.paddingTop : paddingTop // ignore: cast_nullable_to_non_nullable
as double,paddingBottom: null == paddingBottom ? _self.paddingBottom : paddingBottom // ignore: cast_nullable_to_non_nullable
as double,autoRead: null == autoRead ? _self.autoRead : autoRead // ignore: cast_nullable_to_non_nullable
as bool,loadCompleteIndexSet: null == loadCompleteIndexSet ? _self._loadCompleteIndexSet : loadCompleteIndexSet // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}


}

// dart format on
