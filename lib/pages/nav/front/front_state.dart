import 'package:eros_n/pages/enum.dart';
import 'package:flutter/material.dart';

@immutable
class FrontState {
  const FrontState({
    this.status = LoadStatus.none,
    this.curPage = 1,
    this.maxPage = 1,
    this.floatingAppBar = true,
  });

  final LoadStatus status;
  final int curPage;
  final int maxPage;
  final bool floatingAppBar;

  FrontState copyWith({
    LoadStatus? status,
    int? curPage,
    int? maxPage,
    bool? floatingAppBar,
  }) {
    return FrontState(
      status: status ?? this.status,
      curPage: curPage ?? this.curPage,
      maxPage: maxPage ?? this.maxPage,
      floatingAppBar: floatingAppBar ?? this.floatingAppBar,
    );
  }

  @override
  String toString() {
    return 'FrontState{status: $status, curPage: $curPage, maxPage: $maxPage, floatingAppBar: $floatingAppBar}';
  }

  bool get isNone => status == LoadStatus.none;
  bool get isLoadMore => status == LoadStatus.loadingMore;
  bool get isLoading => status == LoadStatus.loading;
  bool get isLoadEmpty => status == LoadStatus.empty;
  bool get isLoadError => status == LoadStatus.error;
  bool get isLoadSuccess => status == LoadStatus.success;
  // bool get isGetToken => status == LoadStatus.getToken;
}
