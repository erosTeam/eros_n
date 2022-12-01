// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_poster.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentPoster _$CommentPosterFromJson(Map<String, dynamic> json) {
  return _CommentPoster.fromJson(json);
}

/// @nodoc
mixin _$CommentPoster {
  @JsonKey(name: 'id')
  int? get posterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_superuser')
  bool? get isSuperuser => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_staff')
  bool? get isStaff => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentPosterCopyWith<CommentPoster> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentPosterCopyWith<$Res> {
  factory $CommentPosterCopyWith(
          CommentPoster value, $Res Function(CommentPoster) then) =
      _$CommentPosterCopyWithImpl<$Res, CommentPoster>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? posterId,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'is_superuser') bool? isSuperuser,
      @JsonKey(name: 'is_staff') bool? isStaff});
}

/// @nodoc
class _$CommentPosterCopyWithImpl<$Res, $Val extends CommentPoster>
    implements $CommentPosterCopyWith<$Res> {
  _$CommentPosterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterId = freezed,
    Object? username = freezed,
    Object? avatarUrl = freezed,
    Object? isSuperuser = freezed,
    Object? isStaff = freezed,
  }) {
    return _then(_value.copyWith(
      posterId: freezed == posterId
          ? _value.posterId
          : posterId // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuperuser: freezed == isSuperuser
          ? _value.isSuperuser
          : isSuperuser // ignore: cast_nullable_to_non_nullable
              as bool?,
      isStaff: freezed == isStaff
          ? _value.isStaff
          : isStaff // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommentPosterCopyWith<$Res>
    implements $CommentPosterCopyWith<$Res> {
  factory _$$_CommentPosterCopyWith(
          _$_CommentPoster value, $Res Function(_$_CommentPoster) then) =
      __$$_CommentPosterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? posterId,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'avatar_url') String? avatarUrl,
      @JsonKey(name: 'is_superuser') bool? isSuperuser,
      @JsonKey(name: 'is_staff') bool? isStaff});
}

/// @nodoc
class __$$_CommentPosterCopyWithImpl<$Res>
    extends _$CommentPosterCopyWithImpl<$Res, _$_CommentPoster>
    implements _$$_CommentPosterCopyWith<$Res> {
  __$$_CommentPosterCopyWithImpl(
      _$_CommentPoster _value, $Res Function(_$_CommentPoster) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? posterId = freezed,
    Object? username = freezed,
    Object? avatarUrl = freezed,
    Object? isSuperuser = freezed,
    Object? isStaff = freezed,
  }) {
    return _then(_$_CommentPoster(
      posterId: freezed == posterId
          ? _value.posterId
          : posterId // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuperuser: freezed == isSuperuser
          ? _value.isSuperuser
          : isSuperuser // ignore: cast_nullable_to_non_nullable
              as bool?,
      isStaff: freezed == isStaff
          ? _value.isStaff
          : isStaff // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_CommentPoster with DiagnosticableTreeMixin implements _CommentPoster {
  const _$_CommentPoster(
      {@JsonKey(name: 'id') this.posterId,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'avatar_url') this.avatarUrl,
      @JsonKey(name: 'is_superuser') this.isSuperuser,
      @JsonKey(name: 'is_staff') this.isStaff});

  factory _$_CommentPoster.fromJson(Map<String, dynamic> json) =>
      _$$_CommentPosterFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? posterId;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @override
  @JsonKey(name: 'is_superuser')
  final bool? isSuperuser;
  @override
  @JsonKey(name: 'is_staff')
  final bool? isStaff;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommentPoster(posterId: $posterId, username: $username, avatarUrl: $avatarUrl, isSuperuser: $isSuperuser, isStaff: $isStaff)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommentPoster'))
      ..add(DiagnosticsProperty('posterId', posterId))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('avatarUrl', avatarUrl))
      ..add(DiagnosticsProperty('isSuperuser', isSuperuser))
      ..add(DiagnosticsProperty('isStaff', isStaff));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentPoster &&
            (identical(other.posterId, posterId) ||
                other.posterId == posterId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.isSuperuser, isSuperuser) ||
                other.isSuperuser == isSuperuser) &&
            (identical(other.isStaff, isStaff) || other.isStaff == isStaff));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, posterId, username, avatarUrl, isSuperuser, isStaff);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentPosterCopyWith<_$_CommentPoster> get copyWith =>
      __$$_CommentPosterCopyWithImpl<_$_CommentPoster>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentPosterToJson(
      this,
    );
  }
}

abstract class _CommentPoster implements CommentPoster {
  const factory _CommentPoster(
      {@JsonKey(name: 'id') final int? posterId,
      @JsonKey(name: 'username') final String? username,
      @JsonKey(name: 'avatar_url') final String? avatarUrl,
      @JsonKey(name: 'is_superuser') final bool? isSuperuser,
      @JsonKey(name: 'is_staff') final bool? isStaff}) = _$_CommentPoster;

  factory _CommentPoster.fromJson(Map<String, dynamic> json) =
      _$_CommentPoster.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get posterId;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(name: 'is_superuser')
  bool? get isSuperuser;
  @override
  @JsonKey(name: 'is_staff')
  bool? get isStaff;
  @override
  @JsonKey(ignore: true)
  _$$_CommentPosterCopyWith<_$_CommentPoster> get copyWith =>
      throw _privateConstructorUsedError;
}
