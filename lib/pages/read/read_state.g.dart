// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReadState _$$_ReadStateFromJson(Map<String, dynamic> json) => _$_ReadState(
      showAppBar: json['show_app_bar'] as bool? ?? false,
      topBarOffset: (json['top_bar_offset'] as num?)?.toDouble() ?? 0.0,
      bottomBarOffset: (json['bottom_bar_offset'] as num?)?.toDouble() ?? 0.0,
      bottomBarHeight: (json['bottom_bar_height'] as num?)?.toDouble() ?? 0.0,
      showThumbList: json['show_thumb_list'] as bool? ?? false,
      paddingTop: (json['padding_top'] as num?)?.toDouble() ?? 0.0,
      paddingBottom: (json['padding_bottom'] as num?)?.toDouble() ?? 0.0,
      autoRead: json['auto_read'] as bool? ?? false,
      loadCompleteIndexSet: (json['load_complete_index_set'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toSet() ??
          const {},
    );

Map<String, dynamic> _$$_ReadStateToJson(_$_ReadState instance) =>
    <String, dynamic>{
      'show_app_bar': instance.showAppBar,
      'top_bar_offset': instance.topBarOffset,
      'bottom_bar_offset': instance.bottomBarOffset,
      'bottom_bar_height': instance.bottomBarHeight,
      'show_thumb_list': instance.showThumbList,
      'padding_top': instance.paddingTop,
      'padding_bottom': instance.paddingBottom,
      'auto_read': instance.autoRead,
      'load_complete_index_set': instance.loadCompleteIndexSet.toList(),
    };
