// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Settings _$SettingsFromJson(Map<String, dynamic> json) => _Settings(
  isCoverBlur: json['isCoverBlur'] as bool? ?? false,
  isTagTranslate: json['isTagTranslate'] as bool? ?? false,
  dynamicColor: json['dynamicColor'] as bool? ?? true,
  searchSort:
      $enumDecodeNullable(_$SearchSortEnumMap, json['searchSort']) ??
      SearchSort.recent,
  showTags: json['showTags'] as bool? ?? false,
  tagLayoutOnItem:
      $enumDecodeNullable(_$TagLayoutOnItemEnumMap, json['tagLayoutOnItem']) ??
      TagLayoutOnItem.wrap,
  themeMode:
      $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
      ThemeMode.system,
  fullScreenReader: json['fullScreenReader'] as bool? ?? false,
  readModel:
      $enumDecodeNullable(_$ReadModelEnumMap, json['readModel']) ??
      ReadModel.leftToRight,
  listModel:
      $enumDecodeNullable(_$ListModelEnumMap, json['listModel']) ??
      ListModel.waterfall,
  localeCode: json['localeCode'] as String? ?? '',
  themeColorLabel:
      json['themeColorLabel'] as String? ?? ThemeConfig.dynamicThemeColorLabel,
  supportDynamicColors: json['supportDynamicColors'] as bool? ?? false,
  hideBottomNavigationOnScroll:
      json['hideBottomNavigationOnScroll'] as bool? ?? true,
  useGalleryTint: json['useGalleryTint'] as bool? ?? true,
  volumeKeyTurnPage: json['volumeKeyTurnPage'] as bool? ?? false,
  autoReadInterval: (json['autoReadInterval'] as num?)?.toDouble() ?? 2.0,
  preloadPagesCount: (json['preloadPagesCount'] as num?)?.toInt() ?? 3,
  searchSortOnFrontPage:
      $enumDecodeNullable(_$SearchSortEnumMap, json['searchSortOnFrontPage']) ??
      SearchSort.recent,
  frontLanguagesFilter:
      $enumDecodeNullable(
        _$LanguagesFilterEnumMap,
        json['frontLanguagesFilter'],
      ) ??
      LanguagesFilter.all,
  searchLanguagesFilter:
      $enumDecodeNullable(
        _$LanguagesFilterEnumMap,
        json['searchLanguagesFilter'],
      ) ??
      LanguagesFilter.all,
  clipboardDetection: json['clipboardDetection'] as bool? ?? false,
  gridMaxCrossAxisExtent:
      (json['gridMaxCrossAxisExtent'] as num?)?.toDouble() ?? 150.0,
  waterfallMaxCrossAxisExtent:
      (json['waterfallMaxCrossAxisExtent'] as num?)?.toDouble() ?? 190.0,
  liquidGlass: json['liquidGlass'] as bool? ?? false,
  maxConcurrentGalleries:
      (json['maxConcurrentGalleries'] as num?)?.toInt() ?? 2,
  maxConcurrentPages: (json['maxConcurrentPages'] as num?)?.toInt() ?? 3,
  customDownloadPath: json['customDownloadPath'] as String? ?? '',
  doubleBackToExit: json['doubleBackToExit'] as bool? ?? true,
  commentTranslation: json['commentTranslation'] as bool? ?? false,
  translationProvider:
      $enumDecodeNullable(
        _$TranslationProviderEnumMap,
        json['translationProvider'],
      ) ??
      TranslationProvider.openai,
  translationApiUrl: json['translationApiUrl'] as String? ?? '',
  translationApiKey: json['translationApiKey'] as String? ?? '',
  translationModel: json['translationModel'] as String? ?? '',
  autoTranslateComments: json['autoTranslateComments'] as bool? ?? false,
  translationDisplayMode:
      $enumDecodeNullable(
        _$TranslationDisplayModeEnumMap,
        json['translationDisplayMode'],
      ) ??
      TranslationDisplayMode.replaceOriginal,
  bilingualStyle:
      $enumDecodeNullable(_$BilingualStyleEnumMap, json['bilingualStyle']) ??
      BilingualStyle.divider,
  useGoogleTranslate: json['useGoogleTranslate'] as bool? ?? false,
);

