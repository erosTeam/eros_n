// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetGalleryHistoryCollection on Isar {
  IsarCollection<GalleryHistory> get galleryHistorys => collection();
}

const GalleryHistorySchema = CollectionSchema(
  name: r'GalleryHistory',
  schema:
      r'{"name":"GalleryHistory","idName":"gid","properties":[{"name":"coverImgHeight","type":"Long"},{"name":"coverImgWidth","type":"Long"},{"name":"csrfToken","type":"String"},{"name":"japaneseTitle","type":"String"},{"name":"lastReadTime","type":"Long"},{"name":"mediaId","type":"String"},{"name":"thumbUrl","type":"String"},{"name":"title","type":"String"},{"name":"url","type":"String"}],"indexes":[{"name":"lastReadTime","unique":false,"replace":false,"properties":[{"name":"lastReadTime","type":"Value","caseSensitive":false}]}],"links":[]}',
  idName: r'gid',
  propertyIds: {
    r'coverImgHeight': 0,
    r'coverImgWidth': 1,
    r'csrfToken': 2,
    r'japaneseTitle': 3,
    r'lastReadTime': 4,
    r'mediaId': 5,
    r'thumbUrl': 6,
    r'title': 7,
    r'url': 8
  },
  listProperties: {},
  indexIds: {r'lastReadTime': 0},
  indexValueTypes: {
    r'lastReadTime': [
      IndexValueType.long,
    ]
  },
  linkIds: {},
  backlinkLinkNames: {},
  getId: _galleryHistoryGetId,
  setId: _galleryHistorySetId,
  getLinks: _galleryHistoryGetLinks,
  attachLinks: _galleryHistoryAttachLinks,
  serializeNative: _galleryHistorySerializeNative,
  deserializeNative: _galleryHistoryDeserializeNative,
  deserializePropNative: _galleryHistoryDeserializePropNative,
  serializeWeb: _galleryHistorySerializeWeb,
  deserializeWeb: _galleryHistoryDeserializeWeb,
  deserializePropWeb: _galleryHistoryDeserializePropWeb,
  version: 4,
);

int? _galleryHistoryGetId(GalleryHistory object) {
  if (object.gid == Isar.autoIncrement) {
    return null;
  } else {
    return object.gid;
  }
}

void _galleryHistorySetId(GalleryHistory object, int id) {
  object.gid = id;
}

List<IsarLinkBase<dynamic>> _galleryHistoryGetLinks(GalleryHistory object) {
  return [];
}

void _galleryHistorySerializeNative(
    IsarCollection<GalleryHistory> collection,
    IsarCObject cObj,
    GalleryHistory object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  IsarUint8List? csrfToken$Bytes;
  final csrfToken$Value = object.csrfToken;
  if (csrfToken$Value != null) {
    csrfToken$Bytes = IsarBinaryWriter.utf8Encoder.convert(csrfToken$Value);
  }
  IsarUint8List? japaneseTitle$Bytes;
  final japaneseTitle$Value = object.japaneseTitle;
  if (japaneseTitle$Value != null) {
    japaneseTitle$Bytes =
        IsarBinaryWriter.utf8Encoder.convert(japaneseTitle$Value);
  }
  IsarUint8List? mediaId$Bytes;
  final mediaId$Value = object.mediaId;
  if (mediaId$Value != null) {
    mediaId$Bytes = IsarBinaryWriter.utf8Encoder.convert(mediaId$Value);
  }
  IsarUint8List? thumbUrl$Bytes;
  final thumbUrl$Value = object.thumbUrl;
  if (thumbUrl$Value != null) {
    thumbUrl$Bytes = IsarBinaryWriter.utf8Encoder.convert(thumbUrl$Value);
  }
  IsarUint8List? title$Bytes;
  final title$Value = object.title;
  if (title$Value != null) {
    title$Bytes = IsarBinaryWriter.utf8Encoder.convert(title$Value);
  }
  IsarUint8List? url$Bytes;
  final url$Value = object.url;
  if (url$Value != null) {
    url$Bytes = IsarBinaryWriter.utf8Encoder.convert(url$Value);
  }
  final size = (staticSize +
      3 +
      (csrfToken$Bytes?.length ?? 0) +
      3 +
      (japaneseTitle$Bytes?.length ?? 0) +
      3 +
      (mediaId$Bytes?.length ?? 0) +
      3 +
      (thumbUrl$Bytes?.length ?? 0) +
      3 +
      (title$Bytes?.length ?? 0) +
      3 +
      (url$Bytes?.length ?? 0)) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeLong(offsets[0], object.coverImgHeight);
  writer.writeLong(offsets[1], object.coverImgWidth);
  writer.writeByteList(offsets[2], csrfToken$Bytes);
  writer.writeByteList(offsets[3], japaneseTitle$Bytes);
  writer.writeLong(offsets[4], object.lastReadTime);
  writer.writeByteList(offsets[5], mediaId$Bytes);
  writer.writeByteList(offsets[6], thumbUrl$Bytes);
  writer.writeByteList(offsets[7], title$Bytes);
  writer.writeByteList(offsets[8], url$Bytes);
}

