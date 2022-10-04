import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'gallery.dart';

part 'gallery_search.freezed.dart';

part 'gallery_search.g.dart';

@freezed
class GallerySearch with _$GallerySearch {
  // @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory GallerySearch({
    @JsonKey(name: 'result') @Default(<Gallery>[]) List<Gallery> result,
    @JsonKey(name: 'num_pages') int? numPages,
    @JsonKey(name: 'per_page') int? perPage,
  }) = _GallerySearch;

  factory GallerySearch.fromJson(Map<String, dynamic> json) =>
      _$GallerySearchFromJson(json);
}
