// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Settings _$$_SettingsFromJson(Map<String, dynamic> json) => _$_Settings(
      isCoverBlur: json['isCoverBlur'] as bool? ?? false,
      isTagTranslate: json['isTagTranslate'] as bool? ?? false,
      dynamicColor: json['dynamicColor'] as bool? ?? true,
      searchSort:
          $enumDecodeNullable(_$SearchSortEnumMap, json['searchSort']) ??
              SearchSort.recent,
      showTags: json['showTags'] as bool? ?? false,
      tagLayoutOnItem: $enumDecodeNullable(
              _$TagLayoutOnItemEnumMap, json['tagLayoutOnItem']) ??
          TagLayoutOnItem.wrap,
      themeMode: $enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
          ThemeMode.system,
      fullScreenReader: json['fullScreenReader'] as bool? ?? false,
      readModel: $enumDecodeNullable(_$ReadModelEnumMap, json['readModel']) ??
          ReadModel.leftToRight,
      listModel: $enumDecodeNullable(_$ListModelEnumMap, json['listModel']) ??
          ListModel.waterfall,
      localeCode: json['localeCode'] as String? ?? '',
      themeColorLabel: json['themeColorLabel'] as String? ??
          ThemeConfig.dynamicThemeColorLabel,
      supportDynamicColors: json['supportDynamicColors'] as bool? ?? false,
      hideBottomNavigationOnScroll:
          json['hideBottomNavigationOnScroll'] as bool? ?? true,
    );

Map<String, dynamic> _$$_SettingsToJson(_$_Settings instance) =>
    <String, dynamic>{
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
    };

const _$SearchSortEnumMap = {
  SearchSort.popularWeek: 'popularWeek',
  SearchSort.popularToday: 'popularToday',
  SearchSort.popular: 'popular',
  SearchSort.recent: 'recent',
};

const _$TagLayoutOnItemEnumMap = {
  TagLayoutOnItem.singleLine: 'singleLine',
  TagLayoutOnItem.row: 'row',
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
};