GalleryHistory _galleryHistoryDeserializeNative(
    IsarCollection<GalleryHistory> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = GalleryHistory();
  object.coverImgHeight = reader.readLongOrNull(offsets[0]);
  object.coverImgWidth = reader.readLongOrNull(offsets[1]);
  object.csrfToken = reader.readStringOrNull(offsets[2]);
  object.gid = id;
  object.japaneseTitle = reader.readStringOrNull(offsets[3]);
  object.lastReadTime = reader.readLongOrNull(offsets[4]);
  object.mediaId = reader.readStringOrNull(offsets[5]);
  object.thumbUrl = reader.readStringOrNull(offsets[6]);
  object.title = reader.readStringOrNull(offsets[7]);
  object.url = reader.readStringOrNull(offsets[8]);
  return object;
}

P _galleryHistoryDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _galleryHistorySerializeWeb(
    IsarCollection<GalleryHistory> collection, GalleryHistory object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'coverImgHeight', object.coverImgHeight);
  IsarNative.jsObjectSet(jsObj, r'coverImgWidth', object.coverImgWidth);
  IsarNative.jsObjectSet(jsObj, r'csrfToken', object.csrfToken);
  IsarNative.jsObjectSet(jsObj, r'gid', object.gid);
  IsarNative.jsObjectSet(jsObj, r'japaneseTitle', object.japaneseTitle);
  IsarNative.jsObjectSet(jsObj, r'lastReadTime', object.lastReadTime);
  IsarNative.jsObjectSet(jsObj, r'mediaId', object.mediaId);
  IsarNative.jsObjectSet(jsObj, r'thumbUrl', object.thumbUrl);
  IsarNative.jsObjectSet(jsObj, r'title', object.title);
  IsarNative.jsObjectSet(jsObj, r'url', object.url);
  return jsObj;
}

GalleryHistory _galleryHistoryDeserializeWeb(
    IsarCollection<GalleryHistory> collection, Object jsObj) {
  final object = GalleryHistory();
  object.coverImgHeight = IsarNative.jsObjectGet(jsObj, r'coverImgHeight');
  object.coverImgWidth = IsarNative.jsObjectGet(jsObj, r'coverImgWidth');
  object.csrfToken = IsarNative.jsObjectGet(jsObj, r'csrfToken');
  object.gid = IsarNative.jsObjectGet(jsObj, r'gid');
  object.japaneseTitle = IsarNative.jsObjectGet(jsObj, r'japaneseTitle');
  object.lastReadTime = IsarNative.jsObjectGet(jsObj, r'lastReadTime');
  object.mediaId = IsarNative.jsObjectGet(jsObj, r'mediaId');
  object.thumbUrl = IsarNative.jsObjectGet(jsObj, r'thumbUrl');
  object.title = IsarNative.jsObjectGet(jsObj, r'title');
  object.url = IsarNative.jsObjectGet(jsObj, r'url');
  return object;
}

