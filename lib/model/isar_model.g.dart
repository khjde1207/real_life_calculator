// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings

extension GetSettingIsarCollection on Isar {
  IsarCollection<SettingIsar> get settingIsars => getCollection();
}

const SettingIsarSchema = CollectionSchema(
  name: r'SettingIsar',
  schema:
      r'{"name":"SettingIsar","idName":"id","properties":[{"name":"regPages","type":"LongList"}],"indexes":[],"links":[]}',
  idName: r'id',
  propertyIds: {r'regPages': 0},
  listProperties: {r'regPages'},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _settingIsarGetId,
  setId: _settingIsarSetId,
  getLinks: _settingIsarGetLinks,
  attachLinks: _settingIsarAttachLinks,
  serializeNative: _settingIsarSerializeNative,
  deserializeNative: _settingIsarDeserializeNative,
  deserializePropNative: _settingIsarDeserializePropNative,
  serializeWeb: _settingIsarSerializeWeb,
  deserializeWeb: _settingIsarDeserializeWeb,
  deserializePropWeb: _settingIsarDeserializePropWeb,
  version: 4,
);

int? _settingIsarGetId(SettingIsar object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _settingIsarSetId(SettingIsar object, int id) {
  object.id = id;
}

List<IsarLinkBase<dynamic>> _settingIsarGetLinks(SettingIsar object) {
  return [];
}

void _settingIsarSerializeNative(
    IsarCollection<SettingIsar> collection,
    IsarCObject cObj,
    SettingIsar object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final size = (staticSize + (object.regPages.length) * 8) as int;
  cObj.buffer = alloc(size);
  cObj.buffer_length = size;

  final buffer = IsarNative.bufAsBytes(cObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeHeader();
  writer.writeLongList(offsets[0], object.regPages);
}

SettingIsar _settingIsarDeserializeNative(
    IsarCollection<SettingIsar> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = SettingIsar();
  object.id = id;
  object.regPages = reader.readLongList(offsets[0]) ?? [];
  return object;
}

P _settingIsarDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Illegal propertyIndex');
  }
}

Object _settingIsarSerializeWeb(
    IsarCollection<SettingIsar> collection, SettingIsar object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, r'id', object.id);
  IsarNative.jsObjectSet(jsObj, r'regPages', object.regPages);
  return jsObj;
}

SettingIsar _settingIsarDeserializeWeb(
    IsarCollection<SettingIsar> collection, Object jsObj) {
  final object = SettingIsar();
  object.id =
      IsarNative.jsObjectGet(jsObj, r'id') ?? (double.negativeInfinity as int);
  object.regPages = (IsarNative.jsObjectGet(jsObj, r'regPages') as List?)
          ?.map((e) => e ?? (double.negativeInfinity as int))
          .toList()
          .cast<int>() ??
      [];
  return object;
}

P _settingIsarDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case r'id':
      return (IsarNative.jsObjectGet(jsObj, r'id') ??
          (double.negativeInfinity as int)) as P;
    case r'regPages':
      return ((IsarNative.jsObjectGet(jsObj, r'regPages') as List?)
              ?.map((e) => e ?? (double.negativeInfinity as int))
              .toList()
              .cast<int>() ??
          []) as P;
    default:
      throw IsarError('Illegal propertyName');
  }
}

void _settingIsarAttachLinks(
    IsarCollection<dynamic> col, int id, SettingIsar object) {}

extension SettingIsarQueryWhereSort
    on QueryBuilder<SettingIsar, SettingIsar, QWhere> {
  QueryBuilder<SettingIsar, SettingIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingIsarQueryWhere
    on QueryBuilder<SettingIsar, SettingIsar, QWhereClause> {
  QueryBuilder<SettingIsar, SettingIsar, QAfterWhereClause> idEqualTo(int id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SettingIsar, SettingIsar, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SettingIsar, SettingIsar, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SettingIsar, SettingIsar, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SettingIsar, SettingIsar, QAfterWhereClause> idBetween(
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
}

extension SettingIsarQueryFilter
    on QueryBuilder<SettingIsar, SettingIsar, QFilterCondition> {
  QueryBuilder<SettingIsar, SettingIsar, QAfterFilterCondition> idEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingIsar, SettingIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SettingIsar, SettingIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SettingIsar, SettingIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SettingIsar, SettingIsar, QAfterFilterCondition>
      regPagesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'regPages',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingIsar, SettingIsar, QAfterFilterCondition>
      regPagesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'regPages',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingIsar, SettingIsar, QAfterFilterCondition>
      regPagesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'regPages',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingIsar, SettingIsar, QAfterFilterCondition>
      regPagesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'regPages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingIsarQueryLinks
    on QueryBuilder<SettingIsar, SettingIsar, QFilterCondition> {}

extension SettingIsarQueryWhereSortBy
    on QueryBuilder<SettingIsar, SettingIsar, QSortBy> {}

extension SettingIsarQueryWhereSortThenBy
    on QueryBuilder<SettingIsar, SettingIsar, QSortThenBy> {
  QueryBuilder<SettingIsar, SettingIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SettingIsar, SettingIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension SettingIsarQueryWhereDistinct
    on QueryBuilder<SettingIsar, SettingIsar, QDistinct> {
  QueryBuilder<SettingIsar, SettingIsar, QDistinct> distinctByRegPages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'regPages');
    });
  }
}

extension SettingIsarQueryProperty
    on QueryBuilder<SettingIsar, SettingIsar, QQueryProperty> {
  QueryBuilder<SettingIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SettingIsar, List<int>, QQueryOperations> regPagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'regPages');
    });
  }
}
