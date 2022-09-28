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
  String? get gid => throw _privateConstructorUsedError;
  String? get imageKey => throw _privateConstructorUsedError;
  String? get csrfToken => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get secondTitle => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get thumbUrl => throw _privateConstructorUsedError;
  int? get thumbHeight => throw _privateConstructorUsedError;
  int? get thumbWidth => throw _privateConstructorUsedError;
  int? get viewTime => throw _privateConstructorUsedError;
  List<GalleryImage> get images => throw _privateConstructorUsedError;
  int get currentPageIndex => throw _privateConstructorUsedError;
  bool? get isFavorited => throw _privateConstructorUsedError;
  String? get favoritedNum => throw _privateConstructorUsedError;
  String? get torrentUrl => throw _privateConstructorUsedError;
  List<Gallery> get moreLikeGallerys => throw _privateConstructorUsedError;
  List<Comment> get comments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GalleryCopyWith<Gallery> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryCopyWith<$Res> {
  factory $GalleryCopyWith(Gallery value, $Res Function(Gallery) then) =
      _$GalleryCopyWithImpl<$Res>;
  $Res call(
      {String? gid,
      String? imageKey,
      String? csrfToken,
      String? title,
      String? secondTitle,
      String? url,
      String? thumbUrl,
      int? thumbHeight,
      int? thumbWidth,
      int? viewTime,
      List<GalleryImage> images,
      int currentPageIndex,
      bool? isFavorited,
      String? favoritedNum,
      String? torrentUrl,
      List<Gallery> moreLikeGallerys,
      List<Comment> comments});
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
    Object? imageKey = freezed,
    Object? csrfToken = freezed,
    Object? title = freezed,
    Object? secondTitle = freezed,
    Object? url = freezed,
    Object? thumbUrl = freezed,
    Object? thumbHeight = freezed,
    Object? thumbWidth = freezed,
    Object? viewTime = freezed,
    Object? images = freezed,
    Object? currentPageIndex = freezed,
    Object? isFavorited = freezed,
    Object? favoritedNum = freezed,
    Object? torrentUrl = freezed,
    Object? moreLikeGallerys = freezed,
    Object? comments = freezed,
  }) {
    return _then(_value.copyWith(
      gid: gid == freezed
          ? _value.gid
          : gid // ignore: cast_nullable_to_non_nullable
              as String?,
      imageKey: imageKey == freezed
          ? _value.imageKey
          : imageKey // ignore: cast_nullable_to_non_nullable
              as String?,
      csrfToken: csrfToken == freezed
          ? _value.csrfToken
          : csrfToken // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      secondTitle: secondTitle == freezed
          ? _value.secondTitle
          : secondTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbUrl: thumbUrl == freezed
          ? _value.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbHeight: thumbHeight == freezed
          ? _value.thumbHeight
          : thumbHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbWidth: thumbWidth == freezed
          ? _value.thumbWidth
          : thumbWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      viewTime: viewTime == freezed
          ? _value.viewTime
          : viewTime // ignore: cast_nullable_to_non_nullable
              as int?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<GalleryImage>,
      currentPageIndex: currentPageIndex == freezed
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorited: isFavorited == freezed
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool?,
      favoritedNum: favoritedNum == freezed
          ? _value.favoritedNum
          : favoritedNum // ignore: cast_nullable_to_non_nullable
              as String?,
      torrentUrl: torrentUrl == freezed
          ? _value.torrentUrl
          : torrentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      moreLikeGallerys: moreLikeGallerys == freezed
          ? _value.moreLikeGallerys
          : moreLikeGallerys // ignore: cast_nullable_to_non_nullable
              as List<Gallery>,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ));
  }
}