P _galleryHistoryDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'coverImgHeight':
      return (IsarNative.jsObjectGet(jsObj, r'coverImgHeight')) as P;
    case r'coverImgWidth':
      return (IsarNative.jsObjectGet(jsObj, r'coverImgWidth')) as P;
    case r'csrfToken':
      return (IsarNative.jsObjectGet(jsObj, r'csrfToken')) as P;
    case r'gid':
      return (IsarNative.jsObjectGet(jsObj, r'gid')) as P;
    case r'japaneseTitle':
      return (IsarNative.jsObjectGet(jsObj, r'japaneseTitle')) as P;
    case r'lastReadTime':
      return (IsarNative.jsObjectGet(jsObj, r'lastReadTime')) as P;
    case r'mediaId':
      return (IsarNative.jsObjectGet(jsObj, r'mediaId')) as P;
    case r'thumbUrl':
      return (IsarNative.jsObjectGet(jsObj, r'thumbUrl')) as P;
    case r'title':
      return (IsarNative.jsObjectGet(jsObj, r'title')) as P;
    case r'url':
      return (IsarNative.jsObjectGet(jsObj, r'url')) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _galleryHistoryAttachLinks(
    IsarCollection<dynamic> col, int id, GalleryHistory object) {}

extension GalleryHistoryQueryWhereSort
    on QueryBuilder<GalleryHistory, GalleryHistory, QWhere> {
  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhere> anyGid() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhere> anyLastReadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'lastReadTime'),
      );
    });
  }
}

