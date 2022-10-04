// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gallery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Gallery _$GalleryFromJson(Map<String, dynamic> json) {
  return _Gallery.fromJson(json);
}

/// @nodoc
mixin _$Gallery {
  @JsonKey(name: 'id')
  int? get gid => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_id')
  String? get mediaId => throw _privateConstructorUsedError;
  GalleryTitle get title => throw _privateConstructorUsedError;
  GalleryImages get images => throw _privateConstructorUsedError;
  String? get scanlator => throw _privateConstructorUsedError;
  @JsonKey(name: 'upload_date')
  int? get uploadDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_pages')
  int? get numPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_favorites')
  int? get numFavorites => throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get languageCode => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int? get viewTime => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<Comment> get comments => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  List<Gallery> get moreLikeGallerys => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  int get currentPageIndex => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  bool? get isFavorited => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get uploadedDateTime => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get csrfToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryCopyWith<Gallery> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryCopyWith<$Res> {
  factory $GalleryCopyWith(Gallery value, $Res Function(Gallery) then) =
      _$GalleryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int? gid,
      @JsonKey(name: 'media_id') String? mediaId,
      GalleryTitle title,
      GalleryImages images,
      String? scanlator,
      @JsonKey(name: 'upload_date') int? uploadDate,
      @JsonKey(name: 'num_pages') int? numPages,
      @JsonKey(name: 'num_favorites') int? numFavorites,
      List<Tag> tags,
      @JsonKey(ignore: true) String? languageCode,
      @JsonKey(ignore: true) int? viewTime,
      @JsonKey(ignore: true) List<Comment> comments,
      @JsonKey(ignore: true) List<Gallery> moreLikeGallerys,
      @JsonKey(ignore: true) int currentPageIndex,
      @JsonKey(ignore: true) bool? isFavorited,
      @JsonKey(ignore: true) String? uploadedDateTime,
      @JsonKey(ignore: true) String? csrfToken});

  $GalleryTitleCopyWith<$Res> get title;
  $GalleryImagesCopyWith<$Res> get images;
}

/// @nodoc
class _$GalleryCopyWithImpl<$Res> implements $GalleryCopyWith<$Res> {
  _$GalleryCopyWithImpl(this._value, this._then);

  final Gallery _value;
  // ignore: unused_field
  final $Res Function(Gallery) _then;

