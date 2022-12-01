// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  @JsonKey(name: 'id')
  int? get commentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'gallery_id')
  int? get gid => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_date')
  int? get postDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'body')
  String? get commentText => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster')
  CommentPoster? get poster => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? commentId,
      @JsonKey(name: 'gallery_id') int? gid,
      @JsonKey(name: 'post_date') int? postDate,
      @JsonKey(name: 'body') String? commentText,
      @JsonKey(name: 'poster') CommentPoster? poster});

  $CommentPosterCopyWith<$Res>? get poster;
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = freezed,
    Object? gid = freezed,
    Object? postDate = freezed,
    Object? commentText = freezed,
    Object? poster = freezed,
  }) {
    return _then(_value.copyWith(
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int?,
      gid: freezed == gid
          ? _value.gid
          : gid // ignore: cast_nullable_to_non_nullable
              as int?,
      postDate: freezed == postDate
          ? _value.postDate
          : postDate // ignore: cast_nullable_to_non_nullable
              as int?,
      commentText: freezed == commentText
          ? _value.commentText
          : commentText // ignore: cast_nullable_to_non_nullable
              as String?,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as CommentPoster?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommentPosterCopyWith<$Res>? get poster {
    if (_value.poster == null) {
      return null;
    }

    return $CommentPosterCopyWith<$Res>(_value.poster!, (value) {
      return _then(_value.copyWith(poster: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$_CommentCopyWith(
          _$_Comment value, $Res Function(_$_Comment) then) =
      __$$_CommentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? commentId,
      @JsonKey(name: 'gallery_id') int? gid,
      @JsonKey(name: 'post_date') int? postDate,
      @JsonKey(name: 'body') String? commentText,
      @JsonKey(name: 'poster') CommentPoster? poster});

  @override
  $CommentPosterCopyWith<$Res>? get poster;
}

/// @nodoc
class __$$_CommentCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$_Comment>
    implements _$$_CommentCopyWith<$Res> {
  __$$_CommentCopyWithImpl(_$_Comment _value, $Res Function(_$_Comment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = freezed,
    Object? gid = freezed,
    Object? postDate = freezed,
    Object? commentText = freezed,
    Object? poster = freezed,
  }) {
    return _then(_$_Comment(
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int?,
      gid: freezed == gid
          ? _value.gid
          : gid // ignore: cast_nullable_to_non_nullable
              as int?,
      postDate: freezed == postDate
          ? _value.postDate
          : postDate // ignore: cast_nullable_to_non_nullable
              as int?,
      commentText: freezed == commentText
          ? _value.commentText
          : commentText // ignore: cast_nullable_to_non_nullable
              as String?,
      poster: freezed == poster
          ? _value.poster
          : poster // ignore: cast_nullable_to_non_nullable
              as CommentPoster?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_Comment with DiagnosticableTreeMixin implements _Comment {
  const _$_Comment(
      {@JsonKey(name: 'id') this.commentId,
      @JsonKey(name: 'gallery_id') this.gid,
      @JsonKey(name: 'post_date') this.postDate,
      @JsonKey(name: 'body') this.commentText,
      @JsonKey(name: 'poster') this.poster});

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$$_CommentFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? commentId;
  @override
  @JsonKey(name: 'gallery_id')
  final int? gid;
  @override
  @JsonKey(name: 'post_date')
  final int? postDate;
  @override
  @JsonKey(name: 'body')
  final String? commentText;
  @override
  @JsonKey(name: 'poster')
  final CommentPoster? poster;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Comment(commentId: $commentId, gid: $gid, postDate: $postDate, commentText: $commentText, poster: $poster)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Comment'))
      ..add(DiagnosticsProperty('commentId', commentId))
      ..add(DiagnosticsProperty('gid', gid))
      ..add(DiagnosticsProperty('postDate', postDate))
      ..add(DiagnosticsProperty('commentText', commentText))
      ..add(DiagnosticsProperty('poster', poster));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Comment &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.gid, gid) || other.gid == gid) &&
            (identical(other.postDate, postDate) ||
                other.postDate == postDate) &&
            (identical(other.commentText, commentText) ||
                other.commentText == commentText) &&
            (identical(other.poster, poster) || other.poster == poster));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, commentId, gid, postDate, commentText, poster);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      __$$_CommentCopyWithImpl<_$_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentToJson(
      this,
    );
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {@JsonKey(name: 'id') final int? commentId,
      @JsonKey(name: 'gallery_id') final int? gid,
      @JsonKey(name: 'post_date') final int? postDate,
      @JsonKey(name: 'body') final String? commentText,
      @JsonKey(name: 'poster') final CommentPoster? poster}) = _$_Comment;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get commentId;
  @override
  @JsonKey(name: 'gallery_id')
  int? get gid;
  @override
  @JsonKey(name: 'post_date')
  int? get postDate;
  @override
  @JsonKey(name: 'body')
  String? get commentText;
  @override
  @JsonKey(name: 'poster')
  CommentPoster? get poster;
  @override
  @JsonKey(ignore: true)
  _$$_CommentCopyWith<_$_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
