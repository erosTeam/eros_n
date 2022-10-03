// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetGalleryHistoryCollection on Isar {
  IsarCollection<GalleryHistory> get galleryHistorys => this.collection();
}

const GalleryHistorySchema = CollectionSchema(
  name: r'GalleryHistory',
  id: -2235609206467228336,
  properties: {
    r'csrfToken': PropertySchema(
      id: 0,
      name: r'csrfToken',
      type: IsarType.string,
    ),
    r'japaneseTitle': PropertySchema(
      id: 1,
      name: r'japaneseTitle',
      type: IsarType.string,
    ),
    r'lastReadTime': PropertySchema(
      id: 2,
      name: r'lastReadTime',
      type: IsarType.long,
    ),
    r'mediaId': PropertySchema(
      id: 3,
      name: r'mediaId',
      type: IsarType.string,
    ),
    r'thumbHeight': PropertySchema(
      id: 4,
      name: r'thumbHeight',
      type: IsarType.long,
    ),
    r'thumbUrl': PropertySchema(
      id: 5,
      name: r'thumbUrl',
      type: IsarType.string,
    ),
    r'thumbWidth': PropertySchema(
      id: 6,
      name: r'thumbWidth',
      type: IsarType.long,
    ),
    r'title': PropertySchema(
      id: 7,
      name: r'title',
      type: IsarType.string,
    ),
    r'url': PropertySchema(
      id: 8,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _galleryHistoryEstimateSize,
  serialize: _galleryHistorySerialize,
  deserialize: _galleryHistoryDeserialize,
  deserializeProp: _galleryHistoryDeserializeProp,
  idName: r'gid',
  indexes: {
    r'lastReadTime': IndexSchema(
      id: -6238597228386762325,
      name: r'lastReadTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'lastReadTime',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _galleryHistoryGetId,
  getLinks: _galleryHistoryGetLinks,
  attach: _galleryHistoryAttach,
  version: '3.0.1',
);

int _galleryHistoryEstimateSize(
  GalleryHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.csrfToken;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.japaneseTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mediaId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.thumbUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _galleryHistorySerialize(
  GalleryHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.csrfToken);
  writer.writeString(offsets[1], object.japaneseTitle);
  writer.writeLong(offsets[2], object.lastReadTime);
  writer.writeString(offsets[3], object.mediaId);
  writer.writeLong(offsets[4], object.thumbHeight);
  writer.writeString(offsets[5], object.thumbUrl);
  writer.writeLong(offsets[6], object.thumbWidth);
  writer.writeString(offsets[7], object.title);
  writer.writeString(offsets[8], object.url);
}

GalleryHistory _galleryHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GalleryHistory();
  object.csrfToken = reader.readStringOrNull(offsets[0]);
  object.gid = id;
  object.japaneseTitle = reader.readStringOrNull(offsets[1]);
  object.lastReadTime = reader.readLongOrNull(offsets[2]);
  object.mediaId = reader.readStringOrNull(offsets[3]);
  object.thumbHeight = reader.readLongOrNull(offsets[4]);
  object.thumbUrl = reader.readStringOrNull(offsets[5]);
  object.thumbWidth = reader.readLongOrNull(offsets[6]);
  object.title = reader.readStringOrNull(offsets[7]);
  object.url = reader.readStringOrNull(offsets[8]);
  return object;
}

P _galleryHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _galleryHistoryGetId(GalleryHistory object) {
  return object.gid ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _galleryHistoryGetLinks(GalleryHistory object) {
  return [];
}

void _galleryHistoryAttach(
    IsarCollection<dynamic> col, Id id, GalleryHistory object) {
  object.gid = id;
}

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
      Id gid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: gid,
        upper: gid,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause> gidNotEqualTo(
      Id gid) {
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
      gidGreaterThan(Id gid, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: gid, includeLower: include),
      );
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause> gidLessThan(
      Id gid,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: gid, includeUpper: include),
      );
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterWhereClause> gidBetween(
    Id lowerGid,
    Id upperGid, {
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
      csrfTokenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'csrfToken',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      csrfTokenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
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
    bool include = false,
    bool caseSensitive = true,
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
    bool include = false,
    bool caseSensitive = true,
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
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
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
      csrfTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'csrfToken',
        value: '',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      csrfTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'csrfToken',
        value: '',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      gidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gid',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      gidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gid',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      gidEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gid',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      gidGreaterThan(
    Id? value, {
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
    Id? value, {
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
    Id? lower,
    Id? upper, {
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
      japaneseTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
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
    bool include = false,
    bool caseSensitive = true,
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
    bool include = false,
    bool caseSensitive = true,
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
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
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
      japaneseTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'japaneseTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      japaneseTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'japaneseTitle',
        value: '',
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
      lastReadTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
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
      mediaIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
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
    bool include = false,
    bool caseSensitive = true,
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
    bool include = false,
    bool caseSensitive = true,
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
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
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
      mediaIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mediaId',
        value: '',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      mediaIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mediaId',
        value: '',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbHeightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thumbHeight',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbHeightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thumbHeight',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbHeightEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbHeight',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbHeightGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thumbHeight',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbHeightLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thumbHeight',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbHeightBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thumbHeight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
      thumbUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
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
    bool include = false,
    bool caseSensitive = true,
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
    bool include = false,
    bool caseSensitive = true,
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
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
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
      thumbUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thumbUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbWidthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thumbWidth',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbWidthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thumbWidth',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbWidthEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbWidth',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbWidthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thumbWidth',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbWidthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thumbWidth',
        value: value,
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      thumbWidthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thumbWidth',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
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
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
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
    bool include = false,
    bool caseSensitive = true,
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
    bool include = false,
    bool caseSensitive = true,
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
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
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
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
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
      urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
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
    bool include = false,
    bool caseSensitive = true,
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
    bool include = false,
    bool caseSensitive = true,
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
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
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

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension GalleryHistoryQueryObject
    on QueryBuilder<GalleryHistory, GalleryHistory, QFilterCondition> {}

extension GalleryHistoryQueryLinks
    on QueryBuilder<GalleryHistory, GalleryHistory, QFilterCondition> {}

extension GalleryHistoryQuerySortBy
    on QueryBuilder<GalleryHistory, GalleryHistory, QSortBy> {
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

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByThumbHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbHeight', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByThumbHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbHeight', Sort.desc);
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

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByThumbWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbWidth', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      sortByThumbWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbWidth', Sort.desc);
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

extension GalleryHistoryQuerySortThenBy
    on QueryBuilder<GalleryHistory, GalleryHistory, QSortThenBy> {
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

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByThumbHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbHeight', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByThumbHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbHeight', Sort.desc);
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

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByThumbWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbWidth', Sort.asc);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QAfterSortBy>
      thenByThumbWidthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbWidth', Sort.desc);
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

  QueryBuilder<GalleryHistory, GalleryHistory, QDistinct>
      distinctByThumbHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbHeight');
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QDistinct> distinctByThumbUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GalleryHistory, GalleryHistory, QDistinct>
      distinctByThumbWidth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbWidth');
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

  QueryBuilder<GalleryHistory, int?, QQueryOperations> thumbHeightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbHeight');
    });
  }

  QueryBuilder<GalleryHistory, String?, QQueryOperations> thumbUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbUrl');
    });
  }

  QueryBuilder<GalleryHistory, int?, QQueryOperations> thumbWidthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbWidth');
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
