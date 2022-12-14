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
    @Default(0.0) double bottomBarHeight,
    @Default(false) bool showThumbList,
    @Default(0.0) double paddingTop,
    @Default(0.0) double paddingBottom,
    @Default(false) bool autoRead,
    @Default({}) Set<int> loadCompleteIndexSet,
  }) = _ReadState;

  const ReadState._();

  factory ReadState.fromJson(Map<String, dynamic> json) =>
      _$ReadStateFromJson(json);
}