  @override
  $Res call({
    Object? gid = freezed,
    Object? mediaId = freezed,
    Object? title = freezed,
    Object? images = freezed,
    Object? scanlator = freezed,
    Object? uploadDate = freezed,
    Object? numPages = freezed,
    Object? numFavorites = freezed,
    Object? tags = freezed,
    Object? languageCode = freezed,
    Object? viewTime = freezed,
    Object? comments = freezed,
    Object? moreLikeGallerys = freezed,
    Object? currentPageIndex = freezed,
    Object? isFavorited = freezed,
    Object? uploadedDateTime = freezed,
    Object? csrfToken = freezed,
  }) {
    return _then(_value.copyWith(
      gid: gid == freezed
          ? _value.gid
          : gid // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaId: mediaId == freezed
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as GalleryTitle,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as GalleryImages,
      scanlator: scanlator == freezed
          ? _value.scanlator
          : scanlator // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadDate: uploadDate == freezed
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as int?,
      numPages: numPages == freezed
          ? _value.numPages
          : numPages // ignore: cast_nullable_to_non_nullable
              as int?,
      numFavorites: numFavorites == freezed
          ? _value.numFavorites
          : numFavorites // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      languageCode: languageCode == freezed
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      viewTime: viewTime == freezed
          ? _value.viewTime
          : viewTime // ignore: cast_nullable_to_non_nullable
              as int?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      moreLikeGallerys: moreLikeGallerys == freezed
          ? _value.moreLikeGallerys
          : moreLikeGallerys // ignore: cast_nullable_to_non_nullable
              as List<Gallery>,
      currentPageIndex: currentPageIndex == freezed
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorited: isFavorited == freezed
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool?,
      uploadedDateTime: uploadedDateTime == freezed
          ? _value.uploadedDateTime
          : uploadedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      csrfToken: csrfToken == freezed
          ? _value.csrfToken
          : csrfToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $GalleryTitleCopyWith<$Res> get title {
    return $GalleryTitleCopyWith<$Res>(_value.title, (value) {
      return _then(_value.copyWith(title: value));
    });
  }

  @override
  $GalleryImagesCopyWith<$Res> get images {
    return $GalleryImagesCopyWith<$Res>(_value.images, (value) {
      return _then(_value.copyWith(images: value));
    });
  }
}

/// @nodoc
abstract class _$$_GalleryCopyWith<$Res> implements $GalleryCopyWith<$Res> {
  factory _$$_GalleryCopyWith(
          _$_Gallery value, $Res Function(_$_Gallery) then) =
      __$$_GalleryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int? gid,
      @JsonKey(name: 'media_id') String? mediaId,
      GalleryTitle title,
      GalleryImages images,
      String? scanlator,
      @JsonKey(name: 'upload_date') int? uploadDate,
      @JsonKey(name: 'num_pages') int? numPages,
      @JsonKey(name: 'num_favorites') int? numFavorites,
      List<Tag> tags,
      @JsonKey(ignore: true) String? languageCode,
      @JsonKey(ignore: true) int? viewTime,
      @JsonKey(ignore: true) List<Comment> comments,
      @JsonKey(ignore: true) List<Gallery> moreLikeGallerys,
      @JsonKey(ignore: true) int currentPageIndex,
      @JsonKey(ignore: true) bool? isFavorited,
      @JsonKey(ignore: true) String? uploadedDateTime,
      @JsonKey(ignore: true) String? csrfToken});

  @override
  $GalleryTitleCopyWith<$Res> get title;
  @override
  $GalleryImagesCopyWith<$Res> get images;
}

/// @nodoc
class __$$_GalleryCopyWithImpl<$Res> extends _$GalleryCopyWithImpl<$Res>
    implements _$$_GalleryCopyWith<$Res> {
  __$$_GalleryCopyWithImpl(_$_Gallery _value, $Res Function(_$_Gallery) _then)
      : super(_value, (v) => _then(v as _$_Gallery));

  @override
  _$_Gallery get _value => super._value as _$_Gallery;

  @override
  $Res call({
    Object? gid = freezed,
    Object? mediaId = freezed,
    Object? title = freezed,
    Object? images = freezed,
    Object? scanlator = freezed,
    Object? uploadDate = freezed,
    Object? numPages = freezed,
    Object? numFavorites = freezed,
    Object? tags = freezed,
    Object? languageCode = freezed,
    Object? viewTime = freezed,
    Object? comments = freezed,
    Object? moreLikeGallerys = freezed,
    Object? currentPageIndex = freezed,
    Object? isFavorited = freezed,
    Object? uploadedDateTime = freezed,
    Object? csrfToken = freezed,
  }) {
    return _then(_$_Gallery(
      gid: gid == freezed
          ? _value.gid
          : gid // ignore: cast_nullable_to_non_nullable
              as int?,
      mediaId: mediaId == freezed
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as GalleryTitle,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as GalleryImages,
      scanlator: scanlator == freezed
          ? _value.scanlator
          : scanlator // ignore: cast_nullable_to_non_nullable
              as String?,
      uploadDate: uploadDate == freezed
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as int?,
      numPages: numPages == freezed
          ? _value.numPages
          : numPages // ignore: cast_nullable_to_non_nullable
              as int?,
      numFavorites: numFavorites == freezed
          ? _value.numFavorites
          : numFavorites // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: tags == freezed
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      languageCode: languageCode == freezed
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String?,
      viewTime: viewTime == freezed
          ? _value.viewTime
          : viewTime // ignore: cast_nullable_to_non_nullable
              as int?,
      comments: comments == freezed
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
      moreLikeGallerys: moreLikeGallerys == freezed
          ? _value._moreLikeGallerys
          : moreLikeGallerys // ignore: cast_nullable_to_non_nullable
              as List<Gallery>,
      currentPageIndex: currentPageIndex == freezed
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorited: isFavorited == freezed
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool?,
      uploadedDateTime: uploadedDateTime == freezed
          ? _value.uploadedDateTime
          : uploadedDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      csrfToken: csrfToken == freezed
          ? _value.csrfToken
          : csrfToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gallery extends _Gallery {
  const _$_Gallery(
      {@JsonKey(name: 'id')
          this.gid,
      @JsonKey(name: 'media_id')
          this.mediaId,
      this.title = const GalleryTitle(),
      this.images = const GalleryImages(),
      this.scanlator,
      @JsonKey(name: 'upload_date')
          this.uploadDate,
      @JsonKey(name: 'num_pages')
          this.numPages,
      @JsonKey(name: 'num_favorites')
          this.numFavorites,
      final List<Tag> tags = const <Tag>[],
      @JsonKey(ignore: true)
          this.languageCode,
      @JsonKey(ignore: true)
          this.viewTime,
      @JsonKey(ignore: true)
          final List<Comment> comments = const <Comment>[],
      @JsonKey(ignore: true)
          final List<Gallery> moreLikeGallerys = const <Gallery>[],
      @JsonKey(ignore: true)
          this.currentPageIndex = 0,
      @JsonKey(ignore: true)
          this.isFavorited,
      @JsonKey(ignore: true)
          this.uploadedDateTime,
      @JsonKey(ignore: true)
          this.csrfToken})
      : _tags = tags,
        _comments = comments,
        _moreLikeGallerys = moreLikeGallerys,
        super._();

  factory _$_Gallery.fromJson(Map<String, dynamic> json) =>
      _$$_GalleryFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? gid;
  @override
  @JsonKey(name: 'media_id')
  final String? mediaId;
  @override
  @JsonKey()
  final GalleryTitle title;
  @override
  @JsonKey()
  final GalleryImages images;
  @override
  final String? scanlator;
  @override
  @JsonKey(name: 'upload_date')
  final int? uploadDate;
  @override
  @JsonKey(name: 'num_pages')
  final int? numPages;
  @override
  @JsonKey(name: 'num_favorites')
  final int? numFavorites;
  final List<Tag> _tags;
  @override
  @JsonKey()
  List<Tag> get tags {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey(ignore: true)
  final String? languageCode;
  @override
  @JsonKey(ignore: true)
  final int? viewTime;
  final List<Comment> _comments;
  @override
  @JsonKey(ignore: true)
  List<Comment> get comments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  final List<Gallery> _moreLikeGallerys;
  @override
  @JsonKey(ignore: true)
  List<Gallery> get moreLikeGallerys {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moreLikeGallerys);
  }

  @override
  @JsonKey(ignore: true)
  final int currentPageIndex;
  @override
  @JsonKey(ignore: true)
  final bool? isFavorited;
  @override
  @JsonKey(ignore: true)
  final String? uploadedDateTime;
  @override
  @JsonKey(ignore: true)
  final String? csrfToken;

  @override
  String toString() {
    return 'Gallery(gid: $gid, mediaId: $mediaId, title: $title, images: $images, scanlator: $scanlator, uploadDate: $uploadDate, numPages: $numPages, numFavorites: $numFavorites, tags: $tags, languageCode: $languageCode, viewTime: $viewTime, comments: $comments, moreLikeGallerys: $moreLikeGallerys, currentPageIndex: $currentPageIndex, isFavorited: $isFavorited, uploadedDateTime: $uploadedDateTime, csrfToken: $csrfToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gallery &&
            const DeepCollectionEquality().equals(other.gid, gid) &&
            const DeepCollectionEquality().equals(other.mediaId, mediaId) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            const DeepCollectionEquality().equals(other.scanlator, scanlator) &&
            const DeepCollectionEquality()
                .equals(other.uploadDate, uploadDate) &&
            const DeepCollectionEquality().equals(other.numPages, numPages) &&
            const DeepCollectionEquality()
                .equals(other.numFavorites, numFavorites) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other.languageCode, languageCode) &&
            const DeepCollectionEquality().equals(other.viewTime, viewTime) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            const DeepCollectionEquality()
                .equals(other._moreLikeGallerys, _moreLikeGallerys) &&
            const DeepCollectionEquality()
                .equals(other.currentPageIndex, currentPageIndex) &&
            const DeepCollectionEquality()
                .equals(other.isFavorited, isFavorited) &&
            const DeepCollectionEquality()
                .equals(other.uploadedDateTime, uploadedDateTime) &&
            const DeepCollectionEquality().equals(other.csrfToken, csrfToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gid),
      const DeepCollectionEquality().hash(mediaId),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(images),
      const DeepCollectionEquality().hash(scanlator),
      const DeepCollectionEquality().hash(uploadDate),
      const DeepCollectionEquality().hash(numPages),
      const DeepCollectionEquality().hash(numFavorites),
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(languageCode),
      const DeepCollectionEquality().hash(viewTime),
      const DeepCollectionEquality().hash(_comments),
      const DeepCollectionEquality().hash(_moreLikeGallerys),
      const DeepCollectionEquality().hash(currentPageIndex),
      const DeepCollectionEquality().hash(isFavorited),
      const DeepCollectionEquality().hash(uploadedDateTime),
      const DeepCollectionEquality().hash(csrfToken));

  @JsonKey(ignore: true)
  @override
  _$$_GalleryCopyWith<_$_Gallery> get copyWith =>
      __$$_GalleryCopyWithImpl<_$_Gallery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GalleryToJson(
      this,
    );
  }
}

abstract class _Gallery extends Gallery {
  const factory _Gallery(
      {@JsonKey(name: 'id') final int? gid,
      @JsonKey(name: 'media_id') final String? mediaId,
      final GalleryTitle title,
      final GalleryImages images,
      final String? scanlator,
      @JsonKey(name: 'upload_date') final int? uploadDate,
      @JsonKey(name: 'num_pages') final int? numPages,
      @JsonKey(name: 'num_favorites') final int? numFavorites,
      final List<Tag> tags,
      @JsonKey(ignore: true) final String? languageCode,
      @JsonKey(ignore: true) final int? viewTime,
      @JsonKey(ignore: true) final List<Comment> comments,
      @JsonKey(ignore: true) final List<Gallery> moreLikeGallerys,
      @JsonKey(ignore: true) final int currentPageIndex,
      @JsonKey(ignore: true) final bool? isFavorited,
      @JsonKey(ignore: true) final String? uploadedDateTime,
      @JsonKey(ignore: true) final String? csrfToken}) = _$_Gallery;
  const _Gallery._() : super._();

  factory _Gallery.fromJson(Map<String, dynamic> json) = _$_Gallery.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get gid;
  @override
  @JsonKey(name: 'media_id')
  String? get mediaId;
  @override
  GalleryTitle get title;
  @override
  GalleryImages get images;
  @override
  String? get scanlator;
  @override
  @JsonKey(name: 'upload_date')
  int? get uploadDate;
  @override
  @JsonKey(name: 'num_pages')
  int? get numPages;
  @override
  @JsonKey(name: 'num_favorites')
  int? get numFavorites;
  @override
  List<Tag> get tags;
  @override
  @JsonKey(ignore: true)
  String? get languageCode;
  @override
  @JsonKey(ignore: true)
  int? get viewTime;
  @override
  @JsonKey(ignore: true)
  List<Comment> get comments;
  @override
  @JsonKey(ignore: true)
  List<Gallery> get moreLikeGallerys;
  @override
  @JsonKey(ignore: true)
  int get currentPageIndex;
  @override
  @JsonKey(ignore: true)
  bool? get isFavorited;
  @override
  @JsonKey(ignore: true)
  String? get uploadedDateTime;
  @override
  @JsonKey(ignore: true)
  String? get csrfToken;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryCopyWith<_$_Gallery> get copyWith =>
      throw _privateConstructorUsedError;
}
