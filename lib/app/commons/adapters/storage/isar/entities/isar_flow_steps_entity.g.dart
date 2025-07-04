// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_flow_steps_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarFlowStepsEntityCollection on Isar {
  IsarCollection<IsarFlowStepsEntity> get isarFlowStepsEntitys =>
      getCollection();
}

const IsarFlowStepsEntitySchema = CollectionSchema(
  name: 'IsarFlowStepsEntity',
  schema:
      '{"name":"IsarFlowStepsEntity","idName":"id","properties":[{"name":"compartmented","type":"Bool"},{"name":"flowCode","type":"String"},{"name":"flowDescription","type":"String"},{"name":"flowStepId","type":"String"},{"name":"flowTime","type":"String"},{"name":"iconName","type":"String"},{"name":"locationGroup","type":"String"},{"name":"operationType","type":"String"},{"name":"plantCode","type":"String"},{"name":"plantDescription","type":"String"},{"name":"profileCode","type":"String"},{"name":"profileName","type":"String"},{"name":"questions","type":"Bool"},{"name":"sequence","type":"Double"},{"name":"signatures","type":"Bool"},{"name":"skippable","type":"Bool"},{"name":"windowType","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'compartmented': 0,
    'flowCode': 1,
    'flowDescription': 2,
    'flowStepId': 3,
    'flowTime': 4,
    'iconName': 5,
    'locationGroup': 6,
    'operationType': 7,
    'plantCode': 8,
    'plantDescription': 9,
    'profileCode': 10,
    'profileName': 11,
    'questions': 12,
    'sequence': 13,
    'signatures': 14,
    'skippable': 15,
    'windowType': 16
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarFlowStepsEntityGetId,
  setId: _isarFlowStepsEntitySetId,
  getLinks: _isarFlowStepsEntityGetLinks,
  attachLinks: _isarFlowStepsEntityAttachLinks,
  serializeNative: _isarFlowStepsEntitySerializeNative,
  deserializeNative: _isarFlowStepsEntityDeserializeNative,
  deserializePropNative: _isarFlowStepsEntityDeserializePropNative,
  serializeWeb: _isarFlowStepsEntitySerializeWeb,
  deserializeWeb: _isarFlowStepsEntityDeserializeWeb,
  deserializePropWeb: _isarFlowStepsEntityDeserializePropWeb,
  version: 3,
);

