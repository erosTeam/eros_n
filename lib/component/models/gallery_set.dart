import 'package:eros_n/component/models/gallery.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_set.freezed.dart';
part 'gallery_set.g.dart';

@freezed
abstract class GallerySet with _$GallerySet {
  const factory GallerySet({
    List<Gallery>? gallerys,
    List<Gallery>? populars,
    List<Gallery>? favorites,
    int? maxPage,
    int? currentPage,
    bool? fromCache,
  }) = _GallerySet;

  factory GallerySet.fromJson(Map<String, Object?> json) =>
      _$GallerySetFromJson(json);
}
