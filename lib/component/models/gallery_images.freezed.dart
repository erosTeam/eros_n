// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery_images.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GalleryImages implements DiagnosticableTreeMixin {

@JsonKey(name: 'pages') List<GalleryImage> get pages;@JsonKey(name: 'cover') GalleryImage get cover;@JsonKey(name: 'thumbnail') GalleryImage get thumbnail;
/// Create a copy of GalleryImages
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryImagesCopyWith<GalleryImages> get copyWith => _$GalleryImagesCopyWithImpl<GalleryImages>(this as GalleryImages, _$identity);

  /// Serializes this GalleryImages to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GalleryImages'))
    ..add(DiagnosticsProperty('pages', pages))..add(DiagnosticsProperty('cover', cover))..add(DiagnosticsProperty('thumbnail', thumbnail));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryImages&&const DeepCollectionEquality().equals(other.pages, pages)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pages),cover,thumbnail);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GalleryImages(pages: $pages, cover: $cover, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class $GalleryImagesCopyWith<$Res>  {
  factory $GalleryImagesCopyWith(GalleryImages value, $Res Function(GalleryImages) _then) = _$GalleryImagesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'pages') List<GalleryImage> pages,@JsonKey(name: 'cover') GalleryImage cover,@JsonKey(name: 'thumbnail') GalleryImage thumbnail
});


$GalleryImageCopyWith<$Res> get cover;$GalleryImageCopyWith<$Res> get thumbnail;

}
/// @nodoc
class _$GalleryImagesCopyWithImpl<$Res>
    implements $GalleryImagesCopyWith<$Res> {
  _$GalleryImagesCopyWithImpl(this._self, this._then);

  final GalleryImages _self;
  final $Res Function(GalleryImages) _then;

/// Create a copy of GalleryImages
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pages = null,Object? cover = null,Object? thumbnail = null,}) {
  return _then(_self.copyWith(
pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as List<GalleryImage>,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as GalleryImage,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as GalleryImage,
  ));
}
/// Create a copy of GalleryImages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GalleryImageCopyWith<$Res> get cover {
  
  return $GalleryImageCopyWith<$Res>(_self.cover, (value) {
    return _then(_self.copyWith(cover: value));
  });
}/// Create a copy of GalleryImages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GalleryImageCopyWith<$Res> get thumbnail {
  
  return $GalleryImageCopyWith<$Res>(_self.thumbnail, (value) {
    return _then(_self.copyWith(thumbnail: value));
  });
}
}


/// Adds pattern-matching-related methods to [GalleryImages].
extension GalleryImagesPatterns on GalleryImages {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GalleryImages value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GalleryImages() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GalleryImages value)  $default,){
final _that = this;
switch (_that) {
case _GalleryImages():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GalleryImages value)?  $default,){
final _that = this;
switch (_that) {
case _GalleryImages() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'pages')  List<GalleryImage> pages, @JsonKey(name: 'cover')  GalleryImage cover, @JsonKey(name: 'thumbnail')  GalleryImage thumbnail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GalleryImages() when $default != null:
return $default(_that.pages,_that.cover,_that.thumbnail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'pages')  List<GalleryImage> pages, @JsonKey(name: 'cover')  GalleryImage cover, @JsonKey(name: 'thumbnail')  GalleryImage thumbnail)  $default,) {final _that = this;
switch (_that) {
case _GalleryImages():
return $default(_that.pages,_that.cover,_that.thumbnail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'pages')  List<GalleryImage> pages, @JsonKey(name: 'cover')  GalleryImage cover, @JsonKey(name: 'thumbnail')  GalleryImage thumbnail)?  $default,) {final _that = this;
switch (_that) {
case _GalleryImages() when $default != null:
return $default(_that.pages,_that.cover,_that.thumbnail);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _GalleryImages with DiagnosticableTreeMixin implements GalleryImages {
  const _GalleryImages({@JsonKey(name: 'pages') final  List<GalleryImage> pages = const <GalleryImage>[], @JsonKey(name: 'cover') this.cover = const GalleryImage(), @JsonKey(name: 'thumbnail') this.thumbnail = const GalleryImage()}): _pages = pages;
  factory _GalleryImages.fromJson(Map<String, dynamic> json) => _$GalleryImagesFromJson(json);

 final  List<GalleryImage> _pages;
@override@JsonKey(name: 'pages') List<GalleryImage> get pages {
  if (_pages is EqualUnmodifiableListView) return _pages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pages);
}

@override@JsonKey(name: 'cover') final  GalleryImage cover;
@override@JsonKey(name: 'thumbnail') final  GalleryImage thumbnail;

/// Create a copy of GalleryImages
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleryImagesCopyWith<_GalleryImages> get copyWith => __$GalleryImagesCopyWithImpl<_GalleryImages>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GalleryImagesToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'GalleryImages'))
    ..add(DiagnosticsProperty('pages', pages))..add(DiagnosticsProperty('cover', cover))..add(DiagnosticsProperty('thumbnail', thumbnail));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GalleryImages&&const DeepCollectionEquality().equals(other._pages, _pages)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pages),cover,thumbnail);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'GalleryImages(pages: $pages, cover: $cover, thumbnail: $thumbnail)';
}


}

/// @nodoc
abstract mixin class _$GalleryImagesCopyWith<$Res> implements $GalleryImagesCopyWith<$Res> {
  factory _$GalleryImagesCopyWith(_GalleryImages value, $Res Function(_GalleryImages) _then) = __$GalleryImagesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'pages') List<GalleryImage> pages,@JsonKey(name: 'cover') GalleryImage cover,@JsonKey(name: 'thumbnail') GalleryImage thumbnail
});


@override $GalleryImageCopyWith<$Res> get cover;@override $GalleryImageCopyWith<$Res> get thumbnail;

}
/// @nodoc
class __$GalleryImagesCopyWithImpl<$Res>
    implements _$GalleryImagesCopyWith<$Res> {
  __$GalleryImagesCopyWithImpl(this._self, this._then);

  final _GalleryImages _self;
  final $Res Function(_GalleryImages) _then;

/// Create a copy of GalleryImages
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pages = null,Object? cover = null,Object? thumbnail = null,}) {
  return _then(_GalleryImages(
pages: null == pages ? _self._pages : pages // ignore: cast_nullable_to_non_nullable
as List<GalleryImage>,cover: null == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as GalleryImage,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as GalleryImage,
  ));
}

/// Create a copy of GalleryImages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GalleryImageCopyWith<$Res> get cover {
  
  return $GalleryImageCopyWith<$Res>(_self.cover, (value) {
    return _then(_self.copyWith(cover: value));
  });
}/// Create a copy of GalleryImages
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GalleryImageCopyWith<$Res> get thumbnail {
  
  return $GalleryImageCopyWith<$Res>(_self.thumbnail, (value) {
    return _then(_self.copyWith(thumbnail: value));
  });
}
}

// dart format on
