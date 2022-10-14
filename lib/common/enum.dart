enum TagCategory {
  tags('tags'),
  artists('artists'),
  groups('groups'),
  parodies('parodies'),
  characters('characters');

  const TagCategory(this.value);
  final String value;
}

enum TagLayoutOnCard {
  horizontal,

  row,

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
