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
      tagLayoutOnCard: $enumDecodeNullable(
              _$TagLayoutOnCardEnumMap, json['tagLayoutOnCard']) ??
          TagLayoutOnCard.wrap,
    );

Map<String, dynamic> _$$_SettingsToJson(_$_Settings instance) =>
    <String, dynamic>{
      'isCoverBlur': instance.isCoverBlur,
      'isTagTranslate': instance.isTagTranslate,
      'dynamicColor': instance.dynamicColor,
      'searchSort': _$SearchSortEnumMap[instance.searchSort]!,
      'showTags': instance.showTags,
      'tagLayoutOnCard': _$TagLayoutOnCardEnumMap[instance.tagLayoutOnCard]!,
    };

const _$SearchSortEnumMap = {
  SearchSort.popularWeek: 'popularWeek',
  SearchSort.popularToday: 'popularToday',
  SearchSort.popular: 'popular',
  SearchSort.recent: 'recent',
};

const _$TagLayoutOnCardEnumMap = {
  TagLayoutOnCard.horizontal: 'horizontal',
  TagLayoutOnCard.row: 'row',
  TagLayoutOnCard.wrap: 'wrap',
};
