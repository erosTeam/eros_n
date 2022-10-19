enum TagCategory {
  tags('tags'),
  artists('artists'),
  groups('groups'),
  parodies('parodies'),
  characters('characters'),
  languages('languages');

  const TagCategory(this.value);
  final String value;
}

enum TagLayoutOnItem {
  singleLine,

  // row,

  wrap,
}

enum ReadModel {
  leftToRight,
  rightToLeft,
  curlLeftToRight,
  curlRightToLeft,
  vertical,
  curlVertical,
  webtoon,
  defaultModel,
}

enum ListModel {
  list,
  grid,
  waterfall,
  waterfallCompact,
}
