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

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TagTranslate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TagTranslate(...).copyWith(id: 12, name: "My name")
  /// ````
  TagTranslate call({
    String? namespace,
    String? name,
    String? translateName,
    String? intro,
    String? links,
    int? lastUseTime,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTagTranslate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTagTranslate.copyWith.fieldName(...)`
class _$TagTranslateCWProxyImpl implements _$TagTranslateCWProxy {
  const _$TagTranslateCWProxyImpl(this._value);

  final TagTranslate _value;

  @override
  TagTranslate namespace(String namespace) => this(namespace: namespace);

  @override
  TagTranslate name(String name) => this(name: name);

  @override
  TagTranslate translateName(String? translateName) =>
      this(translateName: translateName);

  @override
  TagTranslate intro(String? intro) => this(intro: intro);

  @override
  TagTranslate links(String? links) => this(links: links);

  @override
  TagTranslate lastUseTime(int lastUseTime) => this(lastUseTime: lastUseTime);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TagTranslate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TagTranslate(...).copyWith(id: 12, name: "My name")
  /// ````
  TagTranslate call({
    Object? namespace = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? translateName = const $CopyWithPlaceholder(),
    Object? intro = const $CopyWithPlaceholder(),
    Object? links = const $CopyWithPlaceholder(),
    Object? lastUseTime = const $CopyWithPlaceholder(),
  }) {
    return TagTranslate(
      namespace: namespace == const $CopyWithPlaceholder() || namespace == null
          // ignore: unnecessary_non_null_assertion
          ? _value.namespace!
          // ignore: cast_nullable_to_non_nullable
          : namespace as String,
      name: name == const $CopyWithPlaceholder() || name == null
          // ignore: unnecessary_non_null_assertion
          ? _value.name!
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
              // ignore: unnecessary_non_null_assertion
              ? _value.lastUseTime!
              // ignore: cast_nullable_to_non_nullable
              : lastUseTime as int,
    );
  }
}

extension $TagTranslateCopyWith on TagTranslate {
  /// Returns a callable class that can be used as follows: `instanceOfTagTranslate.copyWith(...)` or like so:`instanceOfTagTranslate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TagTranslateCWProxy get copyWith => _$TagTranslateCWProxyImpl(this);
}

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTagTranslateCollection on Isar {
  IsarCollection<TagTranslate> get tagTranslates => this.collection();
}

const TagTranslateSchema = CollectionSchema(
  name: r'TagTranslate',
  id: 3102014280040731013,
  properties: {
    r'intro': PropertySchema(
      id: 0,
      name: r'intro',
      type: IsarType.string,
    ),
    r'lastUseTime': PropertySchema(
      id: 1,
      name: r'lastUseTime',
      type: IsarType.long,
    ),
    r'links': PropertySchema(
      id: 2,
      name: r'links',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'namespace': PropertySchema(
      id: 4,
      name: r'namespace',
      type: IsarType.string,
    ),
    r'translateName': PropertySchema(
      id: 5,
      name: r'translateName',
      type: IsarType.string,
    ),
    r'translateNameNotMD': PropertySchema(
      id: 6,
      name: r'translateNameNotMD',
      type: IsarType.string,
    )
  },
  estimateSize: _tagTranslateEstimateSize,
  serialize: _tagTranslateSerialize,
  deserialize: _tagTranslateDeserialize,
  deserializeProp: _tagTranslateDeserializeProp,
  idName: r'id',
  indexes: {
    r'namespace': IndexSchema(
      id: 2334977328868235416,
      name: r'namespace',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'namespace',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'name_namespace': IndexSchema(
      id: -8993266001380523020,
      name: r'name_namespace',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        ),
        IndexPropertySchema(
          name: r'namespace',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'translateName': IndexSchema(
      id: -5259999136743835192,
      name: r'translateName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'translateName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'lastUseTime': IndexSchema(
      id: 9135219936382264109,
      name: r'lastUseTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastUseTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _tagTranslateGetId,
  getLinks: _tagTranslateGetLinks,
  attach: _tagTranslateAttach,
  version: '3.0.5',
);

int _tagTranslateEstimateSize(
  TagTranslate object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.intro;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.links;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.namespace.length * 3;
  {
    final value = object.translateName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.translateNameNotMD;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _tagTranslateSerialize(
  TagTranslate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.intro);
  writer.writeLong(offsets[1], object.lastUseTime);
  writer.writeString(offsets[2], object.links);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.namespace);
  writer.writeString(offsets[5], object.translateName);
  writer.writeString(offsets[6], object.translateNameNotMD);
}

TagTranslate _tagTranslateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TagTranslate(
    intro: reader.readStringOrNull(offsets[0]),
    lastUseTime: reader.readLongOrNull(offsets[1]) ?? 0,
    links: reader.readStringOrNull(offsets[2]),
    name: reader.readString(offsets[3]),
    namespace: reader.readString(offsets[4]),
    translateName: reader.readStringOrNull(offsets[5]),
  );
  object.id = id;
  return object;
}

P _tagTranslateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tagTranslateGetId(TagTranslate object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tagTranslateGetLinks(TagTranslate object) {
  return [];
}

void _tagTranslateAttach(
    IsarCollection<dynamic> col, Id id, TagTranslate object) {
  object.id = id;
}

extension TagTranslateByIndex on IsarCollection<TagTranslate> {
  Future<TagTranslate?> getByNameNamespace(String name, String namespace) {
    return getByIndex(r'name_namespace', [name, namespace]);
  }

  TagTranslate? getByNameNamespaceSync(String name, String namespace) {
    return getByIndexSync(r'name_namespace', [name, namespace]);
  }

  Future<bool> deleteByNameNamespace(String name, String namespace) {
    return deleteByIndex(r'name_namespace', [name, namespace]);
  }

  bool deleteByNameNamespaceSync(String name, String namespace) {
    return deleteByIndexSync(r'name_namespace', [name, namespace]);
  }

  Future<List<TagTranslate?>> getAllByNameNamespace(
      List<String> nameValues, List<String> namespaceValues) {
    final len = nameValues.length;
    assert(namespaceValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([nameValues[i], namespaceValues[i]]);
    }

    return getAllByIndex(r'name_namespace', values);
  }

  List<TagTranslate?> getAllByNameNamespaceSync(
      List<String> nameValues, List<String> namespaceValues) {
    final len = nameValues.length;
    assert(namespaceValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([nameValues[i], namespaceValues[i]]);
    }

    return getAllByIndexSync(r'name_namespace', values);
  }

  Future<int> deleteAllByNameNamespace(
      List<String> nameValues, List<String> namespaceValues) {
    final len = nameValues.length;
    assert(namespaceValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([nameValues[i], namespaceValues[i]]);
    }

    return deleteAllByIndex(r'name_namespace', values);
  }

  int deleteAllByNameNamespaceSync(
      List<String> nameValues, List<String> namespaceValues) {
    final len = nameValues.length;
    assert(namespaceValues.length == len,
        'All index values must have the same length');
    final values = <List<dynamic>>[];
    for (var i = 0; i < len; i++) {
      values.add([nameValues[i], namespaceValues[i]]);
    }

    return deleteAllByIndexSync(r'name_namespace', values);
  }

  Future<Id> putByNameNamespace(TagTranslate object) {
    return putByIndex(r'name_namespace', object);
  }

  Id putByNameNamespaceSync(TagTranslate object, {bool saveLinks = true}) {
    return putByIndexSync(r'name_namespace', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByNameNamespace(List<TagTranslate> objects) {
    return putAllByIndex(r'name_namespace', objects);
  }

  List<Id> putAllByNameNamespaceSync(List<TagTranslate> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'name_namespace', objects, saveLinks: saveLinks);
  }
}

extension TagTranslateQueryWhereSort
    on QueryBuilder<TagTranslate, TagTranslate, QWhere> {
  QueryBuilder<TagTranslate, TagTranslate, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhere> anyLastUseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastUseTime'),
      );
    });
  }
}

extension TagTranslateQueryWhere
    on QueryBuilder<TagTranslate, TagTranslate, QWhereClause> {
  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause> namespaceEqualTo(
      String namespace) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'namespace',
        value: [namespace],
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      namespaceNotEqualTo(String namespace) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'namespace',
              lower: [],
              upper: [namespace],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'namespace',
              lower: [namespace],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'namespace',
              lower: [namespace],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'namespace',
              lower: [],
              upper: [namespace],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      nameEqualToAnyNamespace(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name_namespace',
        value: [name],
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      nameNotEqualToAnyNamespace(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name_namespace',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name_namespace',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name_namespace',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name_namespace',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      nameNamespaceEqualTo(String name, String namespace) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name_namespace',
        value: [name, namespace],
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      nameEqualToNamespaceNotEqualTo(String name, String namespace) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name_namespace',
              lower: [name],
              upper: [name, namespace],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name_namespace',
              lower: [name, namespace],
              includeLower: false,
              upper: [name],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name_namespace',
              lower: [name, namespace],
              includeLower: false,
              upper: [name],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name_namespace',
              lower: [name],
              upper: [name, namespace],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause> nameEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause> nameNotEqualTo(
      String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      translateNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'translateName',
        value: [null],
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      translateNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'translateName',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      translateNameEqualTo(String? translateName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'translateName',
        value: [translateName],
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      translateNameNotEqualTo(String? translateName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'translateName',
              lower: [],
              upper: [translateName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'translateName',
              lower: [translateName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'translateName',
              lower: [translateName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'translateName',
              lower: [],
              upper: [translateName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      lastUseTimeEqualTo(int lastUseTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastUseTime',
        value: [lastUseTime],
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      lastUseTimeNotEqualTo(int lastUseTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUseTime',
              lower: [],
              upper: [lastUseTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUseTime',
              lower: [lastUseTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUseTime',
              lower: [lastUseTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastUseTime',
              lower: [],
              upper: [lastUseTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      lastUseTimeGreaterThan(
    int lastUseTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUseTime',
        lower: [lastUseTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      lastUseTimeLessThan(
    int lastUseTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUseTime',
        lower: [],
        upper: [lastUseTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause>
      lastUseTimeBetween(
    int lowerLastUseTime,
    int upperLastUseTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastUseTime',
        lower: [lowerLastUseTime],
        includeLower: includeLower,
        upper: [upperLastUseTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TagTranslateQueryFilter
    on QueryBuilder<TagTranslate, TagTranslate, QFilterCondition> {
  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      introIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'intro',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      introIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'intro',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> introEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      introGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'intro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> introLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'intro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> introBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'intro',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      introStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'intro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> introEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'intro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> introContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'intro',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> introMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'intro',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      introIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'intro',
        value: '',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      introIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'intro',
        value: '',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      lastUseTimeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUseTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      lastUseTimeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUseTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      lastUseTimeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUseTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      lastUseTimeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUseTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      linksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'links',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      linksIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'links',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> linksEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'links',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      linksGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'links',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> linksLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'links',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> linksBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'links',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      linksStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'links',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> linksEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'links',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> linksContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'links',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> linksMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'links',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      linksIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'links',
        value: '',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      linksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'links',
        value: '',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      namespaceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namespace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      namespaceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'namespace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      namespaceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'namespace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      namespaceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'namespace',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      namespaceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'namespace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      namespaceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'namespace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      namespaceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'namespace',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      namespaceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'namespace',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      namespaceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'namespace',
        value: '',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      namespaceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'namespace',
        value: '',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'translateName',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'translateName',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'translateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'translateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'translateName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'translateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'translateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'translateName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'translateName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translateName',
        value: '',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'translateName',
        value: '',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameNotMDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'translateNameNotMD',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameNotMDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'translateNameNotMD',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameNotMDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translateNameNotMD',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameNotMDGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'translateNameNotMD',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameNotMDLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'translateNameNotMD',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameNotMDBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'translateNameNotMD',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameNotMDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'translateNameNotMD',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameNotMDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'translateNameNotMD',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameNotMDContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'translateNameNotMD',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameNotMDMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'translateNameNotMD',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameNotMDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'translateNameNotMD',
        value: '',
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition>
      translateNameNotMDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'translateNameNotMD',
        value: '',
      ));
    });
  }
}

extension TagTranslateQueryObject
    on QueryBuilder<TagTranslate, TagTranslate, QFilterCondition> {}

extension TagTranslateQueryLinks
    on QueryBuilder<TagTranslate, TagTranslate, QFilterCondition> {}

extension TagTranslateQuerySortBy
    on QueryBuilder<TagTranslate, TagTranslate, QSortBy> {
  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> sortByIntro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intro', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> sortByIntroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intro', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> sortByLastUseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUseTime', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy>
      sortByLastUseTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUseTime', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> sortByLinks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'links', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> sortByLinksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'links', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> sortByNamespace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namespace', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> sortByNamespaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namespace', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> sortByTranslateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translateName', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy>
      sortByTranslateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translateName', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy>
      sortByTranslateNameNotMD() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translateNameNotMD', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy>
      sortByTranslateNameNotMDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translateNameNotMD', Sort.desc);
    });
  }
}

extension TagTranslateQuerySortThenBy
    on QueryBuilder<TagTranslate, TagTranslate, QSortThenBy> {
  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> thenByIntro() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intro', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> thenByIntroDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intro', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> thenByLastUseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUseTime', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy>
      thenByLastUseTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUseTime', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> thenByLinks() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'links', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> thenByLinksDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'links', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> thenByNamespace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namespace', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> thenByNamespaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'namespace', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy> thenByTranslateName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translateName', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy>
      thenByTranslateNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translateName', Sort.desc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy>
      thenByTranslateNameNotMD() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translateNameNotMD', Sort.asc);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterSortBy>
      thenByTranslateNameNotMDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'translateNameNotMD', Sort.desc);
    });
  }
}

extension TagTranslateQueryWhereDistinct
    on QueryBuilder<TagTranslate, TagTranslate, QDistinct> {
  QueryBuilder<TagTranslate, TagTranslate, QDistinct> distinctByIntro(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intro', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QDistinct> distinctByLastUseTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUseTime');
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QDistinct> distinctByLinks(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'links', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QDistinct> distinctByNamespace(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'namespace', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QDistinct> distinctByTranslateName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'translateName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QDistinct>
      distinctByTranslateNameNotMD({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'translateNameNotMD',
          caseSensitive: caseSensitive);
    });
  }
}

extension TagTranslateQueryProperty
    on QueryBuilder<TagTranslate, TagTranslate, QQueryProperty> {
  QueryBuilder<TagTranslate, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TagTranslate, String?, QQueryOperations> introProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intro');
    });
  }

  QueryBuilder<TagTranslate, int, QQueryOperations> lastUseTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUseTime');
    });
  }

  QueryBuilder<TagTranslate, String?, QQueryOperations> linksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'links');
    });
  }

  QueryBuilder<TagTranslate, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<TagTranslate, String, QQueryOperations> namespaceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'namespace');
    });
  }

  QueryBuilder<TagTranslate, String?, QQueryOperations>
      translateNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translateName');
    });
  }

  QueryBuilder<TagTranslate, String?, QQueryOperations>
      translateNameNotMDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'translateNameNotMD');
    });
  }
}
