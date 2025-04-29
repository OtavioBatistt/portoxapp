// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_schedule_driver_phone_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarScheduleDriverPhoneEntityCollection on Isar {
  IsarCollection<IsarScheduleDriverPhoneEntity>
      get isarScheduleDriverPhoneEntitys => getCollection();
}

const IsarScheduleDriverPhoneEntitySchema = CollectionSchema(
  name: 'IsarScheduleDriverPhoneEntity',
  schema:
      '{"name":"IsarScheduleDriverPhoneEntity","idName":"id","properties":[{"name":"driverPhone","type":"String"},{"name":"messageCount","type":"Long"},{"name":"scheduleNumber","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'driverPhone': 0, 'messageCount': 1, 'scheduleNumber': 2},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarScheduleDriverPhoneEntityGetId,
  setId: _isarScheduleDriverPhoneEntitySetId,
  getLinks: _isarScheduleDriverPhoneEntityGetLinks,
  attachLinks: _isarScheduleDriverPhoneEntityAttachLinks,
  serializeNative: _isarScheduleDriverPhoneEntitySerializeNative,
  deserializeNative: _isarScheduleDriverPhoneEntityDeserializeNative,
  deserializePropNative: _isarScheduleDriverPhoneEntityDeserializePropNative,
  serializeWeb: _isarScheduleDriverPhoneEntitySerializeWeb,
  deserializeWeb: _isarScheduleDriverPhoneEntityDeserializeWeb,
  deserializePropWeb: _isarScheduleDriverPhoneEntityDeserializePropWeb,
  version: 3,
);

int? _isarScheduleDriverPhoneEntityGetId(IsarScheduleDriverPhoneEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarScheduleDriverPhoneEntitySetId(
    IsarScheduleDriverPhoneEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarScheduleDriverPhoneEntityGetLinks(
    IsarScheduleDriverPhoneEntity object) {
  return [];
}

void _isarScheduleDriverPhoneEntitySerializeNative(
    IsarCollection<IsarScheduleDriverPhoneEntity> collection,
    IsarRawObject rawObj,
    IsarScheduleDriverPhoneEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.driverPhone;
  IsarUint8List? _driverPhone;
  if (value0 != null) {
    _driverPhone = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_driverPhone?.length ?? 0) as int;
  final value1 = object.messageCount;
  final _messageCount = value1;
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
  writer.writeBytes(offsets[0], _driverPhone);
  writer.writeLong(offsets[1], _messageCount);
  writer.writeBytes(offsets[2], _scheduleNumber);
}

IsarScheduleDriverPhoneEntity _isarScheduleDriverPhoneEntityDeserializeNative(
    IsarCollection<IsarScheduleDriverPhoneEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarScheduleDriverPhoneEntity();
  object.driverPhone = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.messageCount = reader.readLongOrNull(offsets[1]);
  object.scheduleNumber = reader.readStringOrNull(offsets[2]);
  return object;
}

P _isarScheduleDriverPhoneEntityDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarScheduleDriverPhoneEntitySerializeWeb(
    IsarCollection<IsarScheduleDriverPhoneEntity> collection,
    IsarScheduleDriverPhoneEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'driverPhone', object.driverPhone);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'messageCount', object.messageCount);
  IsarNative.jsObjectSet(jsObj, 'scheduleNumber', object.scheduleNumber);
  return jsObj;
}

IsarScheduleDriverPhoneEntity _isarScheduleDriverPhoneEntityDeserializeWeb(
    IsarCollection<IsarScheduleDriverPhoneEntity> collection, dynamic jsObj) {
  final object = IsarScheduleDriverPhoneEntity();
  object.driverPhone = IsarNative.jsObjectGet(jsObj, 'driverPhone');
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.messageCount = IsarNative.jsObjectGet(jsObj, 'messageCount');
  object.scheduleNumber = IsarNative.jsObjectGet(jsObj, 'scheduleNumber');
  return object;
}

P _isarScheduleDriverPhoneEntityDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'driverPhone':
      return (IsarNative.jsObjectGet(jsObj, 'driverPhone')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'messageCount':
      return (IsarNative.jsObjectGet(jsObj, 'messageCount')) as P;
    case 'scheduleNumber':
      return (IsarNative.jsObjectGet(jsObj, 'scheduleNumber')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarScheduleDriverPhoneEntityAttachLinks(
    IsarCollection col, int id, IsarScheduleDriverPhoneEntity object) {}

extension IsarScheduleDriverPhoneEntityQueryWhereSort on QueryBuilder<
    IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity, QWhere> {
  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarScheduleDriverPhoneEntityQueryWhere on QueryBuilder<
    IsarScheduleDriverPhoneEntity,
    IsarScheduleDriverPhoneEntity,
    QWhereClause> {
  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
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

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterWhereClause> idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterWhereClause> idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
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

extension IsarScheduleDriverPhoneEntityQueryFilter on QueryBuilder<
    IsarScheduleDriverPhoneEntity,
    IsarScheduleDriverPhoneEntity,
    QFilterCondition> {
  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> driverPhoneIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'driverPhone',
      value: null,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> driverPhoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'driverPhone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> driverPhoneGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'driverPhone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> driverPhoneLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'driverPhone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> driverPhoneBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'driverPhone',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> driverPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'driverPhone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> driverPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'driverPhone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
          QAfterFilterCondition>
      driverPhoneContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'driverPhone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
          QAfterFilterCondition>
      driverPhoneMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'driverPhone',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
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

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
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

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
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

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> messageCountIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'messageCount',
      value: null,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> messageCountEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'messageCount',
      value: value,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> messageCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'messageCount',
      value: value,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> messageCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'messageCount',
      value: value,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> messageCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'messageCount',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterFilterCondition> scheduleNumberIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'scheduleNumber',
      value: null,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
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

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
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

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
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

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
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

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
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

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
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

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
          QAfterFilterCondition>
      scheduleNumberContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'scheduleNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
          QAfterFilterCondition>
      scheduleNumberMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'scheduleNumber',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarScheduleDriverPhoneEntityQueryLinks on QueryBuilder<
    IsarScheduleDriverPhoneEntity,
    IsarScheduleDriverPhoneEntity,
    QFilterCondition> {}

extension IsarScheduleDriverPhoneEntityQueryWhereSortBy on QueryBuilder<
    IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity, QSortBy> {
  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> sortByDriverPhone() {
    return addSortByInternal('driverPhone', Sort.asc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> sortByDriverPhoneDesc() {
    return addSortByInternal('driverPhone', Sort.desc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> sortByMessageCount() {
    return addSortByInternal('messageCount', Sort.asc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> sortByMessageCountDesc() {
    return addSortByInternal('messageCount', Sort.desc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> sortByScheduleNumber() {
    return addSortByInternal('scheduleNumber', Sort.asc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> sortByScheduleNumberDesc() {
    return addSortByInternal('scheduleNumber', Sort.desc);
  }
}

extension IsarScheduleDriverPhoneEntityQueryWhereSortThenBy on QueryBuilder<
    IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity, QSortThenBy> {
  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> thenByDriverPhone() {
    return addSortByInternal('driverPhone', Sort.asc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> thenByDriverPhoneDesc() {
    return addSortByInternal('driverPhone', Sort.desc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> thenByMessageCount() {
    return addSortByInternal('messageCount', Sort.asc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> thenByMessageCountDesc() {
    return addSortByInternal('messageCount', Sort.desc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> thenByScheduleNumber() {
    return addSortByInternal('scheduleNumber', Sort.asc);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QAfterSortBy> thenByScheduleNumberDesc() {
    return addSortByInternal('scheduleNumber', Sort.desc);
  }
}

extension IsarScheduleDriverPhoneEntityQueryWhereDistinct on QueryBuilder<
    IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity, QDistinct> {
  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QDistinct> distinctByDriverPhone({bool caseSensitive = true}) {
    return addDistinctByInternal('driverPhone', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QDistinct> distinctByMessageCount() {
    return addDistinctByInternal('messageCount');
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, IsarScheduleDriverPhoneEntity,
      QDistinct> distinctByScheduleNumber({bool caseSensitive = true}) {
    return addDistinctByInternal('scheduleNumber',
        caseSensitive: caseSensitive);
  }
}

extension IsarScheduleDriverPhoneEntityQueryProperty on QueryBuilder<
    IsarScheduleDriverPhoneEntity,
    IsarScheduleDriverPhoneEntity,
    QQueryProperty> {
  QueryBuilder<IsarScheduleDriverPhoneEntity, String?, QQueryOperations>
      driverPhoneProperty() {
    return addPropertyNameInternal('driverPhone');
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, int, QQueryOperations>
      idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, int?, QQueryOperations>
      messageCountProperty() {
    return addPropertyNameInternal('messageCount');
  }

  QueryBuilder<IsarScheduleDriverPhoneEntity, String?, QQueryOperations>
      scheduleNumberProperty() {
    return addPropertyNameInternal('scheduleNumber');
  }
}
