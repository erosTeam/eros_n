// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gallery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Gallery {

@JsonKey(name: 'id') int get gid;@JsonKey(name: 'media_id') String? get mediaId; GalleryTitle get title; GalleryImages get images; String? get scanlator;@JsonKey(name: 'upload_date') int? get uploadDate;@JsonKey(name: 'num_pages') int? get numPages;@JsonKey(name: 'num_favorites') int? get numFavorites; List<Tag> get tags;@JsonKey(includeFromJson: false, includeToJson: false) List<Tag> get simpleTags;@JsonKey(includeFromJson: false, includeToJson: false) String? get languageCode;@JsonKey(includeFromJson: false, includeToJson: false) int? get viewTime;@JsonKey(includeFromJson: false, includeToJson: false) List<Comment> get comments;@JsonKey(includeFromJson: false, includeToJson: false) List<Gallery> get moreLikeGallerys;@JsonKey(includeFromJson: false, includeToJson: false) int get currentPageIndex;@JsonKey(includeFromJson: false, includeToJson: false) bool? get isFavorited;@JsonKey(includeFromJson: false, includeToJson: false) String? get uploadedDateTime;@JsonKey(includeFromJson: false, includeToJson: false) String? get csrfToken;
/// Create a copy of Gallery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryCopyWith<Gallery> get copyWith => _$GalleryCopyWithImpl<Gallery>(this as Gallery, _$identity);

  /// Serializes this Gallery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Gallery&&(identical(other.gid, gid) || other.gid == gid)&&(identical(other.mediaId, mediaId) || other.mediaId == mediaId)&&(identical(other.title, title) || other.title == title)&&(identical(other.images, images) || other.images == images)&&(identical(other.scanlator, scanlator) || other.scanlator == scanlator)&&(identical(other.uploadDate, uploadDate) || other.uploadDate == uploadDate)&&(identical(other.numPages, numPages) || other.numPages == numPages)&&(identical(other.numFavorites, numFavorites) || other.numFavorites == numFavorites)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.simpleTags, simpleTags)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.viewTime, viewTime) || other.viewTime == viewTime)&&const DeepCollectionEquality().equals(other.comments, comments)&&const DeepCollectionEquality().equals(other.moreLikeGallerys, moreLikeGallerys)&&(identical(other.currentPageIndex, currentPageIndex) || other.currentPageIndex == currentPageIndex)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited)&&(identical(other.uploadedDateTime, uploadedDateTime) || other.uploadedDateTime == uploadedDateTime)&&(identical(other.csrfToken, csrfToken) || other.csrfToken == csrfToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gid,mediaId,title,images,scanlator,uploadDate,numPages,numFavorites,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(simpleTags),languageCode,viewTime,const DeepCollectionEquality().hash(comments),const DeepCollectionEquality().hash(moreLikeGallerys),currentPageIndex,isFavorited,uploadedDateTime,csrfToken);

@override
String toString() {
  return 'Gallery(gid: $gid, mediaId: $mediaId, title: $title, images: $images, scanlator: $scanlator, uploadDate: $uploadDate, numPages: $numPages, numFavorites: $numFavorites, tags: $tags, simpleTags: $simpleTags, languageCode: $languageCode, viewTime: $viewTime, comments: $comments, moreLikeGallerys: $moreLikeGallerys, currentPageIndex: $currentPageIndex, isFavorited: $isFavorited, uploadedDateTime: $uploadedDateTime, csrfToken: $csrfToken)';
}


}

/// @nodoc
abstract mixin class $GalleryCopyWith<$Res>  {
  factory $GalleryCopyWith(Gallery value, $Res Function(Gallery) _then) = _$GalleryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int gid,@JsonKey(name: 'media_id') String? mediaId, GalleryTitle title, GalleryImages images, String? scanlator,@JsonKey(name: 'upload_date') int? uploadDate,@JsonKey(name: 'num_pages') int? numPages,@JsonKey(name: 'num_favorites') int? numFavorites, List<Tag> tags,@JsonKey(includeFromJson: false, includeToJson: false) List<Tag> simpleTags,@JsonKey(includeFromJson: false, includeToJson: false) String? languageCode,@JsonKey(includeFromJson: false, includeToJson: false) int? viewTime,@JsonKey(includeFromJson: false, includeToJson: false) List<Comment> comments,@JsonKey(includeFromJson: false, includeToJson: false) List<Gallery> moreLikeGallerys,@JsonKey(includeFromJson: false, includeToJson: false) int currentPageIndex,@JsonKey(includeFromJson: false, includeToJson: false) bool? isFavorited,@JsonKey(includeFromJson: false, includeToJson: false) String? uploadedDateTime,@JsonKey(includeFromJson: false, includeToJson: false) String? csrfToken
});


