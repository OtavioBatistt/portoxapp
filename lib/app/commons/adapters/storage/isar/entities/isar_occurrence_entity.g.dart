// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_occurrence_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarOccurrenceEntityCollection on Isar {
  IsarCollection<IsarOccurrenceEntity> get isarOccurrenceEntitys =>
      getCollection();
}

const IsarOccurrenceEntitySchema = CollectionSchema(
  name: 'IsarOccurrenceEntity',
  schema:
      '{"name":"IsarOccurrenceEntity","idName":"id","properties":[{"name":"comments","type":"String"},{"name":"createdAt","type":"String"},{"name":"lineId","type":"Long"},{"name":"rncNumber","type":"String"},{"name":"scheduleNumber","type":"String"},{"name":"token","type":"String"},{"name":"type","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'comments': 0,
    'createdAt': 1,
    'lineId': 2,
    'rncNumber': 3,
    'scheduleNumber': 4,
    'token': 5,
    'type': 6
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarOccurrenceEntityGetId,
  setId: _isarOccurrenceEntitySetId,
  getLinks: _isarOccurrenceEntityGetLinks,
  attachLinks: _isarOccurrenceEntityAttachLinks,
  serializeNative: _isarOccurrenceEntitySerializeNative,
  deserializeNative: _isarOccurrenceEntityDeserializeNative,
  deserializePropNative: _isarOccurrenceEntityDeserializePropNative,
  serializeWeb: _isarOccurrenceEntitySerializeWeb,
  deserializeWeb: _isarOccurrenceEntityDeserializeWeb,
  deserializePropWeb: _isarOccurrenceEntityDeserializePropWeb,
  version: 3,
);

