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

enum ListModel { list, grid, waterfall, waterfallCompact }

enum SearchSort {
  popularMonth('popular-month'),
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

enum TranslationProvider {
  openai('OpenAI', 'https://api.openai.com', 'gpt-4o-mini'),
  deepseek('DeepSeek', 'https://api.deepseek.com', 'deepseek-v4-flash'),
  groq('Groq', 'https://api.groq.com', 'llama-3.3-70b-versatile'),
  openrouter('OpenRouter', 'https://openrouter.ai/api', 'openai/gpt-4o-mini'),
  custom('Custom', '', '');

  const TranslationProvider(this.label, this.baseUrl, this.defaultModel);
  final String label;
  final String baseUrl;
  final String defaultModel;
}