int? _isarFlowStepsEntityGetId(IsarFlowStepsEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarFlowStepsEntitySetId(IsarFlowStepsEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarFlowStepsEntityGetLinks(IsarFlowStepsEntity object) {
  return [];
}

void _isarFlowStepsEntitySerializeNative(
    IsarCollection<IsarFlowStepsEntity> collection,
    IsarRawObject rawObj,
    IsarFlowStepsEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.compartmented;
  final _compartmented = value0;
  final value1 = object.flowCode;
  IsarUint8List? _flowCode;
  if (value1 != null) {
    _flowCode = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_flowCode?.length ?? 0) as int;
  final value2 = object.flowDescription;
  IsarUint8List? _flowDescription;
  if (value2 != null) {
    _flowDescription = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_flowDescription?.length ?? 0) as int;
  final value3 = object.flowStepId;
  IsarUint8List? _flowStepId;
  if (value3 != null) {
    _flowStepId = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_flowStepId?.length ?? 0) as int;
  final value4 = object.flowTime;
  IsarUint8List? _flowTime;
  if (value4 != null) {
    _flowTime = IsarBinaryWriter.utf8Encoder.convert(value4);
  }
  dynamicSize += (_flowTime?.length ?? 0) as int;
  final value5 = object.iconName;
  IsarUint8List? _iconName;
  if (value5 != null) {
    _iconName = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_iconName?.length ?? 0) as int;
  final value6 = object.locationGroup;
  IsarUint8List? _locationGroup;
  if (value6 != null) {
    _locationGroup = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (_locationGroup?.length ?? 0) as int;
  final value7 = object.operationType;
  IsarUint8List? _operationType;
  if (value7 != null) {
    _operationType = IsarBinaryWriter.utf8Encoder.convert(value7);
  }
  dynamicSize += (_operationType?.length ?? 0) as int;
  final value8 = object.plantCode;
  IsarUint8List? _plantCode;
  if (value8 != null) {
    _plantCode = IsarBinaryWriter.utf8Encoder.convert(value8);
  }
  dynamicSize += (_plantCode?.length ?? 0) as int;
  final value9 = object.plantDescription;
  IsarUint8List? _plantDescription;
  if (value9 != null) {
    _plantDescription = IsarBinaryWriter.utf8Encoder.convert(value9);
  }
  dynamicSize += (_plantDescription?.length ?? 0) as int;
  final value10 = object.profileCode;
  IsarUint8List? _profileCode;
  if (value10 != null) {
    _profileCode = IsarBinaryWriter.utf8Encoder.convert(value10);
  }
  dynamicSize += (_profileCode?.length ?? 0) as int;
  final value11 = object.profileName;
  IsarUint8List? _profileName;
  if (value11 != null) {
    _profileName = IsarBinaryWriter.utf8Encoder.convert(value11);
  }
  dynamicSize += (_profileName?.length ?? 0) as int;
  final value12 = object.questions;
  final _questions = value12;
  final value13 = object.sequence;
  final _sequence = value13;
  final value14 = object.signatures;
  final _signatures = value14;
  final value15 = object.skippable;
  final _skippable = value15;
  final value16 = object.windowType;
  IsarUint8List? _windowType;
  if (value16 != null) {
    _windowType = IsarBinaryWriter.utf8Encoder.convert(value16);
  }
  dynamicSize += (_windowType?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBool(offsets[0], _compartmented);
  writer.writeBytes(offsets[1], _flowCode);
  writer.writeBytes(offsets[2], _flowDescription);
  writer.writeBytes(offsets[3], _flowStepId);
  writer.writeBytes(offsets[4], _flowTime);
  writer.writeBytes(offsets[5], _iconName);
  writer.writeBytes(offsets[6], _locationGroup);
  writer.writeBytes(offsets[7], _operationType);
  writer.writeBytes(offsets[8], _plantCode);
  writer.writeBytes(offsets[9], _plantDescription);
  writer.writeBytes(offsets[10], _profileCode);
  writer.writeBytes(offsets[11], _profileName);
  writer.writeBool(offsets[12], _questions);
  writer.writeDouble(offsets[13], _sequence);
  writer.writeBool(offsets[14], _signatures);
  writer.writeBool(offsets[15], _skippable);
  writer.writeBytes(offsets[16], _windowType);
}

IsarFlowStepsEntity _isarFlowStepsEntityDeserializeNative(
    IsarCollection<IsarFlowStepsEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarFlowStepsEntity();
  object.compartmented = reader.readBoolOrNull(offsets[0]);
  object.flowCode = reader.readStringOrNull(offsets[1]);
  object.flowDescription = reader.readStringOrNull(offsets[2]);
  object.flowStepId = reader.readStringOrNull(offsets[3]);
  object.flowTime = reader.readStringOrNull(offsets[4]);
  object.iconName = reader.readStringOrNull(offsets[5]);
  object.id = id;
  object.locationGroup = reader.readStringOrNull(offsets[6]);
  object.operationType = reader.readStringOrNull(offsets[7]);
  object.plantCode = reader.readStringOrNull(offsets[8]);
  object.plantDescription = reader.readStringOrNull(offsets[9]);
  object.profileCode = reader.readStringOrNull(offsets[10]);
  object.profileName = reader.readStringOrNull(offsets[11]);
  object.questions = reader.readBoolOrNull(offsets[12]);
  object.sequence = reader.readDoubleOrNull(offsets[13]);
  object.signatures = reader.readBoolOrNull(offsets[14]);
  object.skippable = reader.readBoolOrNull(offsets[15]);
  object.windowType = reader.readStringOrNull(offsets[16]);
  return object;
}

P _isarFlowStepsEntityDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readBoolOrNull(offset)) as P;
    case 13:
      return (reader.readDoubleOrNull(offset)) as P;
    case 14:
      return (reader.readBoolOrNull(offset)) as P;
    case 15:
      return (reader.readBoolOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarFlowStepsEntitySerializeWeb(
    IsarCollection<IsarFlowStepsEntity> collection,
    IsarFlowStepsEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'compartmented', object.compartmented);
  IsarNative.jsObjectSet(jsObj, 'flowCode', object.flowCode);
  IsarNative.jsObjectSet(jsObj, 'flowDescription', object.flowDescription);
  IsarNative.jsObjectSet(jsObj, 'flowStepId', object.flowStepId);
  IsarNative.jsObjectSet(jsObj, 'flowTime', object.flowTime);
  IsarNative.jsObjectSet(jsObj, 'iconName', object.iconName);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'locationGroup', object.locationGroup);
  IsarNative.jsObjectSet(jsObj, 'operationType', object.operationType);
  IsarNative.jsObjectSet(jsObj, 'plantCode', object.plantCode);
  IsarNative.jsObjectSet(jsObj, 'plantDescription', object.plantDescription);
  IsarNative.jsObjectSet(jsObj, 'profileCode', object.profileCode);
  IsarNative.jsObjectSet(jsObj, 'profileName', object.profileName);
  IsarNative.jsObjectSet(jsObj, 'questions', object.questions);
  IsarNative.jsObjectSet(jsObj, 'sequence', object.sequence);
  IsarNative.jsObjectSet(jsObj, 'signatures', object.signatures);
  IsarNative.jsObjectSet(jsObj, 'skippable', object.skippable);
  IsarNative.jsObjectSet(jsObj, 'windowType', object.windowType);
  return jsObj;
}

IsarFlowStepsEntity _isarFlowStepsEntityDeserializeWeb(
    IsarCollection<IsarFlowStepsEntity> collection, dynamic jsObj) {
  final object = IsarFlowStepsEntity();
  object.compartmented = IsarNative.jsObjectGet(jsObj, 'compartmented');
  object.flowCode = IsarNative.jsObjectGet(jsObj, 'flowCode');
  object.flowDescription = IsarNative.jsObjectGet(jsObj, 'flowDescription');
  object.flowStepId = IsarNative.jsObjectGet(jsObj, 'flowStepId');
  object.flowTime = IsarNative.jsObjectGet(jsObj, 'flowTime');
  object.iconName = IsarNative.jsObjectGet(jsObj, 'iconName');
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.locationGroup = IsarNative.jsObjectGet(jsObj, 'locationGroup');
  object.operationType = IsarNative.jsObjectGet(jsObj, 'operationType');
  object.plantCode = IsarNative.jsObjectGet(jsObj, 'plantCode');
  object.plantDescription = IsarNative.jsObjectGet(jsObj, 'plantDescription');
  object.profileCode = IsarNative.jsObjectGet(jsObj, 'profileCode');
  object.profileName = IsarNative.jsObjectGet(jsObj, 'profileName');
  object.questions = IsarNative.jsObjectGet(jsObj, 'questions');
  object.sequence = IsarNative.jsObjectGet(jsObj, 'sequence');
  object.signatures = IsarNative.jsObjectGet(jsObj, 'signatures');
  object.skippable = IsarNative.jsObjectGet(jsObj, 'skippable');
  object.windowType = IsarNative.jsObjectGet(jsObj, 'windowType');
  return object;
}

P _isarFlowStepsEntityDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'compartmented':
      return (IsarNative.jsObjectGet(jsObj, 'compartmented')) as P;
    case 'flowCode':
      return (IsarNative.jsObjectGet(jsObj, 'flowCode')) as P;
    case 'flowDescription':
      return (IsarNative.jsObjectGet(jsObj, 'flowDescription')) as P;
    case 'flowStepId':
      return (IsarNative.jsObjectGet(jsObj, 'flowStepId')) as P;
    case 'flowTime':
      return (IsarNative.jsObjectGet(jsObj, 'flowTime')) as P;
    case 'iconName':
      return (IsarNative.jsObjectGet(jsObj, 'iconName')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'locationGroup':
      return (IsarNative.jsObjectGet(jsObj, 'locationGroup')) as P;
    case 'operationType':
      return (IsarNative.jsObjectGet(jsObj, 'operationType')) as P;
    case 'plantCode':
      return (IsarNative.jsObjectGet(jsObj, 'plantCode')) as P;
    case 'plantDescription':
      return (IsarNative.jsObjectGet(jsObj, 'plantDescription')) as P;
    case 'profileCode':
      return (IsarNative.jsObjectGet(jsObj, 'profileCode')) as P;
    case 'profileName':
      return (IsarNative.jsObjectGet(jsObj, 'profileName')) as P;
    case 'questions':
      return (IsarNative.jsObjectGet(jsObj, 'questions')) as P;
    case 'sequence':
      return (IsarNative.jsObjectGet(jsObj, 'sequence')) as P;
    case 'signatures':
      return (IsarNative.jsObjectGet(jsObj, 'signatures')) as P;
    case 'skippable':
      return (IsarNative.jsObjectGet(jsObj, 'skippable')) as P;
    case 'windowType':
      return (IsarNative.jsObjectGet(jsObj, 'windowType')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarFlowStepsEntityAttachLinks(
    IsarCollection col, int id, IsarFlowStepsEntity object) {}

extension IsarFlowStepsEntityQueryWhereSort
    on QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QWhere> {
  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarFlowStepsEntityQueryWhere
    on QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QWhereClause> {
  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterWhereClause>
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterWhereClause>
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

extension IsarFlowStepsEntityQueryFilter on QueryBuilder<IsarFlowStepsEntity,
    IsarFlowStepsEntity, QFilterCondition> {
  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      compartmentedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'compartmented',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      compartmentedEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'compartmented',
      value: value,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowCodeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'flowCode',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowCodeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'flowCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowCodeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'flowCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowDescriptionIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'flowDescription',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'flowDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowDescriptionGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'flowDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowDescriptionLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'flowDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowDescriptionBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'flowDescription',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'flowDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'flowDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowDescriptionContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'flowDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'flowDescription',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowStepIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'flowStepId',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowStepIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'flowStepId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowStepIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'flowStepId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowStepIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'flowStepId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowStepIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'flowStepId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowStepIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'flowStepId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowStepIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'flowStepId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowStepIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'flowStepId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowStepIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'flowStepId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowTimeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'flowTime',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'flowTime',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowTimeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'flowTime',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowTimeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'flowTime',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowTimeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'flowTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'flowTime',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'flowTime',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowTimeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'flowTime',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      flowTimeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'flowTime',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      iconNameIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'iconName',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      iconNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'iconName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      iconNameGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'iconName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      iconNameLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'iconName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      iconNameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'iconName',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      iconNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'iconName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      iconNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'iconName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      iconNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'iconName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      iconNameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'iconName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      locationGroupIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'locationGroup',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      locationGroupEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'locationGroup',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      locationGroupGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'locationGroup',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      locationGroupLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'locationGroup',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      locationGroupBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'locationGroup',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      locationGroupStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'locationGroup',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      locationGroupEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'locationGroup',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      locationGroupContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'locationGroup',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      locationGroupMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'locationGroup',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      operationTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'operationType',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      operationTypeEqualTo(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      operationTypeGreaterThan(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      operationTypeLessThan(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      operationTypeBetween(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      operationTypeStartsWith(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      operationTypeEndsWith(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      operationTypeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'operationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      operationTypeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'operationType',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantCodeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'plantCode',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'plantCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantCodeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'plantCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantCodeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'plantCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantCodeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'plantCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'plantCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'plantCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantCodeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'plantCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantCodeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'plantCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantDescriptionIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'plantDescription',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantDescriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'plantDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantDescriptionGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'plantDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantDescriptionLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'plantDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantDescriptionBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'plantDescription',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantDescriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'plantDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantDescriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'plantDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantDescriptionContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'plantDescription',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      plantDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'plantDescription',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileCodeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'profileCode',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileCodeEqualTo(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileCodeGreaterThan(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileCodeLessThan(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileCodeBetween(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileCodeStartsWith(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileCodeEndsWith(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileCodeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'profileCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileCodeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'profileCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileNameIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'profileName',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileNameEqualTo(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileNameGreaterThan(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileNameLessThan(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileNameBetween(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileNameStartsWith(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileNameEndsWith(
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

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileNameContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'profileName',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      profileNameMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'profileName',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      questionsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'questions',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      questionsEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'questions',
      value: value,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      sequenceIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'sequence',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      sequenceGreaterThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'sequence',
      value: value,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      sequenceLessThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'sequence',
      value: value,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      sequenceBetween(double? lower, double? upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sequence',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      signaturesIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'signatures',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      signaturesEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'signatures',
      value: value,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      skippableIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'skippable',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      skippableEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'skippable',
      value: value,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      windowTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'windowType',
      value: null,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      windowTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'windowType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      windowTypeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'windowType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      windowTypeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'windowType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      windowTypeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'windowType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      windowTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'windowType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      windowTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'windowType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      windowTypeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'windowType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterFilterCondition>
      windowTypeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'windowType',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarFlowStepsEntityQueryLinks on QueryBuilder<IsarFlowStepsEntity,
    IsarFlowStepsEntity, QFilterCondition> {}

extension IsarFlowStepsEntityQueryWhereSortBy
    on QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QSortBy> {
  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByCompartmented() {
    return addSortByInternal('compartmented', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByCompartmentedDesc() {
    return addSortByInternal('compartmented', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByFlowCode() {
    return addSortByInternal('flowCode', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByFlowCodeDesc() {
    return addSortByInternal('flowCode', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByFlowDescription() {
    return addSortByInternal('flowDescription', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByFlowDescriptionDesc() {
    return addSortByInternal('flowDescription', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByFlowStepId() {
    return addSortByInternal('flowStepId', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByFlowStepIdDesc() {
    return addSortByInternal('flowStepId', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByFlowTime() {
    return addSortByInternal('flowTime', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByFlowTimeDesc() {
    return addSortByInternal('flowTime', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByIconName() {
    return addSortByInternal('iconName', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByIconNameDesc() {
    return addSortByInternal('iconName', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByLocationGroup() {
    return addSortByInternal('locationGroup', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByLocationGroupDesc() {
    return addSortByInternal('locationGroup', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByOperationType() {
    return addSortByInternal('operationType', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByOperationTypeDesc() {
    return addSortByInternal('operationType', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByPlantCode() {
    return addSortByInternal('plantCode', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByPlantCodeDesc() {
    return addSortByInternal('plantCode', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByPlantDescription() {
    return addSortByInternal('plantDescription', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByPlantDescriptionDesc() {
    return addSortByInternal('plantDescription', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByProfileCode() {
    return addSortByInternal('profileCode', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByProfileCodeDesc() {
    return addSortByInternal('profileCode', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByProfileName() {
    return addSortByInternal('profileName', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByProfileNameDesc() {
    return addSortByInternal('profileName', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByQuestions() {
    return addSortByInternal('questions', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByQuestionsDesc() {
    return addSortByInternal('questions', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortBySequence() {
    return addSortByInternal('sequence', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortBySequenceDesc() {
    return addSortByInternal('sequence', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortBySignatures() {
    return addSortByInternal('signatures', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortBySignaturesDesc() {
    return addSortByInternal('signatures', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortBySkippable() {
    return addSortByInternal('skippable', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortBySkippableDesc() {
    return addSortByInternal('skippable', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByWindowType() {
    return addSortByInternal('windowType', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      sortByWindowTypeDesc() {
    return addSortByInternal('windowType', Sort.desc);
  }
}

extension IsarFlowStepsEntityQueryWhereSortThenBy
    on QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QSortThenBy> {
  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByCompartmented() {
    return addSortByInternal('compartmented', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByCompartmentedDesc() {
    return addSortByInternal('compartmented', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByFlowCode() {
    return addSortByInternal('flowCode', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByFlowCodeDesc() {
    return addSortByInternal('flowCode', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByFlowDescription() {
    return addSortByInternal('flowDescription', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByFlowDescriptionDesc() {
    return addSortByInternal('flowDescription', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByFlowStepId() {
    return addSortByInternal('flowStepId', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByFlowStepIdDesc() {
    return addSortByInternal('flowStepId', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByFlowTime() {
    return addSortByInternal('flowTime', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByFlowTimeDesc() {
    return addSortByInternal('flowTime', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByIconName() {
    return addSortByInternal('iconName', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByIconNameDesc() {
    return addSortByInternal('iconName', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByLocationGroup() {
    return addSortByInternal('locationGroup', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByLocationGroupDesc() {
    return addSortByInternal('locationGroup', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByOperationType() {
    return addSortByInternal('operationType', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByOperationTypeDesc() {
    return addSortByInternal('operationType', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByPlantCode() {
    return addSortByInternal('plantCode', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByPlantCodeDesc() {
    return addSortByInternal('plantCode', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByPlantDescription() {
    return addSortByInternal('plantDescription', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByPlantDescriptionDesc() {
    return addSortByInternal('plantDescription', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByProfileCode() {
    return addSortByInternal('profileCode', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByProfileCodeDesc() {
    return addSortByInternal('profileCode', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByProfileName() {
    return addSortByInternal('profileName', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByProfileNameDesc() {
    return addSortByInternal('profileName', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByQuestions() {
    return addSortByInternal('questions', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByQuestionsDesc() {
    return addSortByInternal('questions', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenBySequence() {
    return addSortByInternal('sequence', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenBySequenceDesc() {
    return addSortByInternal('sequence', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenBySignatures() {
    return addSortByInternal('signatures', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenBySignaturesDesc() {
    return addSortByInternal('signatures', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenBySkippable() {
    return addSortByInternal('skippable', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenBySkippableDesc() {
    return addSortByInternal('skippable', Sort.desc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByWindowType() {
    return addSortByInternal('windowType', Sort.asc);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QAfterSortBy>
      thenByWindowTypeDesc() {
    return addSortByInternal('windowType', Sort.desc);
  }
}

extension IsarFlowStepsEntityQueryWhereDistinct
    on QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct> {
  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByCompartmented() {
    return addDistinctByInternal('compartmented');
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByFlowCode({bool caseSensitive = true}) {
    return addDistinctByInternal('flowCode', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByFlowDescription({bool caseSensitive = true}) {
    return addDistinctByInternal('flowDescription',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByFlowStepId({bool caseSensitive = true}) {
    return addDistinctByInternal('flowStepId', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByFlowTime({bool caseSensitive = true}) {
    return addDistinctByInternal('flowTime', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByIconName({bool caseSensitive = true}) {
    return addDistinctByInternal('iconName', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByLocationGroup({bool caseSensitive = true}) {
    return addDistinctByInternal('locationGroup', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByOperationType({bool caseSensitive = true}) {
    return addDistinctByInternal('operationType', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByPlantCode({bool caseSensitive = true}) {
    return addDistinctByInternal('plantCode', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByPlantDescription({bool caseSensitive = true}) {
    return addDistinctByInternal('plantDescription',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByProfileCode({bool caseSensitive = true}) {
    return addDistinctByInternal('profileCode', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByProfileName({bool caseSensitive = true}) {
    return addDistinctByInternal('profileName', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByQuestions() {
    return addDistinctByInternal('questions');
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctBySequence() {
    return addDistinctByInternal('sequence');
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctBySignatures() {
    return addDistinctByInternal('signatures');
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctBySkippable() {
    return addDistinctByInternal('skippable');
  }

  QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QDistinct>
      distinctByWindowType({bool caseSensitive = true}) {
    return addDistinctByInternal('windowType', caseSensitive: caseSensitive);
  }
}

extension IsarFlowStepsEntityQueryProperty
    on QueryBuilder<IsarFlowStepsEntity, IsarFlowStepsEntity, QQueryProperty> {
  QueryBuilder<IsarFlowStepsEntity, bool?, QQueryOperations>
      compartmentedProperty() {
    return addPropertyNameInternal('compartmented');
  }

  QueryBuilder<IsarFlowStepsEntity, String?, QQueryOperations>
      flowCodeProperty() {
    return addPropertyNameInternal('flowCode');
  }

  QueryBuilder<IsarFlowStepsEntity, String?, QQueryOperations>
      flowDescriptionProperty() {
    return addPropertyNameInternal('flowDescription');
  }

  QueryBuilder<IsarFlowStepsEntity, String?, QQueryOperations>
      flowStepIdProperty() {
    return addPropertyNameInternal('flowStepId');
  }

  QueryBuilder<IsarFlowStepsEntity, String?, QQueryOperations>
      flowTimeProperty() {
    return addPropertyNameInternal('flowTime');
  }

  QueryBuilder<IsarFlowStepsEntity, String?, QQueryOperations>
      iconNameProperty() {
    return addPropertyNameInternal('iconName');
  }

  QueryBuilder<IsarFlowStepsEntity, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarFlowStepsEntity, String?, QQueryOperations>
      locationGroupProperty() {
    return addPropertyNameInternal('locationGroup');
  }

  QueryBuilder<IsarFlowStepsEntity, String?, QQueryOperations>
      operationTypeProperty() {
    return addPropertyNameInternal('operationType');
  }

  QueryBuilder<IsarFlowStepsEntity, String?, QQueryOperations>
      plantCodeProperty() {
    return addPropertyNameInternal('plantCode');
  }

  QueryBuilder<IsarFlowStepsEntity, String?, QQueryOperations>
      plantDescriptionProperty() {
    return addPropertyNameInternal('plantDescription');
  }

  QueryBuilder<IsarFlowStepsEntity, String?, QQueryOperations>
      profileCodeProperty() {
    return addPropertyNameInternal('profileCode');
  }

  QueryBuilder<IsarFlowStepsEntity, String?, QQueryOperations>
      profileNameProperty() {
    return addPropertyNameInternal('profileName');
  }

  QueryBuilder<IsarFlowStepsEntity, bool?, QQueryOperations>
      questionsProperty() {
    return addPropertyNameInternal('questions');
  }

  QueryBuilder<IsarFlowStepsEntity, double?, QQueryOperations>
      sequenceProperty() {
    return addPropertyNameInternal('sequence');
  }

  QueryBuilder<IsarFlowStepsEntity, bool?, QQueryOperations>
      signaturesProperty() {
    return addPropertyNameInternal('signatures');
  }

  QueryBuilder<IsarFlowStepsEntity, bool?, QQueryOperations>
      skippableProperty() {
    return addPropertyNameInternal('skippable');
  }

  QueryBuilder<IsarFlowStepsEntity, String?, QQueryOperations>
      windowTypeProperty() {
    return addPropertyNameInternal('windowType');
  }
}
