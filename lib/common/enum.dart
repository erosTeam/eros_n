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
