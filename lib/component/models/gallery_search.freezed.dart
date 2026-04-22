// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GallerySearch implements DiagnosticableTreeMixin {

@JsonKey(name: 'result') List<Gallery> get result;@JsonKey(name: 'num_pages') int? get numPages;@JsonKey(name: 'per_page') int? get perPage;
/// Create a copy of GallerySearch
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GallerySearchCopyWith<GallerySearch> get copyWith => _$GallerySearchCopyWithImpl<GallerySearch>(this as GallerySearch, _$identity);

  /// Serializes this GallerySearch to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GallerySearch'))
    ..add(DiagnosticsProperty('result', result))..add(DiagnosticsProperty('numPages', numPages))..add(DiagnosticsProperty('perPage', perPage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GallerySearch&&const DeepCollectionEquality().equals(other.result, result)&&(identical(other.numPages, numPages) || other.numPages == numPages)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(result),numPages,perPage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GallerySearch(result: $result, numPages: $numPages, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class $GallerySearchCopyWith<$Res>  {
  factory $GallerySearchCopyWith(GallerySearch value, $Res Function(GallerySearch) _then) = _$GallerySearchCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'result') List<Gallery> result,@JsonKey(name: 'num_pages') int? numPages,@JsonKey(name: 'per_page') int? perPage
});




}
/// @nodoc
class _$GallerySearchCopyWithImpl<$Res>
    implements $GallerySearchCopyWith<$Res> {
  _$GallerySearchCopyWithImpl(this._self, this._then);

  final GallerySearch _self;
  final $Res Function(GallerySearch) _then;

/// Create a copy of GallerySearch
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = null,Object? numPages = freezed,Object? perPage = freezed,}) {
  return _then(_self.copyWith(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as List<Gallery>,numPages: freezed == numPages ? _self.numPages : numPages // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [GallerySearch].
extension GallerySearchPatterns on GallerySearch {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GallerySearch value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GallerySearch() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GallerySearch value)  $default,){
final _that = this;
switch (_that) {
case _GallerySearch():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GallerySearch value)?  $default,){
final _that = this;
switch (_that) {
case _GallerySearch() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'result')  List<Gallery> result, @JsonKey(name: 'num_pages')  int? numPages, @JsonKey(name: 'per_page')  int? perPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GallerySearch() when $default != null:
return $default(_that.result,_that.numPages,_that.perPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'result')  List<Gallery> result, @JsonKey(name: 'num_pages')  int? numPages, @JsonKey(name: 'per_page')  int? perPage)  $default,) {final _that = this;
switch (_that) {
case _GallerySearch():
return $default(_that.result,_that.numPages,_that.perPage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'result')  List<Gallery> result, @JsonKey(name: 'num_pages')  int? numPages, @JsonKey(name: 'per_page')  int? perPage)?  $default,) {final _that = this;
switch (_that) {
case _GallerySearch() when $default != null:
return $default(_that.result,_that.numPages,_that.perPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GallerySearch with DiagnosticableTreeMixin implements GallerySearch {
  const _GallerySearch({@JsonKey(name: 'result') final  List<Gallery> result = const <Gallery>[], @JsonKey(name: 'num_pages') this.numPages, @JsonKey(name: 'per_page') this.perPage}): _result = result;
  factory _GallerySearch.fromJson(Map<String, dynamic> json) => _$GallerySearchFromJson(json);

 final  List<Gallery> _result;
@override@JsonKey(name: 'result') List<Gallery> get result {
  if (_result is EqualUnmodifiableListView) return _result;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_result);
}

@override@JsonKey(name: 'num_pages') final  int? numPages;
@override@JsonKey(name: 'per_page') final  int? perPage;

/// Create a copy of GallerySearch
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GallerySearchCopyWith<_GallerySearch> get copyWith => __$GallerySearchCopyWithImpl<_GallerySearch>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GallerySearchToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GallerySearch'))
    ..add(DiagnosticsProperty('result', result))..add(DiagnosticsProperty('numPages', numPages))..add(DiagnosticsProperty('perPage', perPage));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GallerySearch&&const DeepCollectionEquality().equals(other._result, _result)&&(identical(other.numPages, numPages) || other.numPages == numPages)&&(identical(other.perPage, perPage) || other.perPage == perPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_result),numPages,perPage);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GallerySearch(result: $result, numPages: $numPages, perPage: $perPage)';
}


}

/// @nodoc
abstract mixin class _$GallerySearchCopyWith<$Res> implements $GallerySearchCopyWith<$Res> {
  factory _$GallerySearchCopyWith(_GallerySearch value, $Res Function(_GallerySearch) _then) = __$GallerySearchCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'result') List<Gallery> result,@JsonKey(name: 'num_pages') int? numPages,@JsonKey(name: 'per_page') int? perPage
});




}
/// @nodoc
class __$GallerySearchCopyWithImpl<$Res>
    implements _$GallerySearchCopyWith<$Res> {
  __$GallerySearchCopyWithImpl(this._self, this._then);

  final _GallerySearch _self;
  final $Res Function(_GallerySearch) _then;

/// Create a copy of GallerySearch
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = null,Object? numPages = freezed,Object? perPage = freezed,}) {
  return _then(_GallerySearch(
result: null == result ? _self._result : result // ignore: cast_nullable_to_non_nullable
as List<Gallery>,numPages: freezed == numPages ? _self.numPages : numPages // ignore: cast_nullable_to_non_nullable
as int?,perPage: freezed == perPage ? _self.perPage : perPage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
