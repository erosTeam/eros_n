// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReadState _$$_ReadStateFromJson(Map<String, dynamic> json) => _$_ReadState(
      showAppBar: json['show_app_bar'] as bool? ?? false,
      topBarOffset: (json['top_bar_offset'] as num?)?.toDouble() ?? 0.0,
      bottomBarOffset: (json['bottom_bar_offset'] as num?)?.toDouble() ?? 0.0,
      bottomBarHeight: (json['bottom_bar_height'] as num?)?.toDouble(),
      showThumbList: json['show_thumb_list'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ReadStateToJson(_$_ReadState instance) =>
    <String, dynamic>{
      'show_app_bar': instance.showAppBar,
      'top_bar_offset': instance.topBarOffset,
      'bottom_bar_offset': instance.bottomBarOffset,
      'bottom_bar_height': instance.bottomBarHeight,
      'show_thumb_list': instance.showThumbList,
    };
