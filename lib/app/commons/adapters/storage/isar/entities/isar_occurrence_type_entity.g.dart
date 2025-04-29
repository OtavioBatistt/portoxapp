// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_occurrence_type_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarOccurrenceTypeEntityCollection on Isar {
  IsarCollection<IsarOccurrenceTypeEntity> get isarOccurrenceTypeEntitys =>
      getCollection();
}

const IsarOccurrenceTypeEntitySchema = CollectionSchema(
  name: 'IsarOccurrenceTypeEntity',
  schema:
      '{"name":"IsarOccurrenceTypeEntity","idName":"id","properties":[{"name":"classificCodeEs","type":"String"},{"name":"classificCodePt","type":"String"},{"name":"classificCodeUs","type":"String"},{"name":"classificId","type":"Long"},{"name":"occurrenceId","type":"String"},{"name":"operationType","type":"String"},{"name":"profileCode","type":"String"},{"name":"profileName","type":"String"},{"name":"required","type":"Bool"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'classificCodeEs': 0,
    'classificCodePt': 1,
    'classificCodeUs': 2,
    'classificId': 3,
    'occurrenceId': 4,
    'operationType': 5,
    'profileCode': 6,
    'profileName': 7,
    'required': 8
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarOccurrenceTypeEntityGetId,
  setId: _isarOccurrenceTypeEntitySetId,
  getLinks: _isarOccurrenceTypeEntityGetLinks,
  attachLinks: _isarOccurrenceTypeEntityAttachLinks,
  serializeNative: _isarOccurrenceTypeEntitySerializeNative,
  deserializeNative: _isarOccurrenceTypeEntityDeserializeNative,
  deserializePropNative: _isarOccurrenceTypeEntityDeserializePropNative,
  serializeWeb: _isarOccurrenceTypeEntitySerializeWeb,
  deserializeWeb: _isarOccurrenceTypeEntityDeserializeWeb,
  deserializePropWeb: _isarOccurrenceTypeEntityDeserializePropWeb,
  version: 3,
);

int? _isarOccurrenceTypeEntityGetId(IsarOccurrenceTypeEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarOccurrenceTypeEntitySetId(IsarOccurrenceTypeEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarOccurrenceTypeEntityGetLinks(
    IsarOccurrenceTypeEntity object) {
  return [];
}

void _isarOccurrenceTypeEntitySerializeNative(
    IsarCollection<IsarOccurrenceTypeEntity> collection,
    IsarRawObject rawObj,
    IsarOccurrenceTypeEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.classificCodeEs;
  IsarUint8List? _classificCodeEs;
  if (value0 != null) {
    _classificCodeEs = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_classificCodeEs?.length ?? 0) as int;
  final value1 = object.classificCodePt;
  IsarUint8List? _classificCodePt;
  if (value1 != null) {
    _classificCodePt = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_classificCodePt?.length ?? 0) as int;
  final value2 = object.classificCodeUs;
  IsarUint8List? _classificCodeUs;
  if (value2 != null) {
    _classificCodeUs = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_classificCodeUs?.length ?? 0) as int;
  final value3 = object.classificId;
  final _classificId = value3;
  final value4 = object.occurrenceId;
  IsarUint8List? _occurrenceId;
  if (value4 != null) {
    _occurrenceId = IsarBinaryWriter.utf8Encoder.convert(value4);
  }
  dynamicSize += (_occurrenceId?.length ?? 0) as int;
  final value5 = object.operationType;
  IsarUint8List? _operationType;
  if (value5 != null) {
    _operationType = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_operationType?.length ?? 0) as int;
  final value6 = object.profileCode;
  IsarUint8List? _profileCode;
  if (value6 != null) {
    _profileCode = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (_profileCode?.length ?? 0) as int;
  final value7 = object.profileName;
  IsarUint8List? _profileName;
  if (value7 != null) {
    _profileName = IsarBinaryWriter.utf8Encoder.convert(value7);
  }
  dynamicSize += (_profileName?.length ?? 0) as int;
  final value8 = object.required;
  final _required = value8;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _classificCodeEs);
  writer.writeBytes(offsets[1], _classificCodePt);
  writer.writeBytes(offsets[2], _classificCodeUs);
  writer.writeLong(offsets[3], _classificId);
  writer.writeBytes(offsets[4], _occurrenceId);
  writer.writeBytes(offsets[5], _operationType);
  writer.writeBytes(offsets[6], _profileCode);
  writer.writeBytes(offsets[7], _profileName);
  writer.writeBool(offsets[8], _required);
}

IsarOccurrenceTypeEntity _isarOccurrenceTypeEntityDeserializeNative(
    IsarCollection<IsarOccurrenceTypeEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarOccurrenceTypeEntity();
  object.classificCodeEs = reader.readStringOrNull(offsets[0]);
  object.classificCodePt = reader.readStringOrNull(offsets[1]);
  object.classificCodeUs = reader.readStringOrNull(offsets[2]);
  object.classificId = reader.readLongOrNull(offsets[3]);
  object.id = id;
  object.occurrenceId = reader.readStringOrNull(offsets[4]);
  object.operationType = reader.readStringOrNull(offsets[5]);
  object.profileCode = reader.readStringOrNull(offsets[6]);
  object.profileName = reader.readStringOrNull(offsets[7]);
  object.required = reader.readBoolOrNull(offsets[8]);
  return object;
}

P _isarOccurrenceTypeEntityDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarOccurrenceTypeEntitySerializeWeb(
    IsarCollection<IsarOccurrenceTypeEntity> collection,
    IsarOccurrenceTypeEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'classificCodeEs', object.classificCodeEs);
  IsarNative.jsObjectSet(jsObj, 'classificCodePt', object.classificCodePt);
  IsarNative.jsObjectSet(jsObj, 'classificCodeUs', object.classificCodeUs);
  IsarNative.jsObjectSet(jsObj, 'classificId', object.classificId);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'occurrenceId', object.occurrenceId);
  IsarNative.jsObjectSet(jsObj, 'operationType', object.operationType);
  IsarNative.jsObjectSet(jsObj, 'profileCode', object.profileCode);
  IsarNative.jsObjectSet(jsObj, 'profileName', object.profileName);
  IsarNative.jsObjectSet(jsObj, 'required', object.required);
  return jsObj;
}

