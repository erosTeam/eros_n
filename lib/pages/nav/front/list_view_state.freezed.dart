// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ListViewState {

 LoadStatus get status; int get curPage; int get maxPage; bool get floatingAppBar; String? get errorMessage; bool get appBarSearch;
/// Create a copy of ListViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListViewStateCopyWith<ListViewState> get copyWith => _$ListViewStateCopyWithImpl<ListViewState>(this as ListViewState, _$identity);

  /// Serializes this ListViewState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListViewState&&(identical(other.status, status) || other.status == status)&&(identical(other.curPage, curPage) || other.curPage == curPage)&&(identical(other.maxPage, maxPage) || other.maxPage == maxPage)&&(identical(other.floatingAppBar, floatingAppBar) || other.floatingAppBar == floatingAppBar)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.appBarSearch, appBarSearch) || other.appBarSearch == appBarSearch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,curPage,maxPage,floatingAppBar,errorMessage,appBarSearch);

@override
String toString() {
  return 'ListViewState(status: $status, curPage: $curPage, maxPage: $maxPage, floatingAppBar: $floatingAppBar, errorMessage: $errorMessage, appBarSearch: $appBarSearch)';
}


}

/// @nodoc
abstract mixin class $ListViewStateCopyWith<$Res>  {
  factory $ListViewStateCopyWith(ListViewState value, $Res Function(ListViewState) _then) = _$ListViewStateCopyWithImpl;
@useResult
$Res call({
 LoadStatus status, int curPage, int maxPage, bool floatingAppBar, String? errorMessage, bool appBarSearch
});




}
/// @nodoc
class _$ListViewStateCopyWithImpl<$Res>
    implements $ListViewStateCopyWith<$Res> {
  _$ListViewStateCopyWithImpl(this._self, this._then);

  final ListViewState _self;
  final $Res Function(ListViewState) _then;

/// Create a copy of ListViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? curPage = null,Object? maxPage = null,Object? floatingAppBar = null,Object? errorMessage = freezed,Object? appBarSearch = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadStatus,curPage: null == curPage ? _self.curPage : curPage // ignore: cast_nullable_to_non_nullable
as int,maxPage: null == maxPage ? _self.maxPage : maxPage // ignore: cast_nullable_to_non_nullable
as int,floatingAppBar: null == floatingAppBar ? _self.floatingAppBar : floatingAppBar // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,appBarSearch: null == appBarSearch ? _self.appBarSearch : appBarSearch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ListViewState].
extension ListViewStatePatterns on ListViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListViewState value)  $default,){
final _that = this;
switch (_that) {
case _ListViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListViewState value)?  $default,){
final _that = this;
switch (_that) {
case _ListViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadStatus status,  int curPage,  int maxPage,  bool floatingAppBar,  String? errorMessage,  bool appBarSearch)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListViewState() when $default != null:
return $default(_that.status,_that.curPage,_that.maxPage,_that.floatingAppBar,_that.errorMessage,_that.appBarSearch);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadStatus status,  int curPage,  int maxPage,  bool floatingAppBar,  String? errorMessage,  bool appBarSearch)  $default,) {final _that = this;
switch (_that) {
case _ListViewState():
return $default(_that.status,_that.curPage,_that.maxPage,_that.floatingAppBar,_that.errorMessage,_that.appBarSearch);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadStatus status,  int curPage,  int maxPage,  bool floatingAppBar,  String? errorMessage,  bool appBarSearch)?  $default,) {final _that = this;
switch (_that) {
case _ListViewState() when $default != null:
return $default(_that.status,_that.curPage,_that.maxPage,_that.floatingAppBar,_that.errorMessage,_that.appBarSearch);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _ListViewState extends ListViewState {
  const _ListViewState({this.status = LoadStatus.none, this.curPage = 1, this.maxPage = 1, this.floatingAppBar = true, this.errorMessage, this.appBarSearch = false}): super._();
  factory _ListViewState.fromJson(Map<String, dynamic> json) => _$ListViewStateFromJson(json);

@override@JsonKey() final  LoadStatus status;
@override@JsonKey() final  int curPage;
@override@JsonKey() final  int maxPage;
@override@JsonKey() final  bool floatingAppBar;
@override final  String? errorMessage;
@override@JsonKey() final  bool appBarSearch;

/// Create a copy of ListViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListViewStateCopyWith<_ListViewState> get copyWith => __$ListViewStateCopyWithImpl<_ListViewState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListViewStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListViewState&&(identical(other.status, status) || other.status == status)&&(identical(other.curPage, curPage) || other.curPage == curPage)&&(identical(other.maxPage, maxPage) || other.maxPage == maxPage)&&(identical(other.floatingAppBar, floatingAppBar) || other.floatingAppBar == floatingAppBar)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.appBarSearch, appBarSearch) || other.appBarSearch == appBarSearch));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,curPage,maxPage,floatingAppBar,errorMessage,appBarSearch);

@override
String toString() {
  return 'ListViewState(status: $status, curPage: $curPage, maxPage: $maxPage, floatingAppBar: $floatingAppBar, errorMessage: $errorMessage, appBarSearch: $appBarSearch)';
}


}

/// @nodoc
abstract mixin class _$ListViewStateCopyWith<$Res> implements $ListViewStateCopyWith<$Res> {
  factory _$ListViewStateCopyWith(_ListViewState value, $Res Function(_ListViewState) _then) = __$ListViewStateCopyWithImpl;
@override @useResult
$Res call({
 LoadStatus status, int curPage, int maxPage, bool floatingAppBar, String? errorMessage, bool appBarSearch
});




}
/// @nodoc
class __$ListViewStateCopyWithImpl<$Res>
    implements _$ListViewStateCopyWith<$Res> {
  __$ListViewStateCopyWithImpl(this._self, this._then);

  final _ListViewState _self;
  final $Res Function(_ListViewState) _then;

/// Create a copy of ListViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? curPage = null,Object? maxPage = null,Object? floatingAppBar = null,Object? errorMessage = freezed,Object? appBarSearch = null,}) {
  return _then(_ListViewState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadStatus,curPage: null == curPage ? _self.curPage : curPage // ignore: cast_nullable_to_non_nullable
as int,maxPage: null == maxPage ? _self.maxPage : maxPage // ignore: cast_nullable_to_non_nullable
as int,floatingAppBar: null == floatingAppBar ? _self.floatingAppBar : floatingAppBar // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,appBarSearch: null == appBarSearch ? _self.appBarSearch : appBarSearch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
