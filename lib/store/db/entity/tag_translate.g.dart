// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_translate.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TagTranslateCWProxy {
  TagTranslate intro(String? intro);

  TagTranslate links(String? links);

  TagTranslate name(String name);

  TagTranslate namespace(String namespace);

  TagTranslate translateName(String? translateName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TagTranslate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TagTranslate(...).copyWith(id: 12, name: "My name")
  /// ````
  TagTranslate call({
    String? intro,
    String? links,
    String? name,
    String? namespace,
    String? translateName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTagTranslate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTagTranslate.copyWith.fieldName(...)`
class _$TagTranslateCWProxyImpl implements _$TagTranslateCWProxy {
  final TagTranslate _value;

  const _$TagTranslateCWProxyImpl(this._value);

  @override
  TagTranslate intro(String? intro) => this(intro: intro);

  @override
  TagTranslate links(String? links) => this(links: links);

  @override
  TagTranslate name(String name) => this(name: name);

  @override
  TagTranslate namespace(String namespace) => this(namespace: namespace);

  @override
  TagTranslate translateName(String? translateName) =>
      this(translateName: translateName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TagTranslate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TagTranslate(...).copyWith(id: 12, name: "My name")
  /// ````
  TagTranslate call({
    Object? intro = const $CopyWithPlaceholder(),
    Object? links = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? namespace = const $CopyWithPlaceholder(),
    Object? translateName = const $CopyWithPlaceholder(),
  }) {
    return TagTranslate(
      intro: intro == const $CopyWithPlaceholder()
          ? _value.intro
          // ignore: cast_nullable_to_non_nullable
          : intro as String?,
      links: links == const $CopyWithPlaceholder()
          ? _value.links
          // ignore: cast_nullable_to_non_nullable
          : links as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      namespace: namespace == const $CopyWithPlaceholder() || namespace == null
          ? _value.namespace
          // ignore: cast_nullable_to_non_nullable
          : namespace as String,
      translateName: translateName == const $CopyWithPlaceholder()
          ? _value.translateName
          // ignore: cast_nullable_to_non_nullable
          : translateName as String?,
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
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetTagTranslateCollection on Isar {
  IsarCollection<TagTranslate> get tagTranslates => collection();
}

const TagTranslateSchema = CollectionSchema(
  name: r'TagTranslate',
  schema:
      r'{"name":"TagTranslate","idName":"id","properties":[{"name":"intro","type":"String"},{"name":"links","type":"String"},{"name":"name","type":"String"},{"name":"namespace","type":"String"},{"name":"translateName","type":"String"},{"name":"translateNameNotMD","type":"String"}],"indexes":[{"name":"name","unique":false,"replace":false,"properties":[{"name":"name","type":"Hash","caseSensitive":true}]},{"name":"name_namespace","unique":true,"replace":true,"properties":[{"name":"name","type":"Hash","caseSensitive":true},{"name":"namespace","type":"Hash","caseSensitive":true}]},{"name":"namespace","unique":false,"replace":false,"properties":[{"name":"namespace","type":"Hash","caseSensitive":true}]},{"name":"translateName","unique":false,"replace":false,"properties":[{"name":"translateName","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: r'id',
  propertyIds: {
    r'intro': 0,
    r'links': 1,
    r'name': 2,
    r'namespace': 3,
    r'translateName': 4,
    r'translateNameNotMD': 5
  },
  listProperties: {},
  indexIds: {
    r'name': 0,
    r'name_namespace': 1,
    r'namespace': 2,
    r'translateName': 3
  },
  indexValueTypes: {
    r'name': [
      IndexValueType.stringHash,
    ],
    r'name_namespace': [
      IndexValueType.stringHash,
      IndexValueType.stringHash,
    ],
    r'namespace': [
      IndexValueType.stringHash,
    ],
    r'translateName': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _tagTranslateGetId,
  setId: _tagTranslateSetId,
  getLinks: _tagTranslateGetLinks,
  attachLinks: _tagTranslateAttachLinks,
  serializeNative: _tagTranslateSerializeNative,
  deserializeNative: _tagTranslateDeserializeNative,
  deserializePropNative: _tagTranslateDeserializePropNative,
  serializeWeb: _tagTranslateSerializeWeb,
  deserializeWeb: _tagTranslateDeserializeWeb,
  deserializePropWeb: _tagTranslateDeserializePropWeb,
  version: 4,
);

int? _tagTranslateGetId(TagTranslate object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _tagTranslateSetId(TagTranslate object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _tagTranslateGetLinks(TagTranslate object) {
  return [];
}

void _tagTranslateSerializeNative(
    IsarCollection<TagTranslate> collection,
    IsarCObject cObj,
    TagTranslate object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  IsarUint8List? intro$Bytes;
  final intro$Value = object.intro;
  if (intro$Value != null) {
    intro$Bytes = IsarBinaryWriter.utf8Encoder.convert(intro$Value);
  }
  IsarUint8List? links$Bytes;
  final links$Value = object.links;
  if (links$Value != null) {
    links$Bytes = IsarBinaryWriter.utf8Encoder.convert(links$Value);
  }
  final name$Bytes = IsarBinaryWriter.utf8Encoder.convert(object.name);
  final namespace$Bytes =
      IsarBinaryWriter.utf8Encoder.convert(object.namespace);
  IsarUint8List? translateName$Bytes;
  final translateName$Value = object.translateName;
  if (translateName$Value != null) {
    translateName$Bytes =
        IsarBinaryWriter.utf8Encoder.convert(translateName$Value);
  }
  IsarUint8List? translateNameNotMD$Bytes;
  final translateNameNotMD$Value = object.translateNameNotMD;
  if (translateNameNotMD$Value != null) {
    translateNameNotMD$Bytes =
        IsarBinaryWriter.utf8Encoder.convert(translateNameNotMD$Value);
  }
  final size = (staticSize +
      3 +
      (intro$Bytes?.length ?? 0) +
      3 +
      (links$Bytes?.length ?? 0) +
      3 +
      (name$Bytes.length) +
      3 +
      (namespace$Bytes.length) +
      3 +
      (translateName$Bytes?.length ?? 0) +
      3 +
      (translateNameNotMD$Bytes?.length ?? 0)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeByteList(offsets[0], intro$Bytes);
  writer.writeByteList(offsets[1], links$Bytes);
  writer.writeByteList(offsets[2], name$Bytes);
  writer.writeByteList(offsets[3], namespace$Bytes);
  writer.writeByteList(offsets[4], translateName$Bytes);
  writer.writeByteList(offsets[5], translateNameNotMD$Bytes);
}

TagTranslate _tagTranslateDeserializeNative(
    IsarCollection<TagTranslate> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = TagTranslate(
    intro: reader.readStringOrNull(offsets[0]),
    links: reader.readStringOrNull(offsets[1]),
    name: reader.readString(offsets[2]),
    namespace: reader.readString(offsets[3]),
    translateName: reader.readStringOrNull(offsets[4]),
  );
  object.id = id;
  return object;
}

P _tagTranslateDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _tagTranslateSerializeWeb(
    IsarCollection<TagTranslate> collection, TagTranslate object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'intro', object.intro);
  IsarNative.jsObjectSet(jsObj, r'links', object.links);
  IsarNative.jsObjectSet(jsObj, r'name', object.name);
  IsarNative.jsObjectSet(jsObj, r'namespace', object.namespace);
  IsarNative.jsObjectSet(jsObj, r'translateName', object.translateName);
  IsarNative.jsObjectSet(
      jsObj, r'translateNameNotMD', object.translateNameNotMD);
  return jsObj;
}

TagTranslate _tagTranslateDeserializeWeb(
    IsarCollection<TagTranslate> collection, Object jsObj) {
  final object = TagTranslate(
    intro: IsarNative.jsObjectGet(jsObj, r'intro'),
    links: IsarNative.jsObjectGet(jsObj, r'links'),
    name: IsarNative.jsObjectGet(jsObj, r'name') ?? '',
    namespace: IsarNative.jsObjectGet(jsObj, r'namespace') ?? '',
    translateName: IsarNative.jsObjectGet(jsObj, r'translateName'),
  );
  object.id = IsarNative.jsObjectGet(jsObj, r'id');
  return object;
}

P _tagTranslateDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id')) as P;
    case r'intro':
      return (IsarNative.jsObjectGet(jsObj, r'intro')) as P;
    case r'links':
      return (IsarNative.jsObjectGet(jsObj, r'links')) as P;
    case r'name':
      return (IsarNative.jsObjectGet(jsObj, r'name') ?? '') as P;
    case r'namespace':
      return (IsarNative.jsObjectGet(jsObj, r'namespace') ?? '') as P;
    case r'translateName':
      return (IsarNative.jsObjectGet(jsObj, r'translateName')) as P;
    case r'translateNameNotMD':
      return (IsarNative.jsObjectGet(jsObj, r'translateNameNotMD')) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _tagTranslateAttachLinks(
    IsarCollection<dynamic> col, int id, TagTranslate object) {}

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

  Future<int> putByNameNamespace(TagTranslate object) {
    return putByIndex(r'name_namespace', object);
  }

  int putByNameNamespaceSync(TagTranslate object, {bool saveLinks = true}) {
    return putByIndexSync(r'name_namespace', object, saveLinks: saveLinks);
  }

  Future<List<int>> putAllByNameNamespace(List<TagTranslate> objects) {
    return putAllByIndex(r'name_namespace', objects);
  }

  List<int> putAllByNameNamespaceSync(List<TagTranslate> objects,
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
}

extension TagTranslateQueryWhere
    on QueryBuilder<TagTranslate, TagTranslate, QWhereClause> {
  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause> idEqualTo(
      int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause> idNotEqualTo(
      int id) {
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
      int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
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
}

extension TagTranslateQueryFilter
    on QueryBuilder<TagTranslate, TagTranslate, QFilterCondition> {
  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TagTranslate, TagTranslate, QAfterFilterCondition> idGreaterThan(
    int value, {
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
    int value, {
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
    int lower,
    int upper, {
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
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
      linksIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
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
      translateNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
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
      translateNameNotMDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool include = false,
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
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
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
}

extension TagTranslateQueryLinks
    on QueryBuilder<TagTranslate, TagTranslate, QFilterCondition> {}

extension TagTranslateQueryWhereSortBy
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

extension TagTranslateQueryWhereSortThenBy
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