IsarOccurrenceTypeEntity _isarOccurrenceTypeEntityDeserializeWeb(
    IsarCollection<IsarOccurrenceTypeEntity> collection, dynamic jsObj) {
  final object = IsarOccurrenceTypeEntity();
  object.classificCodeEs = IsarNative.jsObjectGet(jsObj, 'classificCodeEs');
  object.classificCodePt = IsarNative.jsObjectGet(jsObj, 'classificCodePt');
  object.classificCodeUs = IsarNative.jsObjectGet(jsObj, 'classificCodeUs');
  object.classificId = IsarNative.jsObjectGet(jsObj, 'classificId');
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.occurrenceId = IsarNative.jsObjectGet(jsObj, 'occurrenceId');
  object.operationType = IsarNative.jsObjectGet(jsObj, 'operationType');
  object.profileCode = IsarNative.jsObjectGet(jsObj, 'profileCode');
  object.profileName = IsarNative.jsObjectGet(jsObj, 'profileName');
  object.required = IsarNative.jsObjectGet(jsObj, 'required');
  return object;
}

P _isarOccurrenceTypeEntityDeserializePropWeb<P>(
    Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'classificCodeEs':
      return (IsarNative.jsObjectGet(jsObj, 'classificCodeEs')) as P;
    case 'classificCodePt':
      return (IsarNative.jsObjectGet(jsObj, 'classificCodePt')) as P;
    case 'classificCodeUs':
      return (IsarNative.jsObjectGet(jsObj, 'classificCodeUs')) as P;
    case 'classificId':
      return (IsarNative.jsObjectGet(jsObj, 'classificId')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'occurrenceId':
      return (IsarNative.jsObjectGet(jsObj, 'occurrenceId')) as P;
    case 'operationType':
      return (IsarNative.jsObjectGet(jsObj, 'operationType')) as P;
    case 'profileCode':
      return (IsarNative.jsObjectGet(jsObj, 'profileCode')) as P;
    case 'profileName':
      return (IsarNative.jsObjectGet(jsObj, 'profileName')) as P;
    case 'required':
      return (IsarNative.jsObjectGet(jsObj, 'required')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarOccurrenceTypeEntityAttachLinks(
    IsarCollection col, int id, IsarOccurrenceTypeEntity object) {}

extension IsarOccurrenceTypeEntityQueryWhereSort on QueryBuilder<
    IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QWhere> {
  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterWhere>
      anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarOccurrenceTypeEntityQueryWhere on QueryBuilder<
    IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QWhereClause> {
  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
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

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterWhereClause> idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterWhereClause> idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
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

extension IsarOccurrenceTypeEntityQueryFilter on QueryBuilder<
    IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QFilterCondition> {
  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeEsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'classificCodeEs',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeEsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'classificCodeEs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeEsGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'classificCodeEs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeEsLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'classificCodeEs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeEsBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'classificCodeEs',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeEsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'classificCodeEs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeEsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'classificCodeEs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      classificCodeEsContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'classificCodeEs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      classificCodeEsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'classificCodeEs',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodePtIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'classificCodePt',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodePtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'classificCodePt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodePtGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'classificCodePt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodePtLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'classificCodePt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodePtBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'classificCodePt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodePtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'classificCodePt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodePtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'classificCodePt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      classificCodePtContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'classificCodePt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      classificCodePtMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'classificCodePt',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeUsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'classificCodeUs',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeUsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'classificCodeUs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeUsGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'classificCodeUs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeUsLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'classificCodeUs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeUsBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'classificCodeUs',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeUsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'classificCodeUs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificCodeUsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'classificCodeUs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      classificCodeUsContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'classificCodeUs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      classificCodeUsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'classificCodeUs',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'classificId',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificIdEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'classificId',
      value: value,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'classificId',
      value: value,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'classificId',
      value: value,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> classificIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'classificId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
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

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
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

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
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

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> occurrenceIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'occurrenceId',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> occurrenceIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'occurrenceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> occurrenceIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'occurrenceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> occurrenceIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'occurrenceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> occurrenceIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'occurrenceId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> occurrenceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'occurrenceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> occurrenceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'occurrenceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      occurrenceIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'occurrenceId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      occurrenceIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'occurrenceId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> operationTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'operationType',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> operationTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'operationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> operationTypeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'operationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> operationTypeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'operationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> operationTypeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'operationType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> operationTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'operationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> operationTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'operationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      operationTypeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'operationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      operationTypeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'operationType',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileCodeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'profileCode',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'profileCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileCodeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'profileCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileCodeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'profileCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileCodeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'profileCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'profileCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'profileCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      profileCodeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'profileCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      profileCodeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'profileCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileNameIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'profileName',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'profileName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileNameGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'profileName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileNameLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'profileName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileNameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'profileName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'profileName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> profileNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'profileName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      profileNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'profileName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
          QAfterFilterCondition>
      profileNameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'profileName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> requiredIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'required',
      value: null,
    ));
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity,
      QAfterFilterCondition> requiredEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'required',
      value: value,
    ));
  }
}

