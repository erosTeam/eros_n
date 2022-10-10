// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'read_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReadState _$ReadStateFromJson(Map<String, dynamic> json) {
  return _ReadState.fromJson(json);
}

/// @nodoc
mixin _$ReadState {
  bool get showAppBar => throw _privateConstructorUsedError;
  double get topBarOffset => throw _privateConstructorUsedError;
  double get bottomBarOffset => throw _privateConstructorUsedError;
  double get bottomBarHeight => throw _privateConstructorUsedError;
  bool get showThumbList => throw _privateConstructorUsedError;
  double get paddingTop => throw _privateConstructorUsedError;
  double get paddingBottom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadStateCopyWith<ReadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadStateCopyWith<$Res> {
  factory $ReadStateCopyWith(ReadState value, $Res Function(ReadState) then) =
      _$ReadStateCopyWithImpl<$Res>;
  $Res call(
      {bool showAppBar,
      double topBarOffset,
      double bottomBarOffset,
      double bottomBarHeight,
      bool showThumbList,
      double paddingTop,
      double paddingBottom});
}

/// @nodoc
class _$ReadStateCopyWithImpl<$Res> implements $ReadStateCopyWith<$Res> {
  _$ReadStateCopyWithImpl(this._value, this._then);

  final ReadState _value;
  // ignore: unused_field
  final $Res Function(ReadState) _then;

  @override
  $Res call({
    Object? showAppBar = freezed,
    Object? topBarOffset = freezed,
    Object? bottomBarOffset = freezed,
    Object? bottomBarHeight = freezed,
    Object? showThumbList = freezed,
    Object? paddingTop = freezed,
    Object? paddingBottom = freezed,
  }) {
    return _then(_value.copyWith(
      showAppBar: showAppBar == freezed
          ? _value.showAppBar
          : showAppBar // ignore: cast_nullable_to_non_nullable
              as bool,
      topBarOffset: topBarOffset == freezed
          ? _value.topBarOffset
          : topBarOffset // ignore: cast_nullable_to_non_nullable
              as double,
      bottomBarOffset: bottomBarOffset == freezed
          ? _value.bottomBarOffset
          : bottomBarOffset // ignore: cast_nullable_to_non_nullable
              as double,
      bottomBarHeight: bottomBarHeight == freezed
          ? _value.bottomBarHeight
          : bottomBarHeight // ignore: cast_nullable_to_non_nullable
              as double,
      showThumbList: showThumbList == freezed
          ? _value.showThumbList
          : showThumbList // ignore: cast_nullable_to_non_nullable
              as bool,
      paddingTop: paddingTop == freezed
          ? _value.paddingTop
          : paddingTop // ignore: cast_nullable_to_non_nullable
              as double,
      paddingBottom: paddingBottom == freezed
          ? _value.paddingBottom
          : paddingBottom // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$$_ReadStateCopyWith<$Res> implements $ReadStateCopyWith<$Res> {
  factory _$$_ReadStateCopyWith(
          _$_ReadState value, $Res Function(_$_ReadState) then) =
      __$$_ReadStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool showAppBar,
      double topBarOffset,
      double bottomBarOffset,
      double bottomBarHeight,
      bool showThumbList,
      double paddingTop,
      double paddingBottom});
}

/// @nodoc
class __$$_ReadStateCopyWithImpl<$Res> extends _$ReadStateCopyWithImpl<$Res>
    implements _$$_ReadStateCopyWith<$Res> {
  __$$_ReadStateCopyWithImpl(
      _$_ReadState _value, $Res Function(_$_ReadState) _then)
      : super(_value, (v) => _then(v as _$_ReadState));

  @override
  _$_ReadState get _value => super._value as _$_ReadState;

  @override
  $Res call({
    Object? showAppBar = freezed,
    Object? topBarOffset = freezed,
    Object? bottomBarOffset = freezed,
    Object? bottomBarHeight = freezed,
    Object? showThumbList = freezed,
    Object? paddingTop = freezed,
    Object? paddingBottom = freezed,
  }) {
    return _then(_$_ReadState(
      showAppBar: showAppBar == freezed
          ? _value.showAppBar
          : showAppBar // ignore: cast_nullable_to_non_nullable
              as bool,
      topBarOffset: topBarOffset == freezed
          ? _value.topBarOffset
          : topBarOffset // ignore: cast_nullable_to_non_nullable
              as double,
      bottomBarOffset: bottomBarOffset == freezed
          ? _value.bottomBarOffset
          : bottomBarOffset // ignore: cast_nullable_to_non_nullable
              as double,
      bottomBarHeight: bottomBarHeight == freezed
          ? _value.bottomBarHeight
          : bottomBarHeight // ignore: cast_nullable_to_non_nullable
              as double,
      showThumbList: showThumbList == freezed
          ? _value.showThumbList
          : showThumbList // ignore: cast_nullable_to_non_nullable
              as bool,
      paddingTop: paddingTop == freezed
          ? _value.paddingTop
          : paddingTop // ignore: cast_nullable_to_non_nullable
              as double,
      paddingBottom: paddingBottom == freezed
          ? _value.paddingBottom
          : paddingBottom // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_ReadState implements _ReadState {
  const _$_ReadState(
      {this.showAppBar = false,
      this.topBarOffset = 0.0,
      this.bottomBarOffset = 0.0,
      this.bottomBarHeight = 0.0,
      this.showThumbList = false,
      this.paddingTop = 0.0,
      this.paddingBottom = 0.0});

  factory _$_ReadState.fromJson(Map<String, dynamic> json) =>
      _$$_ReadStateFromJson(json);

  @override
  @JsonKey()
  final bool showAppBar;
  @override
  @JsonKey()
  final double topBarOffset;
  @override
  @JsonKey()
  final double bottomBarOffset;
  @override
  @JsonKey()
  final double bottomBarHeight;
  @override
  @JsonKey()
  final bool showThumbList;
  @override
  @JsonKey()
  final double paddingTop;
  @override
  @JsonKey()
  final double paddingBottom;

  @override
  String toString() {
    return 'ReadState(showAppBar: $showAppBar, topBarOffset: $topBarOffset, bottomBarOffset: $bottomBarOffset, bottomBarHeight: $bottomBarHeight, showThumbList: $showThumbList, paddingTop: $paddingTop, paddingBottom: $paddingBottom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReadState &&
            const DeepCollectionEquality()
                .equals(other.showAppBar, showAppBar) &&
            const DeepCollectionEquality()
                .equals(other.topBarOffset, topBarOffset) &&
            const DeepCollectionEquality()
                .equals(other.bottomBarOffset, bottomBarOffset) &&
            const DeepCollectionEquality()
                .equals(other.bottomBarHeight, bottomBarHeight) &&
            const DeepCollectionEquality()
                .equals(other.showThumbList, showThumbList) &&
            const DeepCollectionEquality()
                .equals(other.paddingTop, paddingTop) &&
            const DeepCollectionEquality()
                .equals(other.paddingBottom, paddingBottom));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showAppBar),
      const DeepCollectionEquality().hash(topBarOffset),
      const DeepCollectionEquality().hash(bottomBarOffset),
      const DeepCollectionEquality().hash(bottomBarHeight),
      const DeepCollectionEquality().hash(showThumbList),
      const DeepCollectionEquality().hash(paddingTop),
      const DeepCollectionEquality().hash(paddingBottom));

  @JsonKey(ignore: true)
  @override
  _$$_ReadStateCopyWith<_$_ReadState> get copyWith =>
      __$$_ReadStateCopyWithImpl<_$_ReadState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReadStateToJson(
      this,
    );
  }
}

abstract class _ReadState implements ReadState {
  const factory _ReadState(
      {final bool showAppBar,
      final double topBarOffset,
      final double bottomBarOffset,
      final double bottomBarHeight,
      final bool showThumbList,
      final double paddingTop,
      final double paddingBottom}) = _$_ReadState;

  factory _ReadState.fromJson(Map<String, dynamic> json) =
      _$_ReadState.fromJson;

  @override
  bool get showAppBar;
  @override
  double get topBarOffset;
  @override
  double get bottomBarOffset;
  @override
  double get bottomBarHeight;
  @override
  bool get showThumbList;
  @override
  double get paddingTop;
  @override
  double get paddingBottom;
  @override
  @JsonKey(ignore: true)
  _$$_ReadStateCopyWith<_$_ReadState> get copyWith =>
      throw _privateConstructorUsedError;
}
