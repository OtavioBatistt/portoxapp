// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_checklist_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarChecklistEntityCollection on Isar {
  IsarCollection<IsarChecklistEntity> get isarChecklistEntitys =>
      getCollection();
}

const IsarChecklistEntitySchema = CollectionSchema(
  name: 'IsarChecklistEntity',
  schema:
      '{"name":"IsarChecklistEntity","idName":"id","properties":[{"name":"compartment","type":"Long"},{"name":"flowCode","type":"String"},{"name":"scheduleNumber","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'compartment': 0, 'flowCode': 1, 'scheduleNumber': 2},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarChecklistEntityGetId,
  setId: _isarChecklistEntitySetId,
  getLinks: _isarChecklistEntityGetLinks,
  attachLinks: _isarChecklistEntityAttachLinks,
  serializeNative: _isarChecklistEntitySerializeNative,
  deserializeNative: _isarChecklistEntityDeserializeNative,
  deserializePropNative: _isarChecklistEntityDeserializePropNative,
  serializeWeb: _isarChecklistEntitySerializeWeb,
  deserializeWeb: _isarChecklistEntityDeserializeWeb,
  deserializePropWeb: _isarChecklistEntityDeserializePropWeb,
  version: 3,
);

int? _isarChecklistEntityGetId(IsarChecklistEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarChecklistEntitySetId(IsarChecklistEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarChecklistEntityGetLinks(IsarChecklistEntity object) {
  return [];
}

void _isarChecklistEntitySerializeNative(
    IsarCollection<IsarChecklistEntity> collection,
    IsarRawObject rawObj,
    IsarChecklistEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.compartment;
  final _compartment = value0;
  final value1 = object.flowCode;
  IsarUint8List? _flowCode;
  if (value1 != null) {
    _flowCode = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_flowCode?.length ?? 0) as int;
  final value2 = object.scheduleNumber;
  IsarUint8List? _scheduleNumber;
  if (value2 != null) {
    _scheduleNumber = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_scheduleNumber?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _compartment);
  writer.writeBytes(offsets[1], _flowCode);
  writer.writeBytes(offsets[2], _scheduleNumber);
}

IsarChecklistEntity _isarChecklistEntityDeserializeNative(
    IsarCollection<IsarChecklistEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarChecklistEntity();
  object.compartment = reader.readLongOrNull(offsets[0]);
  object.flowCode = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.scheduleNumber = reader.readStringOrNull(offsets[2]);
  return object;
}

P _isarChecklistEntityDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarChecklistEntitySerializeWeb(
    IsarCollection<IsarChecklistEntity> collection,
    IsarChecklistEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'compartment', object.compartment);
  IsarNative.jsObjectSet(jsObj, 'flowCode', object.flowCode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'scheduleNumber', object.scheduleNumber);
  return jsObj;
}

IsarChecklistEntity _isarChecklistEntityDeserializeWeb(
    IsarCollection<IsarChecklistEntity> collection, dynamic jsObj) {
  final object = IsarChecklistEntity();
  object.compartment = IsarNative.jsObjectGet(jsObj, 'compartment');
  object.flowCode = IsarNative.jsObjectGet(jsObj, 'flowCode');
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.scheduleNumber = IsarNative.jsObjectGet(jsObj, 'scheduleNumber');
  return object;
}

P _isarChecklistEntityDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'compartment':
      return (IsarNative.jsObjectGet(jsObj, 'compartment')) as P;
    case 'flowCode':
      return (IsarNative.jsObjectGet(jsObj, 'flowCode')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'scheduleNumber':
      return (IsarNative.jsObjectGet(jsObj, 'scheduleNumber')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarChecklistEntityAttachLinks(
    IsarCollection col, int id, IsarChecklistEntity object) {}

extension IsarChecklistEntityQueryWhereSort
    on QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QWhere> {
  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarChecklistEntityQueryWhere
    on QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QWhereClause> {
  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterWhereClause>
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

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterWhereClause>
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

extension IsarChecklistEntityQueryFilter on QueryBuilder<IsarChecklistEntity,
    IsarChecklistEntity, QFilterCondition> {
  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      compartmentIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'compartment',
      value: null,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      compartmentEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'compartment',
      value: value,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      compartmentGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'compartment',
      value: value,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      compartmentLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'compartment',
      value: value,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      compartmentBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'compartment',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      flowCodeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'flowCode',
      value: null,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      flowCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'flowCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      flowCodeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'flowCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      flowCodeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'flowCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      flowCodeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'flowCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      flowCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'flowCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      flowCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'flowCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      flowCodeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'flowCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      flowCodeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'flowCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      scheduleNumberIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'scheduleNumber',
      value: null,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      scheduleNumberEqualTo(
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

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      scheduleNumberGreaterThan(
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

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      scheduleNumberLessThan(
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

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      scheduleNumberBetween(
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

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      scheduleNumberStartsWith(
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

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      scheduleNumberEndsWith(
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

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      scheduleNumberContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'scheduleNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterFilterCondition>
      scheduleNumberMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'scheduleNumber',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarChecklistEntityQueryLinks on QueryBuilder<IsarChecklistEntity,
    IsarChecklistEntity, QFilterCondition> {}

extension IsarChecklistEntityQueryWhereSortBy
    on QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QSortBy> {
  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      sortByCompartment() {
    return addSortByInternal('compartment', Sort.asc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      sortByCompartmentDesc() {
    return addSortByInternal('compartment', Sort.desc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      sortByFlowCode() {
    return addSortByInternal('flowCode', Sort.asc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      sortByFlowCodeDesc() {
    return addSortByInternal('flowCode', Sort.desc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      sortByScheduleNumber() {
    return addSortByInternal('scheduleNumber', Sort.asc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      sortByScheduleNumberDesc() {
    return addSortByInternal('scheduleNumber', Sort.desc);
  }
}

extension IsarChecklistEntityQueryWhereSortThenBy
    on QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QSortThenBy> {
  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      thenByCompartment() {
    return addSortByInternal('compartment', Sort.asc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      thenByCompartmentDesc() {
    return addSortByInternal('compartment', Sort.desc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      thenByFlowCode() {
    return addSortByInternal('flowCode', Sort.asc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      thenByFlowCodeDesc() {
    return addSortByInternal('flowCode', Sort.desc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      thenByScheduleNumber() {
    return addSortByInternal('scheduleNumber', Sort.asc);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QAfterSortBy>
      thenByScheduleNumberDesc() {
    return addSortByInternal('scheduleNumber', Sort.desc);
  }
}

extension IsarChecklistEntityQueryWhereDistinct
    on QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QDistinct> {
  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QDistinct>
      distinctByCompartment() {
    return addDistinctByInternal('compartment');
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QDistinct>
      distinctByFlowCode({bool caseSensitive = true}) {
    return addDistinctByInternal('flowCode', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QDistinct>
      distinctByScheduleNumber({bool caseSensitive = true}) {
    return addDistinctByInternal('scheduleNumber',
        caseSensitive: caseSensitive);
  }
}

extension IsarChecklistEntityQueryProperty
    on QueryBuilder<IsarChecklistEntity, IsarChecklistEntity, QQueryProperty> {
  QueryBuilder<IsarChecklistEntity, int?, QQueryOperations>
      compartmentProperty() {
    return addPropertyNameInternal('compartment');
  }

  QueryBuilder<IsarChecklistEntity, String?, QQueryOperations>
      flowCodeProperty() {
    return addPropertyNameInternal('flowCode');
  }

  QueryBuilder<IsarChecklistEntity, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarChecklistEntity, String?, QQueryOperations>
      scheduleNumberProperty() {
    return addPropertyNameInternal('scheduleNumber');
  }
}