extension IsarOccurrenceTypeEntityQueryLinks on QueryBuilder<
    IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QFilterCondition> {}

extension IsarOccurrenceTypeEntityQueryWhereSortBy on QueryBuilder<
    IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QSortBy> {
  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByClassificCodeEs() {
    return addSortByInternal('classificCodeEs', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByClassificCodeEsDesc() {
    return addSortByInternal('classificCodeEs', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByClassificCodePt() {
    return addSortByInternal('classificCodePt', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByClassificCodePtDesc() {
    return addSortByInternal('classificCodePt', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByClassificCodeUs() {
    return addSortByInternal('classificCodeUs', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByClassificCodeUsDesc() {
    return addSortByInternal('classificCodeUs', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByClassificId() {
    return addSortByInternal('classificId', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByClassificIdDesc() {
    return addSortByInternal('classificId', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByOccurrenceId() {
    return addSortByInternal('occurrenceId', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByOccurrenceIdDesc() {
    return addSortByInternal('occurrenceId', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByOperationType() {
    return addSortByInternal('operationType', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByOperationTypeDesc() {
    return addSortByInternal('operationType', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByProfileCode() {
    return addSortByInternal('profileCode', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByProfileCodeDesc() {
    return addSortByInternal('profileCode', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByProfileName() {
    return addSortByInternal('profileName', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByProfileNameDesc() {
    return addSortByInternal('profileName', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByRequired() {
    return addSortByInternal('required', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      sortByRequiredDesc() {
    return addSortByInternal('required', Sort.desc);
  }
}

extension IsarOccurrenceTypeEntityQueryWhereSortThenBy on QueryBuilder<
    IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QSortThenBy> {
  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByClassificCodeEs() {
    return addSortByInternal('classificCodeEs', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByClassificCodeEsDesc() {
    return addSortByInternal('classificCodeEs', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByClassificCodePt() {
    return addSortByInternal('classificCodePt', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByClassificCodePtDesc() {
    return addSortByInternal('classificCodePt', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByClassificCodeUs() {
    return addSortByInternal('classificCodeUs', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByClassificCodeUsDesc() {
    return addSortByInternal('classificCodeUs', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByClassificId() {
    return addSortByInternal('classificId', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByClassificIdDesc() {
    return addSortByInternal('classificId', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByOccurrenceId() {
    return addSortByInternal('occurrenceId', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByOccurrenceIdDesc() {
    return addSortByInternal('occurrenceId', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByOperationType() {
    return addSortByInternal('operationType', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByOperationTypeDesc() {
    return addSortByInternal('operationType', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByProfileCode() {
    return addSortByInternal('profileCode', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByProfileCodeDesc() {
    return addSortByInternal('profileCode', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByProfileName() {
    return addSortByInternal('profileName', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByProfileNameDesc() {
    return addSortByInternal('profileName', Sort.desc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByRequired() {
    return addSortByInternal('required', Sort.asc);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QAfterSortBy>
      thenByRequiredDesc() {
    return addSortByInternal('required', Sort.desc);
  }
}

extension IsarOccurrenceTypeEntityQueryWhereDistinct on QueryBuilder<
    IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QDistinct> {
  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QDistinct>
      distinctByClassificCodeEs({bool caseSensitive = true}) {
    return addDistinctByInternal('classificCodeEs',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QDistinct>
      distinctByClassificCodePt({bool caseSensitive = true}) {
    return addDistinctByInternal('classificCodePt',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QDistinct>
      distinctByClassificCodeUs({bool caseSensitive = true}) {
    return addDistinctByInternal('classificCodeUs',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QDistinct>
      distinctByClassificId() {
    return addDistinctByInternal('classificId');
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QDistinct>
      distinctByOccurrenceId({bool caseSensitive = true}) {
    return addDistinctByInternal('occurrenceId', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QDistinct>
      distinctByOperationType({bool caseSensitive = true}) {
    return addDistinctByInternal('operationType', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QDistinct>
      distinctByProfileCode({bool caseSensitive = true}) {
    return addDistinctByInternal('profileCode', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QDistinct>
      distinctByProfileName({bool caseSensitive = true}) {
    return addDistinctByInternal('profileName', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QDistinct>
      distinctByRequired() {
    return addDistinctByInternal('required');
  }
}

extension IsarOccurrenceTypeEntityQueryProperty on QueryBuilder<
    IsarOccurrenceTypeEntity, IsarOccurrenceTypeEntity, QQueryProperty> {
  QueryBuilder<IsarOccurrenceTypeEntity, String?, QQueryOperations>
      classificCodeEsProperty() {
    return addPropertyNameInternal('classificCodeEs');
  }

  QueryBuilder<IsarOccurrenceTypeEntity, String?, QQueryOperations>
      classificCodePtProperty() {
    return addPropertyNameInternal('classificCodePt');
  }

  QueryBuilder<IsarOccurrenceTypeEntity, String?, QQueryOperations>
      classificCodeUsProperty() {
    return addPropertyNameInternal('classificCodeUs');
  }

  QueryBuilder<IsarOccurrenceTypeEntity, int?, QQueryOperations>
      classificIdProperty() {
    return addPropertyNameInternal('classificId');
  }

  QueryBuilder<IsarOccurrenceTypeEntity, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarOccurrenceTypeEntity, String?, QQueryOperations>
      occurrenceIdProperty() {
    return addPropertyNameInternal('occurrenceId');
  }

  QueryBuilder<IsarOccurrenceTypeEntity, String?, QQueryOperations>
      operationTypeProperty() {
    return addPropertyNameInternal('operationType');
  }

  QueryBuilder<IsarOccurrenceTypeEntity, String?, QQueryOperations>
      profileCodeProperty() {
    return addPropertyNameInternal('profileCode');
  }

  QueryBuilder<IsarOccurrenceTypeEntity, String?, QQueryOperations>
      profileNameProperty() {
    return addPropertyNameInternal('profileName');
  }

  QueryBuilder<IsarOccurrenceTypeEntity, bool?, QQueryOperations>
      requiredProperty() {
    return addPropertyNameInternal('required');
  }
}
