// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_credentials_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarCredentialsEntityCollection on Isar {
  IsarCollection<IsarCredentialsEntity> get isarCredentialsEntitys =>
      getCollection();
}

const IsarCredentialsEntitySchema = CollectionSchema(
  name: 'IsarCredentialsEntity',
  schema:
      '{"name":"IsarCredentialsEntity","idName":"id","properties":[{"name":"expirationDate","type":"String"},{"name":"token","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'expirationDate': 0, 'token': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarCredentialsEntityGetId,
  setId: _isarCredentialsEntitySetId,
  getLinks: _isarCredentialsEntityGetLinks,
  attachLinks: _isarCredentialsEntityAttachLinks,
  serializeNative: _isarCredentialsEntitySerializeNative,
  deserializeNative: _isarCredentialsEntityDeserializeNative,
  deserializePropNative: _isarCredentialsEntityDeserializePropNative,
  serializeWeb: _isarCredentialsEntitySerializeWeb,
  deserializeWeb: _isarCredentialsEntityDeserializeWeb,
  deserializePropWeb: _isarCredentialsEntityDeserializePropWeb,
  version: 3,
);

int? _isarCredentialsEntityGetId(IsarCredentialsEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarCredentialsEntitySetId(IsarCredentialsEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarCredentialsEntityGetLinks(
    IsarCredentialsEntity object) {
  return [];
}

void _isarCredentialsEntitySerializeNative(
    IsarCollection<IsarCredentialsEntity> collection,
    IsarRawObject rawObj,
    IsarCredentialsEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.expirationDate;
  IsarUint8List? _expirationDate;
  if (value0 != null) {
    _expirationDate = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_expirationDate?.length ?? 0) as int;
  final value1 = object.token;
  IsarUint8List? _token;
  if (value1 != null) {
    _token = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_token?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _expirationDate);
  writer.writeBytes(offsets[1], _token);
}

IsarCredentialsEntity _isarCredentialsEntityDeserializeNative(
    IsarCollection<IsarCredentialsEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarCredentialsEntity();
  object.expirationDate = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.token = reader.readStringOrNull(offsets[1]);
  return object;
}

P _isarCredentialsEntityDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarCredentialsEntitySerializeWeb(
    IsarCollection<IsarCredentialsEntity> collection,
    IsarCredentialsEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'expirationDate', object.expirationDate);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'token', object.token);
  return jsObj;
}

IsarCredentialsEntity _isarCredentialsEntityDeserializeWeb(
    IsarCollection<IsarCredentialsEntity> collection, dynamic jsObj) {
  final object = IsarCredentialsEntity();
  object.expirationDate = IsarNative.jsObjectGet(jsObj, 'expirationDate');
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.token = IsarNative.jsObjectGet(jsObj, 'token');
  return object;
}

P _isarCredentialsEntityDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'expirationDate':
      return (IsarNative.jsObjectGet(jsObj, 'expirationDate')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'token':
      return (IsarNative.jsObjectGet(jsObj, 'token')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarCredentialsEntityAttachLinks(
    IsarCollection col, int id, IsarCredentialsEntity object) {}

extension IsarCredentialsEntityQueryWhereSort
    on QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QWhere> {
  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterWhere>
      anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarCredentialsEntityQueryWhere on QueryBuilder<IsarCredentialsEntity,
    IsarCredentialsEntity, QWhereClause> {
  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterWhereClause>
      idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension IsarCredentialsEntityQueryFilter on QueryBuilder<
    IsarCredentialsEntity, IsarCredentialsEntity, QFilterCondition> {
  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> expirationDateIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'expirationDate',
      value: null,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> expirationDateEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'expirationDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> expirationDateGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'expirationDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> expirationDateLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'expirationDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> expirationDateBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'expirationDate',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> expirationDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'expirationDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> expirationDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'expirationDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
          QAfterFilterCondition>
      expirationDateContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'expirationDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
          QAfterFilterCondition>
      expirationDateMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'expirationDate',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> tokenIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'token',
      value: null,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> tokenEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> tokenGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> tokenLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> tokenBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'token',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> tokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
      QAfterFilterCondition> tokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
          QAfterFilterCondition>
      tokenContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity,
          QAfterFilterCondition>
      tokenMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'token',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarCredentialsEntityQueryLinks on QueryBuilder<IsarCredentialsEntity,
    IsarCredentialsEntity, QFilterCondition> {}

extension IsarCredentialsEntityQueryWhereSortBy
    on QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QSortBy> {
  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterSortBy>
      sortByExpirationDate() {
    return addSortByInternal('expirationDate', Sort.asc);
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterSortBy>
      sortByExpirationDateDesc() {
    return addSortByInternal('expirationDate', Sort.desc);
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterSortBy>
      sortByToken() {
    return addSortByInternal('token', Sort.asc);
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterSortBy>
      sortByTokenDesc() {
    return addSortByInternal('token', Sort.desc);
  }
}

extension IsarCredentialsEntityQueryWhereSortThenBy
    on QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QSortThenBy> {
  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterSortBy>
      thenByExpirationDate() {
    return addSortByInternal('expirationDate', Sort.asc);
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterSortBy>
      thenByExpirationDateDesc() {
    return addSortByInternal('expirationDate', Sort.desc);
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterSortBy>
      thenByToken() {
    return addSortByInternal('token', Sort.asc);
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QAfterSortBy>
      thenByTokenDesc() {
    return addSortByInternal('token', Sort.desc);
  }
}

extension IsarCredentialsEntityQueryWhereDistinct
    on QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QDistinct> {
  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QDistinct>
      distinctByExpirationDate({bool caseSensitive = true}) {
    return addDistinctByInternal('expirationDate',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarCredentialsEntity, IsarCredentialsEntity, QDistinct>
      distinctByToken({bool caseSensitive = true}) {
    return addDistinctByInternal('token', caseSensitive: caseSensitive);
  }
}

extension IsarCredentialsEntityQueryProperty on QueryBuilder<
    IsarCredentialsEntity, IsarCredentialsEntity, QQueryProperty> {
  QueryBuilder<IsarCredentialsEntity, String?, QQueryOperations>
      expirationDateProperty() {
    return addPropertyNameInternal('expirationDate');
  }

  QueryBuilder<IsarCredentialsEntity, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarCredentialsEntity, String?, QQueryOperations>
      tokenProperty() {
    return addPropertyNameInternal('token');
  }
}
