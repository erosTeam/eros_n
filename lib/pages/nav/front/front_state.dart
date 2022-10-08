import 'package:eros_n/pages/enum.dart';
import 'package:flutter/material.dart';

@immutable
class FrontState {
  const FrontState({
    this.status = LoadStatus.none,
    this.curPage = 1,
    this.maxPage = 1,
  });

  final LoadStatus status;
  final int curPage;
  final int maxPage;

  FrontState copyWith({
    LoadStatus? status,
    int? curPage,
    int? maxPage,
  }) {
    return FrontState(
      status: status ?? this.status,
      curPage: curPage ?? this.curPage,
      maxPage: maxPage ?? this.maxPage,
    );
  }

  bool get isNone => status == LoadStatus.none;
  bool get isLoadMore => status == LoadStatus.loadingMore;
  bool get isLoading => status == LoadStatus.loading;
  bool get isLoadEmpty => status == LoadStatus.empty;
  bool get isLoadError => status == LoadStatus.error;
  bool get isLoadSuccess => status == LoadStatus.success;
  // bool get isGetToken => status == LoadStatus.getToken;
}
