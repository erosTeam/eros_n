// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_title.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GalleryTitle implements DiagnosticableTreeMixin {

@JsonKey(name: 'english') String? get englishTitle;@JsonKey(name: 'japanese') String? get japaneseTitle;@JsonKey(name: 'pretty') String? get prettyTitle;
/// Create a copy of GalleryTitle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryTitleCopyWith<GalleryTitle> get copyWith => _$GalleryTitleCopyWithImpl<GalleryTitle>(this as GalleryTitle, _$identity);

  /// Serializes this GalleryTitle to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GalleryTitle'))
    ..add(DiagnosticsProperty('englishTitle', englishTitle))..add(DiagnosticsProperty('japaneseTitle', japaneseTitle))..add(DiagnosticsProperty('prettyTitle', prettyTitle));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryTitle&&(identical(other.englishTitle, englishTitle) || other.englishTitle == englishTitle)&&(identical(other.japaneseTitle, japaneseTitle) || other.japaneseTitle == japaneseTitle)&&(identical(other.prettyTitle, prettyTitle) || other.prettyTitle == prettyTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,englishTitle,japaneseTitle,prettyTitle);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GalleryTitle(englishTitle: $englishTitle, japaneseTitle: $japaneseTitle, prettyTitle: $prettyTitle)';
}


}

/// @nodoc
abstract mixin class $GalleryTitleCopyWith<$Res>  {
  factory $GalleryTitleCopyWith(GalleryTitle value, $Res Function(GalleryTitle) _then) = _$GalleryTitleCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'english') String? englishTitle,@JsonKey(name: 'japanese') String? japaneseTitle,@JsonKey(name: 'pretty') String? prettyTitle
});




}
/// @nodoc
class _$GalleryTitleCopyWithImpl<$Res>
    implements $GalleryTitleCopyWith<$Res> {
  _$GalleryTitleCopyWithImpl(this._self, this._then);

  final GalleryTitle _self;
  final $Res Function(GalleryTitle) _then;

/// Create a copy of GalleryTitle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? englishTitle = freezed,Object? japaneseTitle = freezed,Object? prettyTitle = freezed,}) {
  return _then(_self.copyWith(
englishTitle: freezed == englishTitle ? _self.englishTitle : englishTitle // ignore: cast_nullable_to_non_nullable
as String?,japaneseTitle: freezed == japaneseTitle ? _self.japaneseTitle : japaneseTitle // ignore: cast_nullable_to_non_nullable
as String?,prettyTitle: freezed == prettyTitle ? _self.prettyTitle : prettyTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GalleryTitle].
extension GalleryTitlePatterns on GalleryTitle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GalleryTitle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GalleryTitle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GalleryTitle value)  $default,){
final _that = this;
switch (_that) {
case _GalleryTitle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GalleryTitle value)?  $default,){
final _that = this;
switch (_that) {
case _GalleryTitle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'english')  String? englishTitle, @JsonKey(name: 'japanese')  String? japaneseTitle, @JsonKey(name: 'pretty')  String? prettyTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GalleryTitle() when $default != null:
return $default(_that.englishTitle,_that.japaneseTitle,_that.prettyTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'english')  String? englishTitle, @JsonKey(name: 'japanese')  String? japaneseTitle, @JsonKey(name: 'pretty')  String? prettyTitle)  $default,) {final _that = this;
switch (_that) {
case _GalleryTitle():
return $default(_that.englishTitle,_that.japaneseTitle,_that.prettyTitle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'english')  String? englishTitle, @JsonKey(name: 'japanese')  String? japaneseTitle, @JsonKey(name: 'pretty')  String? prettyTitle)?  $default,) {final _that = this;
switch (_that) {
case _GalleryTitle() when $default != null:
return $default(_that.englishTitle,_that.japaneseTitle,_that.prettyTitle);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _GalleryTitle with DiagnosticableTreeMixin implements GalleryTitle {
  const _GalleryTitle({@JsonKey(name: 'english') this.englishTitle, @JsonKey(name: 'japanese') this.japaneseTitle, @JsonKey(name: 'pretty') this.prettyTitle});
  factory _GalleryTitle.fromJson(Map<String, dynamic> json) => _$GalleryTitleFromJson(json);

@override@JsonKey(name: 'english') final  String? englishTitle;
@override@JsonKey(name: 'japanese') final  String? japaneseTitle;
@override@JsonKey(name: 'pretty') final  String? prettyTitle;

/// Create a copy of GalleryTitle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleryTitleCopyWith<_GalleryTitle> get copyWith => __$GalleryTitleCopyWithImpl<_GalleryTitle>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GalleryTitleToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GalleryTitle'))
    ..add(DiagnosticsProperty('englishTitle', englishTitle))..add(DiagnosticsProperty('japaneseTitle', japaneseTitle))..add(DiagnosticsProperty('prettyTitle', prettyTitle));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GalleryTitle&&(identical(other.englishTitle, englishTitle) || other.englishTitle == englishTitle)&&(identical(other.japaneseTitle, japaneseTitle) || other.japaneseTitle == japaneseTitle)&&(identical(other.prettyTitle, prettyTitle) || other.prettyTitle == prettyTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,englishTitle,japaneseTitle,prettyTitle);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GalleryTitle(englishTitle: $englishTitle, japaneseTitle: $japaneseTitle, prettyTitle: $prettyTitle)';
}


}

/// @nodoc
abstract mixin class _$GalleryTitleCopyWith<$Res> implements $GalleryTitleCopyWith<$Res> {
  factory _$GalleryTitleCopyWith(_GalleryTitle value, $Res Function(_GalleryTitle) _then) = __$GalleryTitleCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'english') String? englishTitle,@JsonKey(name: 'japanese') String? japaneseTitle,@JsonKey(name: 'pretty') String? prettyTitle
});




}
/// @nodoc
class __$GalleryTitleCopyWithImpl<$Res>
    implements _$GalleryTitleCopyWith<$Res> {
  __$GalleryTitleCopyWithImpl(this._self, this._then);

  final _GalleryTitle _self;
  final $Res Function(_GalleryTitle) _then;

/// Create a copy of GalleryTitle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? englishTitle = freezed,Object? japaneseTitle = freezed,Object? prettyTitle = freezed,}) {
  return _then(_GalleryTitle(
englishTitle: freezed == englishTitle ? _self.englishTitle : englishTitle // ignore: cast_nullable_to_non_nullable
as String?,japaneseTitle: freezed == japaneseTitle ? _self.japaneseTitle : japaneseTitle // ignore: cast_nullable_to_non_nullable
as String?,prettyTitle: freezed == prettyTitle ? _self.prettyTitle : prettyTitle // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
