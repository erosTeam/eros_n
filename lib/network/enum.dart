enum SearchSort {
  popularWeek('popular-week'),
  popularToday('popular-today'),
  popular('popular'),
  recent('');

  const SearchSort(this.value);

  final String value;
}

enum LanguagesFilter {
  japanese('japanese'),
  chinese('chinese'),
  english('english'),
  translated('translated'),
  all('');

  const LanguagesFilter(this.value);
  final String value;
}