/// @nodoc
abstract class _$$_GalleryCopyWith<$Res> implements $GalleryCopyWith<$Res> {
  factory _$$_GalleryCopyWith(
          _$_Gallery value, $Res Function(_$_Gallery) then) =
      __$$_GalleryCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? gid,
      String? imageKey,
      String? csrfToken,
      String? title,
      String? secondTitle,
      String? url,
      String? thumbUrl,
      int? thumbHeight,
      int? thumbWidth,
      int? viewTime,
      List<GalleryImage> images,
      int currentPageIndex,
      bool? isFavorited,
      String? favoritedNum,
      String? torrentUrl,
      List<Gallery> moreLikeGallerys,
      List<Comment> comments});
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
    Object? imageKey = freezed,
    Object? csrfToken = freezed,
    Object? title = freezed,
    Object? secondTitle = freezed,
    Object? url = freezed,
    Object? thumbUrl = freezed,
    Object? thumbHeight = freezed,
    Object? thumbWidth = freezed,
    Object? viewTime = freezed,
    Object? images = freezed,
    Object? currentPageIndex = freezed,
    Object? isFavorited = freezed,
    Object? favoritedNum = freezed,
    Object? torrentUrl = freezed,
    Object? moreLikeGallerys = freezed,
    Object? comments = freezed,
  }) {
    return _then(_$_Gallery(
      gid: gid == freezed
          ? _value.gid
          : gid // ignore: cast_nullable_to_non_nullable
              as String?,
      imageKey: imageKey == freezed
          ? _value.imageKey
          : imageKey // ignore: cast_nullable_to_non_nullable
              as String?,
      csrfToken: csrfToken == freezed
          ? _value.csrfToken
          : csrfToken // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      secondTitle: secondTitle == freezed
          ? _value.secondTitle
          : secondTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbUrl: thumbUrl == freezed
          ? _value.thumbUrl
          : thumbUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbHeight: thumbHeight == freezed
          ? _value.thumbHeight
          : thumbHeight // ignore: cast_nullable_to_non_nullable
              as int?,
      thumbWidth: thumbWidth == freezed
          ? _value.thumbWidth
          : thumbWidth // ignore: cast_nullable_to_non_nullable
              as int?,
      viewTime: viewTime == freezed
          ? _value.viewTime
          : viewTime // ignore: cast_nullable_to_non_nullable
              as int?,
      images: images == freezed
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<GalleryImage>,
      currentPageIndex: currentPageIndex == freezed
          ? _value.currentPageIndex
          : currentPageIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isFavorited: isFavorited == freezed
          ? _value.isFavorited
          : isFavorited // ignore: cast_nullable_to_non_nullable
              as bool?,
      favoritedNum: favoritedNum == freezed
          ? _value.favoritedNum
          : favoritedNum // ignore: cast_nullable_to_non_nullable
              as String?,
      torrentUrl: torrentUrl == freezed
          ? _value.torrentUrl
          : torrentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      moreLikeGallerys: moreLikeGallerys == freezed
          ? _value._moreLikeGallerys
          : moreLikeGallerys // ignore: cast_nullable_to_non_nullable
              as List<Gallery>,
      comments: comments == freezed
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Gallery extends _Gallery {
  const _$_Gallery(
      {this.gid,
      this.imageKey,
      this.csrfToken,
      this.title,
      this.secondTitle,
      this.url,
      this.thumbUrl,
      this.thumbHeight,
      this.thumbWidth,
      this.viewTime,
      final List<GalleryImage> images = const <GalleryImage>[],
      this.currentPageIndex = 0,
      this.isFavorited,
      this.favoritedNum,
      this.torrentUrl,
      final List<Gallery> moreLikeGallerys = const <Gallery>[],
      final List<Comment> comments = const <Comment>[]})
      : _images = images,
        _moreLikeGallerys = moreLikeGallerys,
        _comments = comments,
        super._();

  factory _$_Gallery.fromJson(Map<String, dynamic> json) =>
      _$$_GalleryFromJson(json);

  @override
  final String? gid;
  @override
  final String? imageKey;
  @override
  final String? csrfToken;
  @override
  final String? title;
  @override
  final String? secondTitle;
  @override
  final String? url;
  @override
  final String? thumbUrl;
  @override
  final int? thumbHeight;
  @override
  final int? thumbWidth;
  @override
  final int? viewTime;
  final List<GalleryImage> _images;
  @override
  @JsonKey()
  List<GalleryImage> get images {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final int currentPageIndex;
  @override
  final bool? isFavorited;
  @override
  final String? favoritedNum;
  @override
  final String? torrentUrl;
  final List<Gallery> _moreLikeGallerys;
  @override
  @JsonKey()
  List<Gallery> get moreLikeGallerys {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moreLikeGallerys);
  }

  final List<Comment> _comments;
  @override
  @JsonKey()
  List<Comment> get comments {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'Gallery(gid: $gid, imageKey: $imageKey, csrfToken: $csrfToken, title: $title, secondTitle: $secondTitle, url: $url, thumbUrl: $thumbUrl, thumbHeight: $thumbHeight, thumbWidth: $thumbWidth, viewTime: $viewTime, images: $images, currentPageIndex: $currentPageIndex, isFavorited: $isFavorited, favoritedNum: $favoritedNum, torrentUrl: $torrentUrl, moreLikeGallerys: $moreLikeGallerys, comments: $comments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Gallery &&
            const DeepCollectionEquality().equals(other.gid, gid) &&
            const DeepCollectionEquality().equals(other.imageKey, imageKey) &&
            const DeepCollectionEquality().equals(other.csrfToken, csrfToken) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.secondTitle, secondTitle) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.thumbUrl, thumbUrl) &&
            const DeepCollectionEquality()
                .equals(other.thumbHeight, thumbHeight) &&
            const DeepCollectionEquality()
                .equals(other.thumbWidth, thumbWidth) &&
            const DeepCollectionEquality().equals(other.viewTime, viewTime) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other.currentPageIndex, currentPageIndex) &&
            const DeepCollectionEquality()
                .equals(other.isFavorited, isFavorited) &&
            const DeepCollectionEquality()
                .equals(other.favoritedNum, favoritedNum) &&
            const DeepCollectionEquality()
                .equals(other.torrentUrl, torrentUrl) &&
            const DeepCollectionEquality()
                .equals(other._moreLikeGallerys, _moreLikeGallerys) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(gid),
      const DeepCollectionEquality().hash(imageKey),
      const DeepCollectionEquality().hash(csrfToken),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(secondTitle),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(thumbUrl),
      const DeepCollectionEquality().hash(thumbHeight),
      const DeepCollectionEquality().hash(thumbWidth),
      const DeepCollectionEquality().hash(viewTime),
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(currentPageIndex),
      const DeepCollectionEquality().hash(isFavorited),
      const DeepCollectionEquality().hash(favoritedNum),
      const DeepCollectionEquality().hash(torrentUrl),
      const DeepCollectionEquality().hash(_moreLikeGallerys),
      const DeepCollectionEquality().hash(_comments));

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
      {final String? gid,
      final String? imageKey,
      final String? csrfToken,
      final String? title,
      final String? secondTitle,
      final String? url,
      final String? thumbUrl,
      final int? thumbHeight,
      final int? thumbWidth,
      final int? viewTime,
      final List<GalleryImage> images,
      final int currentPageIndex,
      final bool? isFavorited,
      final String? favoritedNum,
      final String? torrentUrl,
      final List<Gallery> moreLikeGallerys,
      final List<Comment> comments}) = _$_Gallery;
  const _Gallery._() : super._();

  factory _Gallery.fromJson(Map<String, dynamic> json) = _$_Gallery.fromJson;

  @override
  String? get gid;
  @override
  String? get imageKey;
  @override
  String? get csrfToken;
  @override
  String? get title;
  @override
  String? get secondTitle;
  @override
  String? get url;
  @override
  String? get thumbUrl;
  @override
  int? get thumbHeight;
  @override
  int? get thumbWidth;
  @override
  int? get viewTime;
  @override
  List<GalleryImage> get images;
  @override
  int get currentPageIndex;
  @override
  bool? get isFavorited;
  @override
  String? get favoritedNum;
  @override
  String? get torrentUrl;
  @override
  List<Gallery> get moreLikeGallerys;
  @override
  List<Comment> get comments;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryCopyWith<_$_Gallery> get copyWith =>
      throw _privateConstructorUsedError;
}