Map<String, dynamic> _$SettingsToJson(_Settings instance) => <String, dynamic>{
  'isCoverBlur': instance.isCoverBlur,
  'isTagTranslate': instance.isTagTranslate,
  'dynamicColor': instance.dynamicColor,
  'searchSort': _$SearchSortEnumMap[instance.searchSort]!,
  'showTags': instance.showTags,
  'tagLayoutOnItem': _$TagLayoutOnItemEnumMap[instance.tagLayoutOnItem]!,
  'themeMode': _$ThemeModeEnumMap[instance.themeMode]!,
  'fullScreenReader': instance.fullScreenReader,
  'readModel': _$ReadModelEnumMap[instance.readModel]!,
  'listModel': _$ListModelEnumMap[instance.listModel]!,
  'localeCode': instance.localeCode,
  'themeColorLabel': instance.themeColorLabel,
  'supportDynamicColors': instance.supportDynamicColors,
  'hideBottomNavigationOnScroll': instance.hideBottomNavigationOnScroll,
  'useGalleryTint': instance.useGalleryTint,
  'volumeKeyTurnPage': instance.volumeKeyTurnPage,
  'autoReadInterval': instance.autoReadInterval,
  'preloadPagesCount': instance.preloadPagesCount,
  'searchSortOnFrontPage': _$SearchSortEnumMap[instance.searchSortOnFrontPage]!,
  'frontLanguagesFilter':
      _$LanguagesFilterEnumMap[instance.frontLanguagesFilter]!,
  'searchLanguagesFilter':
      _$LanguagesFilterEnumMap[instance.searchLanguagesFilter]!,
  'clipboardDetection': instance.clipboardDetection,
  'gridMaxCrossAxisExtent': instance.gridMaxCrossAxisExtent,
  'waterfallMaxCrossAxisExtent': instance.waterfallMaxCrossAxisExtent,
  'liquidGlass': instance.liquidGlass,
  'maxConcurrentGalleries': instance.maxConcurrentGalleries,
  'maxConcurrentPages': instance.maxConcurrentPages,
  'customDownloadPath': instance.customDownloadPath,
  'doubleBackToExit': instance.doubleBackToExit,
  'commentTranslation': instance.commentTranslation,
  'translationProvider':
      _$TranslationProviderEnumMap[instance.translationProvider]!,
  'translationApiUrl': instance.translationApiUrl,
  'translationApiKey': instance.translationApiKey,
  'translationModel': instance.translationModel,
  'autoTranslateComments': instance.autoTranslateComments,
  'translationDisplayMode':
      _$TranslationDisplayModeEnumMap[instance.translationDisplayMode]!,
  'bilingualStyle': _$BilingualStyleEnumMap[instance.bilingualStyle]!,
  'useGoogleTranslate': instance.useGoogleTranslate,
};

const _$SearchSortEnumMap = {
  SearchSort.popularMonth: 'popularMonth',
  SearchSort.popularWeek: 'popularWeek',
  SearchSort.popularToday: 'popularToday',
  SearchSort.popular: 'popular',
  SearchSort.recent: 'recent',
};

const _$TagLayoutOnItemEnumMap = {
  TagLayoutOnItem.singleLine: 'singleLine',
  TagLayoutOnItem.wrap: 'wrap',
};

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

const _$ReadModelEnumMap = {
  ReadModel.leftToRight: 'leftToRight',
  ReadModel.rightToLeft: 'rightToLeft',
  ReadModel.curlLeftToRight: 'curlLeftToRight',
  ReadModel.curlRightToLeft: 'curlRightToLeft',
  ReadModel.vertical: 'vertical',
  ReadModel.curlVertical: 'curlVertical',
  ReadModel.webtoon: 'webtoon',
  ReadModel.defaultModel: 'defaultModel',
};

const _$ListModelEnumMap = {
  ListModel.list: 'list',
  ListModel.grid: 'grid',
  ListModel.waterfall: 'waterfall',
  ListModel.waterfallCompact: 'waterfallCompact',
};

const _$LanguagesFilterEnumMap = {
  LanguagesFilter.japanese: 'japanese',
  LanguagesFilter.chinese: 'chinese',
  LanguagesFilter.english: 'english',
  LanguagesFilter.translated: 'translated',
  LanguagesFilter.all: 'all',
};

const _$TranslationProviderEnumMap = {
  TranslationProvider.openai: 'openai',
  TranslationProvider.deepseek: 'deepseek',
  TranslationProvider.groq: 'groq',
  TranslationProvider.openrouter: 'openrouter',
  TranslationProvider.custom: 'custom',
};

const _$TranslationDisplayModeEnumMap = {
  TranslationDisplayMode.replaceOriginal: 'replaceOriginal',
  TranslationDisplayMode.bilingual: 'bilingual',
};

const _$BilingualStyleEnumMap = {
  BilingualStyle.divider: 'divider',
  BilingualStyle.subtle: 'subtle',
  BilingualStyle.compact: 'compact',
};