$GalleryTitleCopyWith<$Res> get title;$GalleryImagesCopyWith<$Res> get images;

}
/// @nodoc
class _$GalleryCopyWithImpl<$Res>
    implements $GalleryCopyWith<$Res> {
  _$GalleryCopyWithImpl(this._self, this._then);

  final Gallery _self;
  final $Res Function(Gallery) _then;

/// Create a copy of Gallery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? gid = null,Object? mediaId = freezed,Object? title = null,Object? images = null,Object? scanlator = freezed,Object? uploadDate = freezed,Object? numPages = freezed,Object? numFavorites = freezed,Object? tags = null,Object? simpleTags = null,Object? languageCode = freezed,Object? viewTime = freezed,Object? comments = null,Object? moreLikeGallerys = null,Object? currentPageIndex = null,Object? isFavorited = freezed,Object? uploadedDateTime = freezed,Object? csrfToken = freezed,}) {
  return _then(_self.copyWith(
gid: null == gid ? _self.gid : gid // ignore: cast_nullable_to_non_nullable
as int,mediaId: freezed == mediaId ? _self.mediaId : mediaId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as GalleryTitle,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as GalleryImages,scanlator: freezed == scanlator ? _self.scanlator : scanlator // ignore: cast_nullable_to_non_nullable
as String?,uploadDate: freezed == uploadDate ? _self.uploadDate : uploadDate // ignore: cast_nullable_to_non_nullable
as int?,numPages: freezed == numPages ? _self.numPages : numPages // ignore: cast_nullable_to_non_nullable
as int?,numFavorites: freezed == numFavorites ? _self.numFavorites : numFavorites // ignore: cast_nullable_to_non_nullable
as int?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,simpleTags: null == simpleTags ? _self.simpleTags : simpleTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,languageCode: freezed == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String?,viewTime: freezed == viewTime ? _self.viewTime : viewTime // ignore: cast_nullable_to_non_nullable
as int?,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comment>,moreLikeGallerys: null == moreLikeGallerys ? _self.moreLikeGallerys : moreLikeGallerys // ignore: cast_nullable_to_non_nullable
as List<Gallery>,currentPageIndex: null == currentPageIndex ? _self.currentPageIndex : currentPageIndex // ignore: cast_nullable_to_non_nullable
as int,isFavorited: freezed == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool?,uploadedDateTime: freezed == uploadedDateTime ? _self.uploadedDateTime : uploadedDateTime // ignore: cast_nullable_to_non_nullable
as String?,csrfToken: freezed == csrfToken ? _self.csrfToken : csrfToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Gallery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GalleryTitleCopyWith<$Res> get title {
  
  return $GalleryTitleCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Gallery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GalleryImagesCopyWith<$Res> get images {
  
  return $GalleryImagesCopyWith<$Res>(_self.images, (value) {
    return _then(_self.copyWith(images: value));
  });
}
}


/// Adds pattern-matching-related methods to [Gallery].
extension GalleryPatterns on Gallery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Gallery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Gallery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Gallery value)  $default,){
final _that = this;
switch (_that) {
case _Gallery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Gallery value)?  $default,){
final _that = this;
switch (_that) {
case _Gallery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int gid, @JsonKey(name: 'media_id')  String? mediaId,  GalleryTitle title,  GalleryImages images,  String? scanlator, @JsonKey(name: 'upload_date')  int? uploadDate, @JsonKey(name: 'num_pages')  int? numPages, @JsonKey(name: 'num_favorites')  int? numFavorites,  List<Tag> tags, @JsonKey(includeFromJson: false, includeToJson: false)  List<Tag> simpleTags, @JsonKey(includeFromJson: false, includeToJson: false)  String? languageCode, @JsonKey(includeFromJson: false, includeToJson: false)  int? viewTime, @JsonKey(includeFromJson: false, includeToJson: false)  List<Comment> comments, @JsonKey(includeFromJson: false, includeToJson: false)  List<Gallery> moreLikeGallerys, @JsonKey(includeFromJson: false, includeToJson: false)  int currentPageIndex, @JsonKey(includeFromJson: false, includeToJson: false)  bool? isFavorited, @JsonKey(includeFromJson: false, includeToJson: false)  String? uploadedDateTime, @JsonKey(includeFromJson: false, includeToJson: false)  String? csrfToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Gallery() when $default != null:
return $default(_that.gid,_that.mediaId,_that.title,_that.images,_that.scanlator,_that.uploadDate,_that.numPages,_that.numFavorites,_that.tags,_that.simpleTags,_that.languageCode,_that.viewTime,_that.comments,_that.moreLikeGallerys,_that.currentPageIndex,_that.isFavorited,_that.uploadedDateTime,_that.csrfToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int gid, @JsonKey(name: 'media_id')  String? mediaId,  GalleryTitle title,  GalleryImages images,  String? scanlator, @JsonKey(name: 'upload_date')  int? uploadDate, @JsonKey(name: 'num_pages')  int? numPages, @JsonKey(name: 'num_favorites')  int? numFavorites,  List<Tag> tags, @JsonKey(includeFromJson: false, includeToJson: false)  List<Tag> simpleTags, @JsonKey(includeFromJson: false, includeToJson: false)  String? languageCode, @JsonKey(includeFromJson: false, includeToJson: false)  int? viewTime, @JsonKey(includeFromJson: false, includeToJson: false)  List<Comment> comments, @JsonKey(includeFromJson: false, includeToJson: false)  List<Gallery> moreLikeGallerys, @JsonKey(includeFromJson: false, includeToJson: false)  int currentPageIndex, @JsonKey(includeFromJson: false, includeToJson: false)  bool? isFavorited, @JsonKey(includeFromJson: false, includeToJson: false)  String? uploadedDateTime, @JsonKey(includeFromJson: false, includeToJson: false)  String? csrfToken)  $default,) {final _that = this;
switch (_that) {
case _Gallery():
return $default(_that.gid,_that.mediaId,_that.title,_that.images,_that.scanlator,_that.uploadDate,_that.numPages,_that.numFavorites,_that.tags,_that.simpleTags,_that.languageCode,_that.viewTime,_that.comments,_that.moreLikeGallerys,_that.currentPageIndex,_that.isFavorited,_that.uploadedDateTime,_that.csrfToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int gid, @JsonKey(name: 'media_id')  String? mediaId,  GalleryTitle title,  GalleryImages images,  String? scanlator, @JsonKey(name: 'upload_date')  int? uploadDate, @JsonKey(name: 'num_pages')  int? numPages, @JsonKey(name: 'num_favorites')  int? numFavorites,  List<Tag> tags, @JsonKey(includeFromJson: false, includeToJson: false)  List<Tag> simpleTags, @JsonKey(includeFromJson: false, includeToJson: false)  String? languageCode, @JsonKey(includeFromJson: false, includeToJson: false)  int? viewTime, @JsonKey(includeFromJson: false, includeToJson: false)  List<Comment> comments, @JsonKey(includeFromJson: false, includeToJson: false)  List<Gallery> moreLikeGallerys, @JsonKey(includeFromJson: false, includeToJson: false)  int currentPageIndex, @JsonKey(includeFromJson: false, includeToJson: false)  bool? isFavorited, @JsonKey(includeFromJson: false, includeToJson: false)  String? uploadedDateTime, @JsonKey(includeFromJson: false, includeToJson: false)  String? csrfToken)?  $default,) {final _that = this;
switch (_that) {
case _Gallery() when $default != null:
return $default(_that.gid,_that.mediaId,_that.title,_that.images,_that.scanlator,_that.uploadDate,_that.numPages,_that.numFavorites,_that.tags,_that.simpleTags,_that.languageCode,_that.viewTime,_that.comments,_that.moreLikeGallerys,_that.currentPageIndex,_that.isFavorited,_that.uploadedDateTime,_that.csrfToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Gallery extends Gallery {
  const _Gallery({@JsonKey(name: 'id') this.gid = 0, @JsonKey(name: 'media_id') this.mediaId, this.title = const GalleryTitle(), this.images = const GalleryImages(), this.scanlator, @JsonKey(name: 'upload_date') this.uploadDate, @JsonKey(name: 'num_pages') this.numPages, @JsonKey(name: 'num_favorites') this.numFavorites, final  List<Tag> tags = const <Tag>[], @JsonKey(includeFromJson: false, includeToJson: false) final  List<Tag> simpleTags = const <Tag>[], @JsonKey(includeFromJson: false, includeToJson: false) this.languageCode, @JsonKey(includeFromJson: false, includeToJson: false) this.viewTime, @JsonKey(includeFromJson: false, includeToJson: false) final  List<Comment> comments = const <Comment>[], @JsonKey(includeFromJson: false, includeToJson: false) final  List<Gallery> moreLikeGallerys = const <Gallery>[], @JsonKey(includeFromJson: false, includeToJson: false) this.currentPageIndex = 0, @JsonKey(includeFromJson: false, includeToJson: false) this.isFavorited, @JsonKey(includeFromJson: false, includeToJson: false) this.uploadedDateTime, @JsonKey(includeFromJson: false, includeToJson: false) this.csrfToken}): _tags = tags,_simpleTags = simpleTags,_comments = comments,_moreLikeGallerys = moreLikeGallerys,super._();
  factory _Gallery.fromJson(Map<String, dynamic> json) => _$GalleryFromJson(json);

@override@JsonKey(name: 'id') final  int gid;
@override@JsonKey(name: 'media_id') final  String? mediaId;
@override@JsonKey() final  GalleryTitle title;
@override@JsonKey() final  GalleryImages images;
@override final  String? scanlator;
@override@JsonKey(name: 'upload_date') final  int? uploadDate;
@override@JsonKey(name: 'num_pages') final  int? numPages;
@override@JsonKey(name: 'num_favorites') final  int? numFavorites;
 final  List<Tag> _tags;
@override@JsonKey() List<Tag> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<Tag> _simpleTags;
@override@JsonKey(includeFromJson: false, includeToJson: false) List<Tag> get simpleTags {
  if (_simpleTags is EqualUnmodifiableListView) return _simpleTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_simpleTags);
}

@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? languageCode;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  int? viewTime;
 final  List<Comment> _comments;
@override@JsonKey(includeFromJson: false, includeToJson: false) List<Comment> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

 final  List<Gallery> _moreLikeGallerys;
@override@JsonKey(includeFromJson: false, includeToJson: false) List<Gallery> get moreLikeGallerys {
  if (_moreLikeGallerys is EqualUnmodifiableListView) return _moreLikeGallerys;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_moreLikeGallerys);
}

@override@JsonKey(includeFromJson: false, includeToJson: false) final  int currentPageIndex;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  bool? isFavorited;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? uploadedDateTime;
@override@JsonKey(includeFromJson: false, includeToJson: false) final  String? csrfToken;

/// Create a copy of Gallery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleryCopyWith<_Gallery> get copyWith => __$GalleryCopyWithImpl<_Gallery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GalleryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Gallery&&(identical(other.gid, gid) || other.gid == gid)&&(identical(other.mediaId, mediaId) || other.mediaId == mediaId)&&(identical(other.title, title) || other.title == title)&&(identical(other.images, images) || other.images == images)&&(identical(other.scanlator, scanlator) || other.scanlator == scanlator)&&(identical(other.uploadDate, uploadDate) || other.uploadDate == uploadDate)&&(identical(other.numPages, numPages) || other.numPages == numPages)&&(identical(other.numFavorites, numFavorites) || other.numFavorites == numFavorites)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._simpleTags, _simpleTags)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&(identical(other.viewTime, viewTime) || other.viewTime == viewTime)&&const DeepCollectionEquality().equals(other._comments, _comments)&&const DeepCollectionEquality().equals(other._moreLikeGallerys, _moreLikeGallerys)&&(identical(other.currentPageIndex, currentPageIndex) || other.currentPageIndex == currentPageIndex)&&(identical(other.isFavorited, isFavorited) || other.isFavorited == isFavorited)&&(identical(other.uploadedDateTime, uploadedDateTime) || other.uploadedDateTime == uploadedDateTime)&&(identical(other.csrfToken, csrfToken) || other.csrfToken == csrfToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,gid,mediaId,title,images,scanlator,uploadDate,numPages,numFavorites,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_simpleTags),languageCode,viewTime,const DeepCollectionEquality().hash(_comments),const DeepCollectionEquality().hash(_moreLikeGallerys),currentPageIndex,isFavorited,uploadedDateTime,csrfToken);

@override
String toString() {
  return 'Gallery(gid: $gid, mediaId: $mediaId, title: $title, images: $images, scanlator: $scanlator, uploadDate: $uploadDate, numPages: $numPages, numFavorites: $numFavorites, tags: $tags, simpleTags: $simpleTags, languageCode: $languageCode, viewTime: $viewTime, comments: $comments, moreLikeGallerys: $moreLikeGallerys, currentPageIndex: $currentPageIndex, isFavorited: $isFavorited, uploadedDateTime: $uploadedDateTime, csrfToken: $csrfToken)';
}


}

/// @nodoc
abstract mixin class _$GalleryCopyWith<$Res> implements $GalleryCopyWith<$Res> {
  factory _$GalleryCopyWith(_Gallery value, $Res Function(_Gallery) _then) = __$GalleryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int gid,@JsonKey(name: 'media_id') String? mediaId, GalleryTitle title, GalleryImages images, String? scanlator,@JsonKey(name: 'upload_date') int? uploadDate,@JsonKey(name: 'num_pages') int? numPages,@JsonKey(name: 'num_favorites') int? numFavorites, List<Tag> tags,@JsonKey(includeFromJson: false, includeToJson: false) List<Tag> simpleTags,@JsonKey(includeFromJson: false, includeToJson: false) String? languageCode,@JsonKey(includeFromJson: false, includeToJson: false) int? viewTime,@JsonKey(includeFromJson: false, includeToJson: false) List<Comment> comments,@JsonKey(includeFromJson: false, includeToJson: false) List<Gallery> moreLikeGallerys,@JsonKey(includeFromJson: false, includeToJson: false) int currentPageIndex,@JsonKey(includeFromJson: false, includeToJson: false) bool? isFavorited,@JsonKey(includeFromJson: false, includeToJson: false) String? uploadedDateTime,@JsonKey(includeFromJson: false, includeToJson: false) String? csrfToken
});


@override $GalleryTitleCopyWith<$Res> get title;@override $GalleryImagesCopyWith<$Res> get images;

}
/// @nodoc
class __$GalleryCopyWithImpl<$Res>
    implements _$GalleryCopyWith<$Res> {
  __$GalleryCopyWithImpl(this._self, this._then);

  final _Gallery _self;
  final $Res Function(_Gallery) _then;

/// Create a copy of Gallery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? gid = null,Object? mediaId = freezed,Object? title = null,Object? images = null,Object? scanlator = freezed,Object? uploadDate = freezed,Object? numPages = freezed,Object? numFavorites = freezed,Object? tags = null,Object? simpleTags = null,Object? languageCode = freezed,Object? viewTime = freezed,Object? comments = null,Object? moreLikeGallerys = null,Object? currentPageIndex = null,Object? isFavorited = freezed,Object? uploadedDateTime = freezed,Object? csrfToken = freezed,}) {
  return _then(_Gallery(
gid: null == gid ? _self.gid : gid // ignore: cast_nullable_to_non_nullable
as int,mediaId: freezed == mediaId ? _self.mediaId : mediaId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as GalleryTitle,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as GalleryImages,scanlator: freezed == scanlator ? _self.scanlator : scanlator // ignore: cast_nullable_to_non_nullable
as String?,uploadDate: freezed == uploadDate ? _self.uploadDate : uploadDate // ignore: cast_nullable_to_non_nullable
as int?,numPages: freezed == numPages ? _self.numPages : numPages // ignore: cast_nullable_to_non_nullable
as int?,numFavorites: freezed == numFavorites ? _self.numFavorites : numFavorites // ignore: cast_nullable_to_non_nullable
as int?,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<Tag>,simpleTags: null == simpleTags ? _self._simpleTags : simpleTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,languageCode: freezed == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as String?,viewTime: freezed == viewTime ? _self.viewTime : viewTime // ignore: cast_nullable_to_non_nullable
as int?,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<Comment>,moreLikeGallerys: null == moreLikeGallerys ? _self._moreLikeGallerys : moreLikeGallerys // ignore: cast_nullable_to_non_nullable
as List<Gallery>,currentPageIndex: null == currentPageIndex ? _self.currentPageIndex : currentPageIndex // ignore: cast_nullable_to_non_nullable
as int,isFavorited: freezed == isFavorited ? _self.isFavorited : isFavorited // ignore: cast_nullable_to_non_nullable
as bool?,uploadedDateTime: freezed == uploadedDateTime ? _self.uploadedDateTime : uploadedDateTime // ignore: cast_nullable_to_non_nullable
as String?,csrfToken: freezed == csrfToken ? _self.csrfToken : csrfToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Gallery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GalleryTitleCopyWith<$Res> get title {
  
  return $GalleryTitleCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Gallery
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GalleryImagesCopyWith<$Res> get images {
  
  return $GalleryImagesCopyWith<$Res>(_self.images, (value) {
    return _then(_self.copyWith(images: value));
  });
}
}

// dart format on
