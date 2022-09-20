import 'package:eros_n/pages/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_page_state.freezed.dart';

@freezed
class GalleryViewState with _$GalleryViewState {
  const factory GalleryViewState({
    PageStatus? pageStatus,
    @Default(true) bool appBartTansparent,
  }) = _GalleryViewState;
}
