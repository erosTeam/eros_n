// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'gallery_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GalleryViewState {
  PageStatus? get pageStatus => throw _privateConstructorUsedError;
  bool get appBartTansparent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GalleryViewStateCopyWith<GalleryViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GalleryViewStateCopyWith<$Res> {
  factory $GalleryViewStateCopyWith(
          GalleryViewState value, $Res Function(GalleryViewState) then) =
      _$GalleryViewStateCopyWithImpl<$Res, GalleryViewState>;
  @useResult
  $Res call({PageStatus? pageStatus, bool appBartTansparent});
}

/// @nodoc
class _$GalleryViewStateCopyWithImpl<$Res, $Val extends GalleryViewState>
    implements $GalleryViewStateCopyWith<$Res> {
  _$GalleryViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageStatus = freezed,
    Object? appBartTansparent = null,
  }) {
    return _then(_value.copyWith(
      pageStatus: freezed == pageStatus
          ? _value.pageStatus
          : pageStatus // ignore: cast_nullable_to_non_nullable
              as PageStatus?,
      appBartTansparent: null == appBartTansparent
          ? _value.appBartTansparent
          : appBartTansparent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GalleryViewStateCopyWith<$Res>
    implements $GalleryViewStateCopyWith<$Res> {
  factory _$$_GalleryViewStateCopyWith(
          _$_GalleryViewState value, $Res Function(_$_GalleryViewState) then) =
      __$$_GalleryViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PageStatus? pageStatus, bool appBartTansparent});
}

/// @nodoc
class __$$_GalleryViewStateCopyWithImpl<$Res>
    extends _$GalleryViewStateCopyWithImpl<$Res, _$_GalleryViewState>
    implements _$$_GalleryViewStateCopyWith<$Res> {
  __$$_GalleryViewStateCopyWithImpl(
      _$_GalleryViewState _value, $Res Function(_$_GalleryViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageStatus = freezed,
    Object? appBartTansparent = null,
  }) {
    return _then(_$_GalleryViewState(
      pageStatus: freezed == pageStatus
          ? _value.pageStatus
          : pageStatus // ignore: cast_nullable_to_non_nullable
              as PageStatus?,
      appBartTansparent: null == appBartTansparent
          ? _value.appBartTansparent
          : appBartTansparent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GalleryViewState implements _GalleryViewState {
  const _$_GalleryViewState({this.pageStatus, this.appBartTansparent = true});

  @override
  final PageStatus? pageStatus;
  @override
  @JsonKey()
  final bool appBartTansparent;

  @override
  String toString() {
    return 'GalleryViewState(pageStatus: $pageStatus, appBartTansparent: $appBartTansparent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GalleryViewState &&
            (identical(other.pageStatus, pageStatus) ||
                other.pageStatus == pageStatus) &&
            (identical(other.appBartTansparent, appBartTansparent) ||
                other.appBartTansparent == appBartTansparent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageStatus, appBartTansparent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GalleryViewStateCopyWith<_$_GalleryViewState> get copyWith =>
      __$$_GalleryViewStateCopyWithImpl<_$_GalleryViewState>(this, _$identity);
}

abstract class _GalleryViewState implements GalleryViewState {
  const factory _GalleryViewState(
      {final PageStatus? pageStatus,
      final bool appBartTansparent}) = _$_GalleryViewState;

  @override
  PageStatus? get pageStatus;
  @override
  bool get appBartTansparent;
  @override
  @JsonKey(ignore: true)
  _$$_GalleryViewStateCopyWith<_$_GalleryViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
