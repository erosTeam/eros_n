// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_translate.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TagTranslateCWProxy {
  TagTranslate namespace(String namespace);

  TagTranslate name(String name);

  TagTranslate translateName(String? translateName);

  TagTranslate intro(String? intro);

  TagTranslate links(String? links);

  TagTranslate lastUseTime(int lastUseTime);

  TagTranslate id(int id);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `TagTranslate(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TagTranslate(...).copyWith(id: 12, name: "My name")
  /// ```
  TagTranslate call({
    String namespace,
    String name,
    String? translateName,
    String? intro,
    String? links,
    int lastUseTime,
    int id,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfTagTranslate.copyWith(...)` or call `instanceOfTagTranslate.copyWith.fieldName(value)` for a single field.
class _$TagTranslateCWProxyImpl implements _$TagTranslateCWProxy {
  const _$TagTranslateCWProxyImpl(this._value);

  final TagTranslate _value;

  @override
  TagTranslate namespace(String namespace) => call(namespace: namespace);

  @override
  TagTranslate name(String name) => call(name: name);

  @override
  TagTranslate translateName(String? translateName) =>
      call(translateName: translateName);

  @override
  TagTranslate intro(String? intro) => call(intro: intro);

  @override
  TagTranslate links(String? links) => call(links: links);

  @override
  TagTranslate lastUseTime(int lastUseTime) => call(lastUseTime: lastUseTime);

  @override
  TagTranslate id(int id) => call(id: id);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `TagTranslate(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// TagTranslate(...).copyWith(id: 12, name: "My name")
  /// ```
  TagTranslate call({
    Object? namespace = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? translateName = const $CopyWithPlaceholder(),
    Object? intro = const $CopyWithPlaceholder(),
    Object? links = const $CopyWithPlaceholder(),
    Object? lastUseTime = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return TagTranslate(
      namespace: namespace == const $CopyWithPlaceholder() || namespace == null
          ? _value.namespace
          // ignore: cast_nullable_to_non_nullable
          : namespace as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      translateName: translateName == const $CopyWithPlaceholder()
          ? _value.translateName
          // ignore: cast_nullable_to_non_nullable
          : translateName as String?,
      intro: intro == const $CopyWithPlaceholder()
          ? _value.intro
          // ignore: cast_nullable_to_non_nullable
          : intro as String?,
      links: links == const $CopyWithPlaceholder()
          ? _value.links
          // ignore: cast_nullable_to_non_nullable
          : links as String?,
      lastUseTime:
          lastUseTime == const $CopyWithPlaceholder() || lastUseTime == null
          ? _value.lastUseTime
          // ignore: cast_nullable_to_non_nullable
          : lastUseTime as int,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
    );
  }
}

extension $TagTranslateCopyWith on TagTranslate {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfTagTranslate.copyWith(...)` or `instanceOfTagTranslate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TagTranslateCWProxy get copyWith => _$TagTranslateCWProxyImpl(this);
}
