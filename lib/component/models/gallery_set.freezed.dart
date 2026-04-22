// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GallerySet {

 List<Gallery>? get gallerys; List<Gallery>? get populars; List<Gallery>? get favorites; int? get maxPage; int? get currentPage; bool? get fromCache;
/// Create a copy of GallerySet
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GallerySetCopyWith<GallerySet> get copyWith => _$GallerySetCopyWithImpl<GallerySet>(this as GallerySet, _$identity);

  /// Serializes this GallerySet to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GallerySet&&const DeepCollectionEquality().equals(other.gallerys, gallerys)&&const DeepCollectionEquality().equals(other.populars, populars)&&const DeepCollectionEquality().equals(other.favorites, favorites)&&(identical(other.maxPage, maxPage) || other.maxPage == maxPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(gallerys),const DeepCollectionEquality().hash(populars),const DeepCollectionEquality().hash(favorites),maxPage,currentPage,fromCache);

@override
String toString() {
  return 'GallerySet(gallerys: $gallerys, populars: $populars, favorites: $favorites, maxPage: $maxPage, currentPage: $currentPage, fromCache: $fromCache)';
}


}

/// @nodoc
abstract mixin class $GallerySetCopyWith<$Res>  {
  factory $GallerySetCopyWith(GallerySet value, $Res Function(GallerySet) _then) = _$GallerySetCopyWithImpl;
@useResult
$Res call({
 List<Gallery>? gallerys, List<Gallery>? populars, List<Gallery>? favorites, int? maxPage, int? currentPage, bool? fromCache
});




}
/// @nodoc
class _$GallerySetCopyWithImpl<$Res>
    implements $GallerySetCopyWith<$Res> {
  _$GallerySetCopyWithImpl(this._self, this._then);

  final GallerySet _self;
  final $Res Function(GallerySet) _then;

/// Create a copy of GallerySet
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gallerys = freezed,Object? populars = freezed,Object? favorites = freezed,Object? maxPage = freezed,Object? currentPage = freezed,Object? fromCache = freezed,}) {
  return _then(_self.copyWith(
gallerys: freezed == gallerys ? _self.gallerys : gallerys // ignore: cast_nullable_to_non_nullable
as List<Gallery>?,populars: freezed == populars ? _self.populars : populars // ignore: cast_nullable_to_non_nullable
as List<Gallery>?,favorites: freezed == favorites ? _self.favorites : favorites // ignore: cast_nullable_to_non_nullable
as List<Gallery>?,maxPage: freezed == maxPage ? _self.maxPage : maxPage // ignore: cast_nullable_to_non_nullable
as int?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,fromCache: freezed == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [GallerySet].
extension GallerySetPatterns on GallerySet {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GallerySet value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GallerySet() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GallerySet value)  $default,){
final _that = this;
switch (_that) {
case _GallerySet():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GallerySet value)?  $default,){
final _that = this;
switch (_that) {
case _GallerySet() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Gallery>? gallerys,  List<Gallery>? populars,  List<Gallery>? favorites,  int? maxPage,  int? currentPage,  bool? fromCache)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GallerySet() when $default != null:
return $default(_that.gallerys,_that.populars,_that.favorites,_that.maxPage,_that.currentPage,_that.fromCache);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Gallery>? gallerys,  List<Gallery>? populars,  List<Gallery>? favorites,  int? maxPage,  int? currentPage,  bool? fromCache)  $default,) {final _that = this;
switch (_that) {
case _GallerySet():
return $default(_that.gallerys,_that.populars,_that.favorites,_that.maxPage,_that.currentPage,_that.fromCache);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Gallery>? gallerys,  List<Gallery>? populars,  List<Gallery>? favorites,  int? maxPage,  int? currentPage,  bool? fromCache)?  $default,) {final _that = this;
switch (_that) {
case _GallerySet() when $default != null:
return $default(_that.gallerys,_that.populars,_that.favorites,_that.maxPage,_that.currentPage,_that.fromCache);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GallerySet implements GallerySet {
  const _GallerySet({final  List<Gallery>? gallerys, final  List<Gallery>? populars, final  List<Gallery>? favorites, this.maxPage, this.currentPage, this.fromCache}): _gallerys = gallerys,_populars = populars,_favorites = favorites;
  factory _GallerySet.fromJson(Map<String, dynamic> json) => _$GallerySetFromJson(json);

 final  List<Gallery>? _gallerys;
@override List<Gallery>? get gallerys {
  final value = _gallerys;
  if (value == null) return null;
  if (_gallerys is EqualUnmodifiableListView) return _gallerys;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Gallery>? _populars;
@override List<Gallery>? get populars {
  final value = _populars;
  if (value == null) return null;
  if (_populars is EqualUnmodifiableListView) return _populars;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Gallery>? _favorites;
@override List<Gallery>? get favorites {
  final value = _favorites;
  if (value == null) return null;
  if (_favorites is EqualUnmodifiableListView) return _favorites;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? maxPage;
@override final  int? currentPage;
@override final  bool? fromCache;

/// Create a copy of GallerySet
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GallerySetCopyWith<_GallerySet> get copyWith => __$GallerySetCopyWithImpl<_GallerySet>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GallerySetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GallerySet&&const DeepCollectionEquality().equals(other._gallerys, _gallerys)&&const DeepCollectionEquality().equals(other._populars, _populars)&&const DeepCollectionEquality().equals(other._favorites, _favorites)&&(identical(other.maxPage, maxPage) || other.maxPage == maxPage)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.fromCache, fromCache) || other.fromCache == fromCache));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_gallerys),const DeepCollectionEquality().hash(_populars),const DeepCollectionEquality().hash(_favorites),maxPage,currentPage,fromCache);

@override
String toString() {
  return 'GallerySet(gallerys: $gallerys, populars: $populars, favorites: $favorites, maxPage: $maxPage, currentPage: $currentPage, fromCache: $fromCache)';
}


}

/// @nodoc
abstract mixin class _$GallerySetCopyWith<$Res> implements $GallerySetCopyWith<$Res> {
  factory _$GallerySetCopyWith(_GallerySet value, $Res Function(_GallerySet) _then) = __$GallerySetCopyWithImpl;
@override @useResult
$Res call({
 List<Gallery>? gallerys, List<Gallery>? populars, List<Gallery>? favorites, int? maxPage, int? currentPage, bool? fromCache
});




}
/// @nodoc
class __$GallerySetCopyWithImpl<$Res>
    implements _$GallerySetCopyWith<$Res> {
  __$GallerySetCopyWithImpl(this._self, this._then);

  final _GallerySet _self;
  final $Res Function(_GallerySet) _then;

/// Create a copy of GallerySet
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gallerys = freezed,Object? populars = freezed,Object? favorites = freezed,Object? maxPage = freezed,Object? currentPage = freezed,Object? fromCache = freezed,}) {
  return _then(_GallerySet(
gallerys: freezed == gallerys ? _self._gallerys : gallerys // ignore: cast_nullable_to_non_nullable
as List<Gallery>?,populars: freezed == populars ? _self._populars : populars // ignore: cast_nullable_to_non_nullable
as List<Gallery>?,favorites: freezed == favorites ? _self._favorites : favorites // ignore: cast_nullable_to_non_nullable
as List<Gallery>?,maxPage: freezed == maxPage ? _self.maxPage : maxPage // ignore: cast_nullable_to_non_nullable
as int?,currentPage: freezed == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int?,fromCache: freezed == fromCache ? _self.fromCache : fromCache // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
