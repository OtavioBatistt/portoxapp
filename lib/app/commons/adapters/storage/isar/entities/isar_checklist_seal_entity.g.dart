// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_checklist_seal_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarChecklistSealEntityCollection on Isar {
  IsarCollection<IsarChecklistSealEntity> get isarChecklistSealEntitys =>
      getCollection();
}

const IsarChecklistSealEntitySchema = CollectionSchema(
  name: 'IsarChecklistSealEntity',
  schema:
      '{"name":"IsarChecklistSealEntity","idName":"id","properties":[{"name":"scheduleNumber","type":"String"},{"name":"sealCode","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'scheduleNumber': 0, 'sealCode': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarChecklistSealEntityGetId,
  setId: _isarChecklistSealEntitySetId,
  getLinks: _isarChecklistSealEntityGetLinks,
  attachLinks: _isarChecklistSealEntityAttachLinks,
  serializeNative: _isarChecklistSealEntitySerializeNative,
  deserializeNative: _isarChecklistSealEntityDeserializeNative,
  deserializePropNative: _isarChecklistSealEntityDeserializePropNative,
  serializeWeb: _isarChecklistSealEntitySerializeWeb,
  deserializeWeb: _isarChecklistSealEntityDeserializeWeb,
  deserializePropWeb: _isarChecklistSealEntityDeserializePropWeb,
  version: 3,
);

int? _isarChecklistSealEntityGetId(IsarChecklistSealEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarChecklistSealEntitySetId(IsarChecklistSealEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarChecklistSealEntityGetLinks(
    IsarChecklistSealEntity object) {
  return [];
}

void _isarChecklistSealEntitySerializeNative(
    IsarCollection<IsarChecklistSealEntity> collection,
    IsarRawObject rawObj,
    IsarChecklistSealEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.scheduleNumber;
  IsarUint8List? _scheduleNumber;
  if (value0 != null) {
    _scheduleNumber = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_scheduleNumber?.length ?? 0) as int;
  final value1 = object.sealCode;
  IsarUint8List? _sealCode;
  if (value1 != null) {
    _sealCode = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_sealCode?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _scheduleNumber);
  writer.writeBytes(offsets[1], _sealCode);
}

IsarChecklistSealEntity _isarChecklistSealEntityDeserializeNative(
    IsarCollection<IsarChecklistSealEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarChecklistSealEntity();
  object.id = id;
  object.scheduleNumber = reader.readStringOrNull(offsets[0]);
  object.sealCode = reader.readStringOrNull(offsets[1]);
  return object;
}

P _isarChecklistSealEntityDeserializePropNative<P>(
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

dynamic _isarChecklistSealEntitySerializeWeb(
    IsarCollection<IsarChecklistSealEntity> collection,
    IsarChecklistSealEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'scheduleNumber', object.scheduleNumber);
  IsarNative.jsObjectSet(jsObj, 'sealCode', object.sealCode);
  return jsObj;
}

IsarChecklistSealEntity _isarChecklistSealEntityDeserializeWeb(
    IsarCollection<IsarChecklistSealEntity> collection, dynamic jsObj) {
  final object = IsarChecklistSealEntity();
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.scheduleNumber = IsarNative.jsObjectGet(jsObj, 'scheduleNumber');
  object.sealCode = IsarNative.jsObjectGet(jsObj, 'sealCode');
  return object;
}

P _isarChecklistSealEntityDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'scheduleNumber':
      return (IsarNative.jsObjectGet(jsObj, 'scheduleNumber')) as P;
    case 'sealCode':
      return (IsarNative.jsObjectGet(jsObj, 'sealCode')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarChecklistSealEntityAttachLinks(
    IsarCollection col, int id, IsarChecklistSealEntity object) {}

extension IsarChecklistSealEntityQueryWhereSort
    on QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QWhere> {
  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterWhere>
      anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarChecklistSealEntityQueryWhere on QueryBuilder<
    IsarChecklistSealEntity, IsarChecklistSealEntity, QWhereClause> {
  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterWhereClause> idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterWhereClause> idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterWhereClause> idBetween(
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

extension IsarChecklistSealEntityQueryFilter on QueryBuilder<
    IsarChecklistSealEntity, IsarChecklistSealEntity, QFilterCondition> {
  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
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

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
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

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
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

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> scheduleNumberIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'scheduleNumber',
      value: null,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> scheduleNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'scheduleNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> scheduleNumberGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'scheduleNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> scheduleNumberLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'scheduleNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> scheduleNumberBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'scheduleNumber',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> scheduleNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'scheduleNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> scheduleNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'scheduleNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
          QAfterFilterCondition>
      scheduleNumberContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'scheduleNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
          QAfterFilterCondition>
      scheduleNumberMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'scheduleNumber',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> sealCodeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'sealCode',
      value: null,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> sealCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sealCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> sealCodeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sealCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> sealCodeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sealCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> sealCodeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sealCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> sealCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'sealCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
      QAfterFilterCondition> sealCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'sealCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
          QAfterFilterCondition>
      sealCodeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'sealCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity,
          QAfterFilterCondition>
      sealCodeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'sealCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarChecklistSealEntityQueryLinks on QueryBuilder<
    IsarChecklistSealEntity, IsarChecklistSealEntity, QFilterCondition> {}

extension IsarChecklistSealEntityQueryWhereSortBy
    on QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QSortBy> {
  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterSortBy>
      sortByScheduleNumber() {
    return addSortByInternal('scheduleNumber', Sort.asc);
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterSortBy>
      sortByScheduleNumberDesc() {
    return addSortByInternal('scheduleNumber', Sort.desc);
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterSortBy>
      sortBySealCode() {
    return addSortByInternal('sealCode', Sort.asc);
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterSortBy>
      sortBySealCodeDesc() {
    return addSortByInternal('sealCode', Sort.desc);
  }
}

extension IsarChecklistSealEntityQueryWhereSortThenBy on QueryBuilder<
    IsarChecklistSealEntity, IsarChecklistSealEntity, QSortThenBy> {
  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterSortBy>
      thenByScheduleNumber() {
    return addSortByInternal('scheduleNumber', Sort.asc);
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterSortBy>
      thenByScheduleNumberDesc() {
    return addSortByInternal('scheduleNumber', Sort.desc);
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterSortBy>
      thenBySealCode() {
    return addSortByInternal('sealCode', Sort.asc);
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QAfterSortBy>
      thenBySealCodeDesc() {
    return addSortByInternal('sealCode', Sort.desc);
  }
}

extension IsarChecklistSealEntityQueryWhereDistinct on QueryBuilder<
    IsarChecklistSealEntity, IsarChecklistSealEntity, QDistinct> {
  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QDistinct>
      distinctByScheduleNumber({bool caseSensitive = true}) {
    return addDistinctByInternal('scheduleNumber',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarChecklistSealEntity, IsarChecklistSealEntity, QDistinct>
      distinctBySealCode({bool caseSensitive = true}) {
    return addDistinctByInternal('sealCode', caseSensitive: caseSensitive);
  }
}

extension IsarChecklistSealEntityQueryProperty on QueryBuilder<
    IsarChecklistSealEntity, IsarChecklistSealEntity, QQueryProperty> {
  QueryBuilder<IsarChecklistSealEntity, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarChecklistSealEntity, String?, QQueryOperations>
      scheduleNumberProperty() {
    return addPropertyNameInternal('scheduleNumber');
  }

  QueryBuilder<IsarChecklistSealEntity, String?, QQueryOperations>
      sealCodeProperty() {
    return addPropertyNameInternal('sealCode');
  }
}
