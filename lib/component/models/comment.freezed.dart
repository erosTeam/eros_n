// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Comment implements DiagnosticableTreeMixin {

@JsonKey(name: 'id') int? get commentId;@JsonKey(name: 'gallery_id') int? get gid;@JsonKey(name: 'post_date') int? get postDate;@JsonKey(name: 'body') String? get commentText;@JsonKey(name: 'poster') CommentPoster? get poster;
/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentCopyWith<Comment> get copyWith => _$CommentCopyWithImpl<Comment>(this as Comment, _$identity);

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Comment'))
    ..add(DiagnosticsProperty('commentId', commentId))..add(DiagnosticsProperty('gid', gid))..add(DiagnosticsProperty('postDate', postDate))..add(DiagnosticsProperty('commentText', commentText))..add(DiagnosticsProperty('poster', poster));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Comment&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.gid, gid) || other.gid == gid)&&(identical(other.postDate, postDate) || other.postDate == postDate)&&(identical(other.commentText, commentText) || other.commentText == commentText)&&(identical(other.poster, poster) || other.poster == poster));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,commentId,gid,postDate,commentText,poster);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Comment(commentId: $commentId, gid: $gid, postDate: $postDate, commentText: $commentText, poster: $poster)';
}


}

/// @nodoc
abstract mixin class $CommentCopyWith<$Res>  {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) _then) = _$CommentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? commentId,@JsonKey(name: 'gallery_id') int? gid,@JsonKey(name: 'post_date') int? postDate,@JsonKey(name: 'body') String? commentText,@JsonKey(name: 'poster') CommentPoster? poster
});


$CommentPosterCopyWith<$Res>? get poster;

}
/// @nodoc
class _$CommentCopyWithImpl<$Res>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._self, this._then);

  final Comment _self;
  final $Res Function(Comment) _then;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commentId = freezed,Object? gid = freezed,Object? postDate = freezed,Object? commentText = freezed,Object? poster = freezed,}) {
  return _then(_self.copyWith(
commentId: freezed == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as int?,gid: freezed == gid ? _self.gid : gid // ignore: cast_nullable_to_non_nullable
as int?,postDate: freezed == postDate ? _self.postDate : postDate // ignore: cast_nullable_to_non_nullable
as int?,commentText: freezed == commentText ? _self.commentText : commentText // ignore: cast_nullable_to_non_nullable
as String?,poster: freezed == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as CommentPoster?,
  ));
}
/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentPosterCopyWith<$Res>? get poster {
    if (_self.poster == null) {
    return null;
  }

  return $CommentPosterCopyWith<$Res>(_self.poster!, (value) {
    return _then(_self.copyWith(poster: value));
  });
}
}


/// Adds pattern-matching-related methods to [Comment].
extension CommentPatterns on Comment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Comment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Comment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Comment value)  $default,){
final _that = this;
switch (_that) {
case _Comment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Comment value)?  $default,){
final _that = this;
switch (_that) {
case _Comment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? commentId, @JsonKey(name: 'gallery_id')  int? gid, @JsonKey(name: 'post_date')  int? postDate, @JsonKey(name: 'body')  String? commentText, @JsonKey(name: 'poster')  CommentPoster? poster)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that.commentId,_that.gid,_that.postDate,_that.commentText,_that.poster);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? commentId, @JsonKey(name: 'gallery_id')  int? gid, @JsonKey(name: 'post_date')  int? postDate, @JsonKey(name: 'body')  String? commentText, @JsonKey(name: 'poster')  CommentPoster? poster)  $default,) {final _that = this;
switch (_that) {
case _Comment():
return $default(_that.commentId,_that.gid,_that.postDate,_that.commentText,_that.poster);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? commentId, @JsonKey(name: 'gallery_id')  int? gid, @JsonKey(name: 'post_date')  int? postDate, @JsonKey(name: 'body')  String? commentText, @JsonKey(name: 'poster')  CommentPoster? poster)?  $default,) {final _that = this;
switch (_that) {
case _Comment() when $default != null:
return $default(_that.commentId,_that.gid,_that.postDate,_that.commentText,_that.poster);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _Comment with DiagnosticableTreeMixin implements Comment {
  const _Comment({@JsonKey(name: 'id') this.commentId, @JsonKey(name: 'gallery_id') this.gid, @JsonKey(name: 'post_date') this.postDate, @JsonKey(name: 'body') this.commentText, @JsonKey(name: 'poster') this.poster});
  factory _Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);

@override@JsonKey(name: 'id') final  int? commentId;
@override@JsonKey(name: 'gallery_id') final  int? gid;
@override@JsonKey(name: 'post_date') final  int? postDate;
@override@JsonKey(name: 'body') final  String? commentText;
@override@JsonKey(name: 'poster') final  CommentPoster? poster;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentCopyWith<_Comment> get copyWith => __$CommentCopyWithImpl<_Comment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Comment'))
    ..add(DiagnosticsProperty('commentId', commentId))..add(DiagnosticsProperty('gid', gid))..add(DiagnosticsProperty('postDate', postDate))..add(DiagnosticsProperty('commentText', commentText))..add(DiagnosticsProperty('poster', poster));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Comment&&(identical(other.commentId, commentId) || other.commentId == commentId)&&(identical(other.gid, gid) || other.gid == gid)&&(identical(other.postDate, postDate) || other.postDate == postDate)&&(identical(other.commentText, commentText) || other.commentText == commentText)&&(identical(other.poster, poster) || other.poster == poster));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,commentId,gid,postDate,commentText,poster);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Comment(commentId: $commentId, gid: $gid, postDate: $postDate, commentText: $commentText, poster: $poster)';
}


}

/// @nodoc
abstract mixin class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) _then) = __$CommentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? commentId,@JsonKey(name: 'gallery_id') int? gid,@JsonKey(name: 'post_date') int? postDate,@JsonKey(name: 'body') String? commentText,@JsonKey(name: 'poster') CommentPoster? poster
});


@override $CommentPosterCopyWith<$Res>? get poster;

}
/// @nodoc
class __$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(this._self, this._then);

  final _Comment _self;
  final $Res Function(_Comment) _then;

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commentId = freezed,Object? gid = freezed,Object? postDate = freezed,Object? commentText = freezed,Object? poster = freezed,}) {
  return _then(_Comment(
commentId: freezed == commentId ? _self.commentId : commentId // ignore: cast_nullable_to_non_nullable
as int?,gid: freezed == gid ? _self.gid : gid // ignore: cast_nullable_to_non_nullable
as int?,postDate: freezed == postDate ? _self.postDate : postDate // ignore: cast_nullable_to_non_nullable
as int?,commentText: freezed == commentText ? _self.commentText : commentText // ignore: cast_nullable_to_non_nullable
as String?,poster: freezed == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as CommentPoster?,
  ));
}

/// Create a copy of Comment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentPosterCopyWith<$Res>? get poster {
    if (_self.poster == null) {
    return null;
  }

  return $CommentPosterCopyWith<$Res>(_self.poster!, (value) {
    return _then(_self.copyWith(poster: value));
  });
}
}

// dart format on
