import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enum.dart';

part 'list_view_state.freezed.dart';
part 'list_view_state.g.dart';

@freezed
class ListViewState with _$ListViewState {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ListViewState({
    @Default(LoadStatus.none) LoadStatus status,
    @Default(1) int curPage,
    @Default(1) int maxPage,
    @Default(true) bool floatingAppBar,
    String? errorMessage,
  }) = _ListViewState;

  factory ListViewState.fromJson(Map<String, dynamic> json) =>
      _$ListViewStateFromJson(json);

  const ListViewState._();

  bool get isNone => status == LoadStatus.none;
  bool get isLoadMore => status == LoadStatus.loadingMore;
  bool get isLoading => status == LoadStatus.loading;
  bool get isLoadEmpty => status == LoadStatus.empty;
  bool get isLoadError => status == LoadStatus.error;
  bool get isLoadSuccess => status == LoadStatus.success;
}
