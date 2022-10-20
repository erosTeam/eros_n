// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_view_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListViewState _$$_ListViewStateFromJson(Map<String, dynamic> json) =>
    _$_ListViewState(
      status: $enumDecodeNullable(_$LoadStatusEnumMap, json['status']) ??
          LoadStatus.none,
      curPage: json['cur_page'] as int? ?? 1,
      maxPage: json['max_page'] as int? ?? 1,
      floatingAppBar: json['floating_app_bar'] as bool? ?? true,
      errorMessage: json['error_message'] as String?,
      appBarSearch: json['app_bar_search'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ListViewStateToJson(_$_ListViewState instance) =>
    <String, dynamic>{
      'status': _$LoadStatusEnumMap[instance.status]!,
      'cur_page': instance.curPage,
      'max_page': instance.maxPage,
      'floating_app_bar': instance.floatingAppBar,
      'error_message': instance.errorMessage,
      'app_bar_search': instance.appBarSearch,
    };

const _$LoadStatusEnumMap = {
  LoadStatus.none: 'none',
  LoadStatus.loading: 'loading',
  LoadStatus.loadingMore: 'loadingMore',
  LoadStatus.empty: 'empty',
  LoadStatus.success: 'success',
  LoadStatus.error: 'error',
  LoadStatus.getToken: 'getToken',
};
