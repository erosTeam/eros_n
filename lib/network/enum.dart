enum SearchSort {
  date('date'),
  popularWeek('popular-week'),
  popularToday('popular-today'),
  popular('popular');

  const SearchSort(this.value);

  final String value;
}
