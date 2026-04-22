// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nh_tag.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NhTagCWProxy {
  NhTag id(int id);

  NhTag name(String? name);

  NhTag count(int? count);

  NhTag type(String? type);

  NhTag lastUseTime(int lastUseTime);

  NhTag translateName(String? translateName);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `NhTag(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// NhTag(...).copyWith(id: 12, name: "My name")
  /// ```
  NhTag call({
    int id,
    String? name,
    int? count,
    String? type,
    int lastUseTime,
    String? translateName,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfNhTag.copyWith(...)` or call `instanceOfNhTag.copyWith.fieldName(value)` for a single field.
class _$NhTagCWProxyImpl implements _$NhTagCWProxy {
  const _$NhTagCWProxyImpl(this._value);

  final NhTag _value;

  @override
  NhTag id(int id) => call(id: id);

  @override
  NhTag name(String? name) => call(name: name);

  @override
  NhTag count(int? count) => call(count: count);

  @override
  NhTag type(String? type) => call(type: type);

  @override
  NhTag lastUseTime(int lastUseTime) => call(lastUseTime: lastUseTime);

  @override
  NhTag translateName(String? translateName) =>
      call(translateName: translateName);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `NhTag(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// NhTag(...).copyWith(id: 12, name: "My name")
  /// ```
  NhTag call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? count = const $CopyWithPlaceholder(),
    Object? type = const $CopyWithPlaceholder(),
    Object? lastUseTime = const $CopyWithPlaceholder(),
    Object? translateName = const $CopyWithPlaceholder(),
  }) {
    return NhTag(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      count: count == const $CopyWithPlaceholder()
          ? _value.count
          // ignore: cast_nullable_to_non_nullable
          : count as int?,
      type: type == const $CopyWithPlaceholder()
          ? _value.type
          // ignore: cast_nullable_to_non_nullable
          : type as String?,
      lastUseTime:
          lastUseTime == const $CopyWithPlaceholder() || lastUseTime == null
          ? _value.lastUseTime
          // ignore: cast_nullable_to_non_nullable
          : lastUseTime as int,
      translateName: translateName == const $CopyWithPlaceholder()
          ? _value.translateName
          // ignore: cast_nullable_to_non_nullable
          : translateName as String?,
    );
  }
}

extension $NhTagCopyWith on NhTag {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfNhTag.copyWith(...)` or `instanceOfNhTag.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NhTagCWProxy get copyWith => _$NhTagCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NhTag _$NhTagFromJson(Map<String, dynamic> json) => NhTag(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String?,
  count: (json['count'] as num?)?.toInt(),
  lastUseTime: (json['lastUseTime'] as num?)?.toInt() ?? 0,
  translateName: json['translateName'] as String?,
);

Map<String, dynamic> _$NhTagToJson(NhTag instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'translateName': instance.translateName,
  'count': instance.count,
  'lastUseTime': instance.lastUseTime,
};