extension GalleryHistoryQueryWhere
    on QueryBuilder<GalleryHistory, GalleryHistory, QWhereClause> {
  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause> gidEqualTo(
      int gid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: gid,
        upper: gid,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause> gidNotEqualTo(
      int gid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: gid, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: gid, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: gid, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: gid, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause>
      gidGreaterThan(int gid, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: gid, includeLower: include),
      );
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause> gidLessThan(
      int gid,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: gid, includeUpper: include),
      );
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause> gidBetween(
    int lowerGid,
    int upperGid, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerGid,
        includeLower: includeLower,
        upper: upperGid,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause>
      lastReadTimeEqualTo(int? lastReadTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastReadTime',
        value: [lastReadTime],
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause>
      lastReadTimeNotEqualTo(int? lastReadTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastReadTime',
              lower: [],
              upper: [lastReadTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastReadTime',
              lower: [lastReadTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastReadTime',
              lower: [lastReadTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'lastReadTime',
              lower: [],
              upper: [lastReadTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause>
      lastReadTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'lastReadTime',
        value: [null],
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause>
      lastReadTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastReadTime',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause>
      lastReadTimeGreaterThan(
    int? lastReadTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastReadTime',
        lower: [lastReadTime],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause>
      lastReadTimeLessThan(
    int? lastReadTime, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastReadTime',
        lower: [],
        upper: [lastReadTime],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause>
      lastReadTimeBetween(
    int? lowerLastReadTime,
    int? upperLastReadTime, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'lastReadTime',
        lower: [lowerLastReadTime],
        includeLower: includeLower,
        upper: [upperLastReadTime],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GalleryHistoryQueryFilter
    on QueryBuilder<GalleryHistory, GalleryHistory, QFilterCondition> {
  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      coverImgHeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coverImgHeight',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      coverImgHeightEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverImgHeight',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      coverImgHeightGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverImgHeight',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      coverImgHeightLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverImgHeight',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      coverImgHeightBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverImgHeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      coverImgWidthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coverImgWidth',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      coverImgWidthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverImgWidth',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      coverImgWidthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverImgWidth',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      coverImgWidthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverImgWidth',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      coverImgWidthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverImgWidth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      csrfTokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'csrfToken',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      csrfTokenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'csrfToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      csrfTokenGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'csrfToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      csrfTokenLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'csrfToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      csrfTokenBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'csrfToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      csrfTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'csrfToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      csrfTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'csrfToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      csrfTokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'csrfToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      csrfTokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'csrfToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      gidEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gid',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      gidGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gid',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      gidLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gid',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      gidBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      japaneseTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'japaneseTitle',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      japaneseTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'japaneseTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      japaneseTitleGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'japaneseTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      japaneseTitleLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'japaneseTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      japaneseTitleBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'japaneseTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      japaneseTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'japaneseTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      japaneseTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'japaneseTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      japaneseTitleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'japaneseTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      japaneseTitleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'japaneseTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      lastReadTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastReadTime',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      lastReadTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastReadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      lastReadTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastReadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      lastReadTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastReadTime',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      lastReadTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastReadTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      mediaIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mediaId',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      mediaIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mediaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      mediaIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mediaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      mediaIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mediaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      mediaIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mediaId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      mediaIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mediaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      mediaIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mediaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      mediaIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mediaId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      mediaIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mediaId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thumbUrl',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbUrlGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thumbUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbUrlLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thumbUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbUrlBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thumbUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thumbUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thumbUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thumbUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thumbUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      titleGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      titleLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      titleBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      urlGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      urlLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      urlBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      urlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      urlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }
}

extension GalleryHistoryQueryLinks
    on QueryBuilder<GalleryHistory, GalleryHistory, QFilterCondition> {}

extension GalleryHistoryQueryWhereSortBy
    on QueryBuilder<GalleryHistory, GalleryHistory, QSortBy> {
  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByCoverImgHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImgHeight', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByCoverImgHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImgHeight', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByCoverImgWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImgWidth', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByCoverImgWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImgWidth', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> sortByCsrfToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'csrfToken', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByCsrfTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'csrfToken', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByJapaneseTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'japaneseTitle', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByJapaneseTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'japaneseTitle', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByLastReadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadTime', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByLastReadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadTime', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> sortByMediaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaId', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByMediaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaId', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> sortByThumbUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbUrl', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByThumbUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbUrl', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension GalleryHistoryQueryWhereSortThenBy
    on QueryBuilder<GalleryHistory, GalleryHistory, QSortThenBy> {
  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByCoverImgHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImgHeight', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByCoverImgHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImgHeight', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByCoverImgWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImgWidth', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByCoverImgWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverImgWidth', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> thenByCsrfToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'csrfToken', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByCsrfTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'csrfToken', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> thenByGid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gid', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> thenByGidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gid', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByJapaneseTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'japaneseTitle', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByJapaneseTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'japaneseTitle', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByLastReadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadTime', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByLastReadTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastReadTime', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> thenByMediaId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaId', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByMediaIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaId', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> thenByThumbUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbUrl', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByThumbUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbUrl', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension GalleryHistoryQueryWhereDistinct
    on QueryBuilder<GalleryHistory, GalleryHistory, QDistinct> {
  QueryBuilder<GalleryHistory, GalleryHistory, QDistinct>
      distinctByCoverImgHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverImgHeight');
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QDistinct>
      distinctByCoverImgWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverImgWidth');
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QDistinct> distinctByCsrfToken(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'csrfToken', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QDistinct>
      distinctByJapaneseTitle({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'japaneseTitle',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QDistinct>
      distinctByLastReadTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastReadTime');
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QDistinct> distinctByMediaId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mediaId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QDistinct> distinctByThumbUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension GalleryHistoryQueryProperty
    on QueryBuilder<GalleryHistory, GalleryHistory, QQueryProperty> {
  QueryBuilder<GalleryHistory, int, QQueryOperations> gidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gid');
    });
  }

  QueryBuilder<GalleryHistory, int?, QQueryOperations>
      coverImgHeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverImgHeight');
    });
  }

  QueryBuilder<GalleryHistory, int?, QQueryOperations> coverImgWidthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverImgWidth');
    });
  }

  QueryBuilder<GalleryHistory, String?, QQueryOperations> csrfTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'csrfToken');
    });
  }

  QueryBuilder<GalleryHistory, String?, QQueryOperations>
      japaneseTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'japaneseTitle');
    });
  }

  QueryBuilder<GalleryHistory, int?, QQueryOperations> lastReadTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastReadTime');
    });
  }

  QueryBuilder<GalleryHistory, String?, QQueryOperations> mediaIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mediaId');
    });
  }

  QueryBuilder<GalleryHistory, String?, QQueryOperations> thumbUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbUrl');
    });
  }

  QueryBuilder<GalleryHistory, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<GalleryHistory, String?, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