int? _isarOccurrenceEntityGetId(IsarOccurrenceEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarOccurrenceEntitySetId(IsarOccurrenceEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarOccurrenceEntityGetLinks(IsarOccurrenceEntity object) {
  return [];
}

void _isarOccurrenceEntitySerializeNative(
    IsarCollection<IsarOccurrenceEntity> collection,
    IsarRawObject rawObj,
    IsarOccurrenceEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.comments;
  IsarUint8List? _comments;
  if (value0 != null) {
    _comments = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_comments?.length ?? 0) as int;
  final value1 = object.createdAt;
  IsarUint8List? _createdAt;
  if (value1 != null) {
    _createdAt = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_createdAt?.length ?? 0) as int;
  final value2 = object.lineId;
  final _lineId = value2;
  final value3 = object.rncNumber;
  IsarUint8List? _rncNumber;
  if (value3 != null) {
    _rncNumber = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_rncNumber?.length ?? 0) as int;
  final value4 = object.scheduleNumber;
  IsarUint8List? _scheduleNumber;
  if (value4 != null) {
    _scheduleNumber = IsarBinaryWriter.utf8Encoder.convert(value4);
  }
  dynamicSize += (_scheduleNumber?.length ?? 0) as int;
  final value5 = object.token;
  IsarUint8List? _token;
  if (value5 != null) {
    _token = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_token?.length ?? 0) as int;
  final value6 = object.type;
  IsarUint8List? _type;
  if (value6 != null) {
    _type = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (_type?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _comments);
  writer.writeBytes(offsets[1], _createdAt);
  writer.writeLong(offsets[2], _lineId);
  writer.writeBytes(offsets[3], _rncNumber);
  writer.writeBytes(offsets[4], _scheduleNumber);
  writer.writeBytes(offsets[5], _token);
  writer.writeBytes(offsets[6], _type);
}

IsarOccurrenceEntity _isarOccurrenceEntityDeserializeNative(
    IsarCollection<IsarOccurrenceEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarOccurrenceEntity();
  object.comments = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.lineId = reader.readLongOrNull(offsets[2]);
  object.rncNumber = reader.readStringOrNull(offsets[3]);
  object.scheduleNumber = reader.readStringOrNull(offsets[4]);
  object.token = reader.readStringOrNull(offsets[5]);
  object.type = reader.readStringOrNull(offsets[6]);
  return object;
}

P _isarOccurrenceEntityDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarOccurrenceEntitySerializeWeb(
    IsarCollection<IsarOccurrenceEntity> collection,
    IsarOccurrenceEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'comments', object.comments);
  IsarNative.jsObjectSet(jsObj, 'createdAt', object.createdAt);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'lineId', object.lineId);
  IsarNative.jsObjectSet(jsObj, 'rncNumber', object.rncNumber);
  IsarNative.jsObjectSet(jsObj, 'scheduleNumber', object.scheduleNumber);
  IsarNative.jsObjectSet(jsObj, 'token', object.token);
  IsarNative.jsObjectSet(jsObj, 'type', object.type);
  return jsObj;
}

IsarOccurrenceEntity _isarOccurrenceEntityDeserializeWeb(
    IsarCollection<IsarOccurrenceEntity> collection, dynamic jsObj) {
  final object = IsarOccurrenceEntity();
  object.comments = IsarNative.jsObjectGet(jsObj, 'comments');
  object.createdAt = IsarNative.jsObjectGet(jsObj, 'createdAt');
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.lineId = IsarNative.jsObjectGet(jsObj, 'lineId');
  object.rncNumber = IsarNative.jsObjectGet(jsObj, 'rncNumber');
  object.scheduleNumber = IsarNative.jsObjectGet(jsObj, 'scheduleNumber');
  object.token = IsarNative.jsObjectGet(jsObj, 'token');
  object.type = IsarNative.jsObjectGet(jsObj, 'type');
  return object;
}

P _isarOccurrenceEntityDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'comments':
      return (IsarNative.jsObjectGet(jsObj, 'comments')) as P;
    case 'createdAt':
      return (IsarNative.jsObjectGet(jsObj, 'createdAt')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'lineId':
      return (IsarNative.jsObjectGet(jsObj, 'lineId')) as P;
    case 'rncNumber':
      return (IsarNative.jsObjectGet(jsObj, 'rncNumber')) as P;
    case 'scheduleNumber':
      return (IsarNative.jsObjectGet(jsObj, 'scheduleNumber')) as P;
    case 'token':
      return (IsarNative.jsObjectGet(jsObj, 'token')) as P;
    case 'type':
      return (IsarNative.jsObjectGet(jsObj, 'type')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarOccurrenceEntityAttachLinks(
    IsarCollection col, int id, IsarOccurrenceEntity object) {}

extension IsarOccurrenceEntityQueryWhereSort
    on QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QWhere> {
  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterWhere>
      anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarOccurrenceEntityQueryWhere
    on QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QWhereClause> {
  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterWhereClause>
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterWhereClause>
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

extension IsarOccurrenceEntityQueryFilter on QueryBuilder<IsarOccurrenceEntity,
    IsarOccurrenceEntity, QFilterCondition> {
  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> commentsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'comments',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> commentsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'comments',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> commentsGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'comments',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> commentsLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'comments',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> commentsBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'comments',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> commentsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'comments',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> commentsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'comments',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
          QAfterFilterCondition>
      commentsContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'comments',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
          QAfterFilterCondition>
      commentsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'comments',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> createdAtIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'createdAt',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> createdAtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> createdAtGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createdAt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> createdAtLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createdAt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> createdAtBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createdAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> createdAtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'createdAt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> createdAtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'createdAt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
          QAfterFilterCondition>
      createdAtContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'createdAt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
          QAfterFilterCondition>
      createdAtMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'createdAt',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> lineIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'lineId',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> lineIdEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'lineId',
      value: value,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> lineIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'lineId',
      value: value,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> lineIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'lineId',
      value: value,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> lineIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'lineId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> rncNumberIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'rncNumber',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> rncNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'rncNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> rncNumberGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'rncNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> rncNumberLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'rncNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> rncNumberBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'rncNumber',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> rncNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'rncNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> rncNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'rncNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
          QAfterFilterCondition>
      rncNumberContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'rncNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
          QAfterFilterCondition>
      rncNumberMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'rncNumber',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> scheduleNumberIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'scheduleNumber',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
          QAfterFilterCondition>
      scheduleNumberContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'scheduleNumber',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
          QAfterFilterCondition>
      scheduleNumberMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'scheduleNumber',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> tokenIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'token',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
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

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
          QAfterFilterCondition>
      tokenContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'token',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
          QAfterFilterCondition>
      tokenMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'token',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> typeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'type',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> typeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> typeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> typeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> typeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'type',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
      QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
          QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'type',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity,
          QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'type',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarOccurrenceEntityQueryLinks on QueryBuilder<IsarOccurrenceEntity,
    IsarOccurrenceEntity, QFilterCondition> {}

extension IsarOccurrenceEntityQueryWhereSortBy
    on QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QSortBy> {
  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByComments() {
    return addSortByInternal('comments', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByCommentsDesc() {
    return addSortByInternal('comments', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByLineId() {
    return addSortByInternal('lineId', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByLineIdDesc() {
    return addSortByInternal('lineId', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByRncNumber() {
    return addSortByInternal('rncNumber', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByRncNumberDesc() {
    return addSortByInternal('rncNumber', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByScheduleNumber() {
    return addSortByInternal('scheduleNumber', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByScheduleNumberDesc() {
    return addSortByInternal('scheduleNumber', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByToken() {
    return addSortByInternal('token', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByTokenDesc() {
    return addSortByInternal('token', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      sortByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }
}

extension IsarOccurrenceEntityQueryWhereSortThenBy
    on QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QSortThenBy> {
  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByComments() {
    return addSortByInternal('comments', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByCommentsDesc() {
    return addSortByInternal('comments', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByLineId() {
    return addSortByInternal('lineId', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByLineIdDesc() {
    return addSortByInternal('lineId', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByRncNumber() {
    return addSortByInternal('rncNumber', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByRncNumberDesc() {
    return addSortByInternal('rncNumber', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByScheduleNumber() {
    return addSortByInternal('scheduleNumber', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByScheduleNumberDesc() {
    return addSortByInternal('scheduleNumber', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByToken() {
    return addSortByInternal('token', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByTokenDesc() {
    return addSortByInternal('token', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByType() {
    return addSortByInternal('type', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QAfterSortBy>
      thenByTypeDesc() {
    return addSortByInternal('type', Sort.desc);
  }
}

extension IsarOccurrenceEntityQueryWhereDistinct
    on QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QDistinct> {
  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QDistinct>
      distinctByComments({bool caseSensitive = true}) {
    return addDistinctByInternal('comments', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QDistinct>
      distinctByCreatedAt({bool caseSensitive = true}) {
    return addDistinctByInternal('createdAt', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QDistinct>
      distinctByLineId() {
    return addDistinctByInternal('lineId');
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QDistinct>
      distinctByRncNumber({bool caseSensitive = true}) {
    return addDistinctByInternal('rncNumber', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QDistinct>
      distinctByScheduleNumber({bool caseSensitive = true}) {
    return addDistinctByInternal('scheduleNumber',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QDistinct>
      distinctByToken({bool caseSensitive = true}) {
    return addDistinctByInternal('token', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarOccurrenceEntity, IsarOccurrenceEntity, QDistinct>
      distinctByType({bool caseSensitive = true}) {
    return addDistinctByInternal('type', caseSensitive: caseSensitive);
  }
}

extension IsarOccurrenceEntityQueryProperty on QueryBuilder<
    IsarOccurrenceEntity, IsarOccurrenceEntity, QQueryProperty> {
  QueryBuilder<IsarOccurrenceEntity, String?, QQueryOperations>
      commentsProperty() {
    return addPropertyNameInternal('comments');
  }

  QueryBuilder<IsarOccurrenceEntity, String?, QQueryOperations>
      createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<IsarOccurrenceEntity, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarOccurrenceEntity, int?, QQueryOperations> lineIdProperty() {
    return addPropertyNameInternal('lineId');
  }

  QueryBuilder<IsarOccurrenceEntity, String?, QQueryOperations>
      rncNumberProperty() {
    return addPropertyNameInternal('rncNumber');
  }

  QueryBuilder<IsarOccurrenceEntity, String?, QQueryOperations>
      scheduleNumberProperty() {
    return addPropertyNameInternal('scheduleNumber');
  }

  QueryBuilder<IsarOccurrenceEntity, String?, QQueryOperations>
      tokenProperty() {
    return addPropertyNameInternal('token');
  }

  QueryBuilder<IsarOccurrenceEntity, String?, QQueryOperations> typeProperty() {
    return addPropertyNameInternal('type');
  }
}
