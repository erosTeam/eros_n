import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'read_state.freezed.dart';
part 'read_state.g.dart';

@freezed
class ReadState with _$ReadState {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ReadState({
    @Default(false) bool showAppBar,
    @Default(0.0) double topBarOffset,
    @Default(0.0) double bottomBarOffset,
    double? bottomBarHeight,
    @Default(false) bool showThumbList,
    @Default(0) int gid,
    @JsonKey(ignore: true) BuildContext? context,
  }) = _ReadState;

  factory ReadState.fromJson(Map<String, dynamic> json) =>
      _$ReadStateFromJson(json);
}
