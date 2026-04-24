// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GalleryImage implements DiagnosticableTreeMixin {

@JsonKey(name: 't') String get type;@JsonKey(name: 'h') int? get imgHeight;@JsonKey(name: 'w') int? get imgWidth;@JsonKey(includeFromJson: false, includeToJson: false) String? get imageUrl;@JsonKey(includeFromJson: false, includeToJson: false) String? get href;
/// Create a copy of GalleryImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryImageCopyWith<GalleryImage> get copyWith => _$GalleryImageCopyWithImpl<GalleryImage>(this as GalleryImage, _$identity);

  /// Serializes this GalleryImage to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GalleryImage'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('imgHeight', imgHeight))..add(DiagnosticsProperty('imgWidth', imgWidth))..add(DiagnosticsProperty('imageUrl', imageUrl))..add(DiagnosticsProperty('href', href));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryImage&&(identical(other.type, type) || other.type == type)&&(identical(other.imgHeight, imgHeight) || other.imgHeight == imgHeight)&&(identical(other.imgWidth, imgWidth) || other.imgWidth == imgWidth)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.href, href) || other.href == href));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,imgHeight,imgWidth,imageUrl,href);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GalleryImage(type: $type, imgHeight: $imgHeight, imgWidth: $imgWidth, imageUrl: $imageUrl, href: $href)';
}


}

/// @nodoc
abstract mixin class $GalleryImageCopyWith<$Res>  {
  factory $GalleryImageCopyWith(GalleryImage value, $Res Function(GalleryImage) _then) = _$GalleryImageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 't') String type,@JsonKey(name: 'h') int? imgHeight,@JsonKey(name: 'w') int? imgWidth,@JsonKey(includeFromJson: false, includeToJson: false) String? imageUrl,@JsonKey(includeFromJson: false, includeToJson: false) String? href
});




}
/// @nodoc
class _$GalleryImageCopyWithImpl<$Res>
    implements $GalleryImageCopyWith<$Res> {
  _$GalleryImageCopyWithImpl(this._self, this._then);

  final GalleryImage _self;
  final $Res Function(GalleryImage) _then;

/// Create a copy of GalleryImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? imgHeight = freezed,Object? imgWidth = freezed,Object? imageUrl = freezed,Object? href = freezed,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imgHeight: freezed == imgHeight ? _self.imgHeight : imgHeight // ignore: cast_nullable_to_non_nullable
as int?,imgWidth: freezed == imgWidth ? _self.imgWidth : imgWidth // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GalleryImage].
extension GalleryImagePatterns on GalleryImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GalleryImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GalleryImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GalleryImage value)  $default,){
final _that = this;
switch (_that) {
case _GalleryImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GalleryImage value)?  $default,){
final _that = this;
switch (_that) {
case _GalleryImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 't')  String type, @JsonKey(name: 'h')  int? imgHeight, @JsonKey(name: 'w')  int? imgWidth, @JsonKey(includeFromJson: false, includeToJson: false)  String? imageUrl, @JsonKey(includeFromJson: false, includeToJson: false)  String? href)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GalleryImage() when $default != null:
return $default(_that.type,_that.imgHeight,_that.imgWidth,_that.imageUrl,_that.href);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 't')  String type, @JsonKey(name: 'h')  int? imgHeight, @JsonKey(name: 'w')  int? imgWidth, @JsonKey(includeFromJson: false, includeToJson: false)  String? imageUrl, @JsonKey(includeFromJson: false, includeToJson: false)  String? href)  $default,) {final _that = this;
switch (_that) {
case _GalleryImage():
return $default(_that.type,_that.imgHeight,_that.imgWidth,_that.imageUrl,_that.href);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 't')  String type, @JsonKey(name: 'h')  int? imgHeight, @JsonKey(name: 'w')  int? imgWidth, @JsonKey(includeFromJson: false, includeToJson: false)  String? imageUrl, @JsonKey(includeFromJson: false, includeToJson: false)  String? href)?  $default,) {final _that = this;
switch (_that) {
case _GalleryImage() when $default != null:
return $default(_that.type,_that.imgHeight,_that.imgWidth,_that.imageUrl,_that.href);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _GalleryImage with DiagnosticableTreeMixin implements GalleryImage {
  const _GalleryImage({@JsonKey(name: 't') this.type = 'j', @JsonKey(name: 'h') this.imgHeight, @JsonKey(name: 'w') this.imgWidth, @JsonKey(includeFromJson: false, includeToJson: false) this.imageUrl, @JsonKey(includeFromJson: false, includeToJson: false) this.href});
  factory _GalleryImage.fromJson(Map<String, dynamic> json) => _$GalleryImageFromJson(json);

@override@JsonKey(name: 't') final  String type;
@override@JsonKey(name: 'h') final  int? imgHeight;
@override@JsonKey(name: 'w') final  int? imgWidth;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? imageUrl;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? href;

/// Create a copy of GalleryImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleryImageCopyWith<_GalleryImage> get copyWith => __$GalleryImageCopyWithImpl<_GalleryImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GalleryImageToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GalleryImage'))
    ..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('imgHeight', imgHeight))..add(DiagnosticsProperty('imgWidth', imgWidth))..add(DiagnosticsProperty('imageUrl', imageUrl))..add(DiagnosticsProperty('href', href));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GalleryImage&&(identical(other.type, type) || other.type == type)&&(identical(other.imgHeight, imgHeight) || other.imgHeight == imgHeight)&&(identical(other.imgWidth, imgWidth) || other.imgWidth == imgWidth)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.href, href) || other.href == href));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,imgHeight,imgWidth,imageUrl,href);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GalleryImage(type: $type, imgHeight: $imgHeight, imgWidth: $imgWidth, imageUrl: $imageUrl, href: $href)';
}


}

/// @nodoc
abstract mixin class _$GalleryImageCopyWith<$Res> implements $GalleryImageCopyWith<$Res> {
  factory _$GalleryImageCopyWith(_GalleryImage value, $Res Function(_GalleryImage) _then) = __$GalleryImageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 't') String type,@JsonKey(name: 'h') int? imgHeight,@JsonKey(name: 'w') int? imgWidth,@JsonKey(includeFromJson: false, includeToJson: false) String? imageUrl,@JsonKey(includeFromJson: false, includeToJson: false) String? href
});




}
/// @nodoc
class __$GalleryImageCopyWithImpl<$Res>
    implements _$GalleryImageCopyWith<$Res> {
  __$GalleryImageCopyWithImpl(this._self, this._then);

  final _GalleryImage _self;
  final $Res Function(_GalleryImage) _then;

/// Create a copy of GalleryImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? imgHeight = freezed,Object? imgWidth = freezed,Object? imageUrl = freezed,Object? href = freezed,}) {
  return _then(_GalleryImage(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imgHeight: freezed == imgHeight ? _self.imgHeight : imgHeight // ignore: cast_nullable_to_non_nullable
as int?,imgWidth: freezed == imgWidth ? _self.imgWidth : imgWidth // ignore: cast_nullable_to_non_nullable
as int?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,href: freezed == href ? _self.href : href // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
