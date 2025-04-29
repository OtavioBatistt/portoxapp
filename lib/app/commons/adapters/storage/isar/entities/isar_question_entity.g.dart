// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_question_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarQuestionEntityCollection on Isar {
  IsarCollection<IsarQuestionEntity> get isarQuestionEntitys => getCollection();
}

const IsarQuestionEntitySchema = CollectionSchema(
  name: 'IsarQuestionEntity',
  schema:
      '{"name":"IsarQuestionEntity","idName":"id","properties":[{"name":"classRisk","type":"Bool"},{"name":"confirmationRequired","type":"Bool"},{"name":"enUS","type":"String"},{"name":"esES","type":"String"},{"name":"flowCode","type":"String"},{"name":"marketType","type":"String"},{"name":"operationType","type":"String"},{"name":"plantCode","type":"String"},{"name":"ptBR","type":"String"},{"name":"questionId","type":"Long"},{"name":"required","type":"Bool"},{"name":"sequence","type":"Double"},{"name":"validationType","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'classRisk': 0,
    'confirmationRequired': 1,
    'enUS': 2,
    'esES': 3,
    'flowCode': 4,
    'marketType': 5,
    'operationType': 6,
    'plantCode': 7,
    'ptBR': 8,
    'questionId': 9,
    'required': 10,
    'sequence': 11,
    'validationType': 12
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarQuestionEntityGetId,
  setId: _isarQuestionEntitySetId,
  getLinks: _isarQuestionEntityGetLinks,
  attachLinks: _isarQuestionEntityAttachLinks,
  serializeNative: _isarQuestionEntitySerializeNative,
  deserializeNative: _isarQuestionEntityDeserializeNative,
  deserializePropNative: _isarQuestionEntityDeserializePropNative,
  serializeWeb: _isarQuestionEntitySerializeWeb,
  deserializeWeb: _isarQuestionEntityDeserializeWeb,
  deserializePropWeb: _isarQuestionEntityDeserializePropWeb,
  version: 3,
);

int? _isarQuestionEntityGetId(IsarQuestionEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarQuestionEntitySetId(IsarQuestionEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarQuestionEntityGetLinks(IsarQuestionEntity object) {
  return [];
}

void _isarQuestionEntitySerializeNative(
    IsarCollection<IsarQuestionEntity> collection,
    IsarRawObject rawObj,
    IsarQuestionEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.classRisk;
  final _classRisk = value0;
  final value1 = object.confirmationRequired;
  final _confirmationRequired = value1;
  final value2 = object.enUS;
  IsarUint8List? _enUS;
  if (value2 != null) {
    _enUS = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_enUS?.length ?? 0) as int;
  final value3 = object.esES;
  IsarUint8List? _esES;
  if (value3 != null) {
    _esES = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_esES?.length ?? 0) as int;
  final value4 = object.flowCode;
  IsarUint8List? _flowCode;
  if (value4 != null) {
    _flowCode = IsarBinaryWriter.utf8Encoder.convert(value4);
  }
  dynamicSize += (_flowCode?.length ?? 0) as int;
  final value5 = object.marketType;
  IsarUint8List? _marketType;
  if (value5 != null) {
    _marketType = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_marketType?.length ?? 0) as int;
  final value6 = object.operationType;
  IsarUint8List? _operationType;
  if (value6 != null) {
    _operationType = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (_operationType?.length ?? 0) as int;
  final value7 = object.plantCode;
  IsarUint8List? _plantCode;
  if (value7 != null) {
    _plantCode = IsarBinaryWriter.utf8Encoder.convert(value7);
  }
  dynamicSize += (_plantCode?.length ?? 0) as int;
  final value8 = object.ptBR;
  IsarUint8List? _ptBR;
  if (value8 != null) {
    _ptBR = IsarBinaryWriter.utf8Encoder.convert(value8);
  }
  dynamicSize += (_ptBR?.length ?? 0) as int;
  final value9 = object.questionId;
  final _questionId = value9;
  final value10 = object.required;
  final _required = value10;
  final value11 = object.sequence;
  final _sequence = value11;
  final value12 = object.validationType;
  IsarUint8List? _validationType;
  if (value12 != null) {
    _validationType = IsarBinaryWriter.utf8Encoder.convert(value12);
  }
  dynamicSize += (_validationType?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBool(offsets[0], _classRisk);
  writer.writeBool(offsets[1], _confirmationRequired);
  writer.writeBytes(offsets[2], _enUS);
  writer.writeBytes(offsets[3], _esES);
  writer.writeBytes(offsets[4], _flowCode);
  writer.writeBytes(offsets[5], _marketType);
  writer.writeBytes(offsets[6], _operationType);
  writer.writeBytes(offsets[7], _plantCode);
  writer.writeBytes(offsets[8], _ptBR);
  writer.writeLong(offsets[9], _questionId);
  writer.writeBool(offsets[10], _required);
  writer.writeDouble(offsets[11], _sequence);
  writer.writeBytes(offsets[12], _validationType);
}

IsarQuestionEntity _isarQuestionEntityDeserializeNative(
    IsarCollection<IsarQuestionEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarQuestionEntity();
  object.classRisk = reader.readBoolOrNull(offsets[0]);
  object.confirmationRequired = reader.readBoolOrNull(offsets[1]);
  object.enUS = reader.readStringOrNull(offsets[2]);
  object.esES = reader.readStringOrNull(offsets[3]);
  object.flowCode = reader.readStringOrNull(offsets[4]);
  object.id = id;
  object.marketType = reader.readStringOrNull(offsets[5]);
  object.operationType = reader.readStringOrNull(offsets[6]);
  object.plantCode = reader.readStringOrNull(offsets[7]);
  object.ptBR = reader.readStringOrNull(offsets[8]);
  object.questionId = reader.readLongOrNull(offsets[9]);
  object.required = reader.readBoolOrNull(offsets[10]);
  object.sequence = reader.readDoubleOrNull(offsets[11]);
  object.validationType = reader.readStringOrNull(offsets[12]);
  return object;
}

P _isarQuestionEntityDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
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
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readBoolOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarQuestionEntitySerializeWeb(
    IsarCollection<IsarQuestionEntity> collection, IsarQuestionEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'classRisk', object.classRisk);
  IsarNative.jsObjectSet(
      jsObj, 'confirmationRequired', object.confirmationRequired);
  IsarNative.jsObjectSet(jsObj, 'enUS', object.enUS);
  IsarNative.jsObjectSet(jsObj, 'esES', object.esES);
  IsarNative.jsObjectSet(jsObj, 'flowCode', object.flowCode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'marketType', object.marketType);
  IsarNative.jsObjectSet(jsObj, 'operationType', object.operationType);
  IsarNative.jsObjectSet(jsObj, 'plantCode', object.plantCode);
  IsarNative.jsObjectSet(jsObj, 'ptBR', object.ptBR);
  IsarNative.jsObjectSet(jsObj, 'questionId', object.questionId);
  IsarNative.jsObjectSet(jsObj, 'required', object.required);
  IsarNative.jsObjectSet(jsObj, 'sequence', object.sequence);
  IsarNative.jsObjectSet(jsObj, 'validationType', object.validationType);
  return jsObj;
}

IsarQuestionEntity _isarQuestionEntityDeserializeWeb(
    IsarCollection<IsarQuestionEntity> collection, dynamic jsObj) {
  final object = IsarQuestionEntity();
  object.classRisk = IsarNative.jsObjectGet(jsObj, 'classRisk');
  object.confirmationRequired =
      IsarNative.jsObjectGet(jsObj, 'confirmationRequired');
  object.enUS = IsarNative.jsObjectGet(jsObj, 'enUS');
  object.esES = IsarNative.jsObjectGet(jsObj, 'esES');
  object.flowCode = IsarNative.jsObjectGet(jsObj, 'flowCode');
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.marketType = IsarNative.jsObjectGet(jsObj, 'marketType');
  object.operationType = IsarNative.jsObjectGet(jsObj, 'operationType');
  object.plantCode = IsarNative.jsObjectGet(jsObj, 'plantCode');
  object.ptBR = IsarNative.jsObjectGet(jsObj, 'ptBR');
  object.questionId = IsarNative.jsObjectGet(jsObj, 'questionId');
  object.required = IsarNative.jsObjectGet(jsObj, 'required');
  object.sequence = IsarNative.jsObjectGet(jsObj, 'sequence');
  object.validationType = IsarNative.jsObjectGet(jsObj, 'validationType');
  return object;
}

P _isarQuestionEntityDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'classRisk':
      return (IsarNative.jsObjectGet(jsObj, 'classRisk')) as P;
    case 'confirmationRequired':
      return (IsarNative.jsObjectGet(jsObj, 'confirmationRequired')) as P;
    case 'enUS':
      return (IsarNative.jsObjectGet(jsObj, 'enUS')) as P;
    case 'esES':
      return (IsarNative.jsObjectGet(jsObj, 'esES')) as P;
    case 'flowCode':
      return (IsarNative.jsObjectGet(jsObj, 'flowCode')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'marketType':
      return (IsarNative.jsObjectGet(jsObj, 'marketType')) as P;
    case 'operationType':
      return (IsarNative.jsObjectGet(jsObj, 'operationType')) as P;
    case 'plantCode':
      return (IsarNative.jsObjectGet(jsObj, 'plantCode')) as P;
    case 'ptBR':
      return (IsarNative.jsObjectGet(jsObj, 'ptBR')) as P;
    case 'questionId':
      return (IsarNative.jsObjectGet(jsObj, 'questionId')) as P;
    case 'required':
      return (IsarNative.jsObjectGet(jsObj, 'required')) as P;
    case 'sequence':
      return (IsarNative.jsObjectGet(jsObj, 'sequence')) as P;
    case 'validationType':
      return (IsarNative.jsObjectGet(jsObj, 'validationType')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarQuestionEntityAttachLinks(
    IsarCollection col, int id, IsarQuestionEntity object) {}

extension IsarQuestionEntityQueryWhereSort
    on QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QWhere> {
  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarQuestionEntityQueryWhere
    on QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QWhereClause> {
  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterWhereClause>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterWhereClause>
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

extension IsarQuestionEntityQueryFilter
    on QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QFilterCondition> {
  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      classRiskIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'classRisk',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      classRiskEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'classRisk',
      value: value,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      confirmationRequiredIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'confirmationRequired',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      confirmationRequiredEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'confirmationRequired',
      value: value,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      enUSIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'enUS',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      enUSEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'enUS',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      enUSGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'enUS',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      enUSLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'enUS',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      enUSBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'enUS',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      enUSStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'enUS',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      enUSEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'enUS',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      enUSContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'enUS',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      enUSMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'enUS',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      esESIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'esES',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      esESEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'esES',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      esESGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'esES',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      esESLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'esES',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      esESBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'esES',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      esESStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'esES',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      esESEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'esES',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      esESContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'esES',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      esESMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'esES',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      flowCodeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'flowCode',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      flowCodeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'flowCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      flowCodeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'flowCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      marketTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'marketType',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      marketTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'marketType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      marketTypeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'marketType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      marketTypeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'marketType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      marketTypeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'marketType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      marketTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'marketType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      marketTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'marketType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      marketTypeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'marketType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      marketTypeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'marketType',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      operationTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'operationType',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      operationTypeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'operationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      operationTypeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'operationType',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      plantCodeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'plantCode',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      plantCodeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'plantCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      plantCodeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'plantCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      ptBRIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'ptBR',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      ptBREqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'ptBR',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      ptBRGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'ptBR',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      ptBRLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'ptBR',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      ptBRBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'ptBR',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      ptBRStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'ptBR',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      ptBREndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'ptBR',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      ptBRContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'ptBR',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      ptBRMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'ptBR',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      questionIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'questionId',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      questionIdEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'questionId',
      value: value,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      questionIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'questionId',
      value: value,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      questionIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'questionId',
      value: value,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      questionIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'questionId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      requiredIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'required',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      requiredEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'required',
      value: value,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      sequenceIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'sequence',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      sequenceGreaterThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'sequence',
      value: value,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      sequenceLessThan(double? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'sequence',
      value: value,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      sequenceBetween(double? lower, double? upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sequence',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      validationTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'validationType',
      value: null,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      validationTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'validationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      validationTypeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'validationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      validationTypeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'validationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      validationTypeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'validationType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      validationTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'validationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      validationTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'validationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      validationTypeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'validationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterFilterCondition>
      validationTypeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'validationType',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarQuestionEntityQueryLinks
    on QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QFilterCondition> {}

extension IsarQuestionEntityQueryWhereSortBy
    on QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QSortBy> {
  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByClassRisk() {
    return addSortByInternal('classRisk', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByClassRiskDesc() {
    return addSortByInternal('classRisk', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByConfirmationRequired() {
    return addSortByInternal('confirmationRequired', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByConfirmationRequiredDesc() {
    return addSortByInternal('confirmationRequired', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByEnUS() {
    return addSortByInternal('enUS', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByEnUSDesc() {
    return addSortByInternal('enUS', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByEsES() {
    return addSortByInternal('esES', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByEsESDesc() {
    return addSortByInternal('esES', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByFlowCode() {
    return addSortByInternal('flowCode', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByFlowCodeDesc() {
    return addSortByInternal('flowCode', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByMarketType() {
    return addSortByInternal('marketType', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByMarketTypeDesc() {
    return addSortByInternal('marketType', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByOperationType() {
    return addSortByInternal('operationType', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByOperationTypeDesc() {
    return addSortByInternal('operationType', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByPlantCode() {
    return addSortByInternal('plantCode', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByPlantCodeDesc() {
    return addSortByInternal('plantCode', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByPtBR() {
    return addSortByInternal('ptBR', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByPtBRDesc() {
    return addSortByInternal('ptBR', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByQuestionId() {
    return addSortByInternal('questionId', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByQuestionIdDesc() {
    return addSortByInternal('questionId', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByRequired() {
    return addSortByInternal('required', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByRequiredDesc() {
    return addSortByInternal('required', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortBySequence() {
    return addSortByInternal('sequence', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortBySequenceDesc() {
    return addSortByInternal('sequence', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByValidationType() {
    return addSortByInternal('validationType', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      sortByValidationTypeDesc() {
    return addSortByInternal('validationType', Sort.desc);
  }
}

extension IsarQuestionEntityQueryWhereSortThenBy
    on QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QSortThenBy> {
  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByClassRisk() {
    return addSortByInternal('classRisk', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByClassRiskDesc() {
    return addSortByInternal('classRisk', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByConfirmationRequired() {
    return addSortByInternal('confirmationRequired', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByConfirmationRequiredDesc() {
    return addSortByInternal('confirmationRequired', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByEnUS() {
    return addSortByInternal('enUS', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByEnUSDesc() {
    return addSortByInternal('enUS', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByEsES() {
    return addSortByInternal('esES', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByEsESDesc() {
    return addSortByInternal('esES', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByFlowCode() {
    return addSortByInternal('flowCode', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByFlowCodeDesc() {
    return addSortByInternal('flowCode', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByMarketType() {
    return addSortByInternal('marketType', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByMarketTypeDesc() {
    return addSortByInternal('marketType', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByOperationType() {
    return addSortByInternal('operationType', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByOperationTypeDesc() {
    return addSortByInternal('operationType', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByPlantCode() {
    return addSortByInternal('plantCode', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByPlantCodeDesc() {
    return addSortByInternal('plantCode', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByPtBR() {
    return addSortByInternal('ptBR', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByPtBRDesc() {
    return addSortByInternal('ptBR', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByQuestionId() {
    return addSortByInternal('questionId', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByQuestionIdDesc() {
    return addSortByInternal('questionId', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByRequired() {
    return addSortByInternal('required', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByRequiredDesc() {
    return addSortByInternal('required', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenBySequence() {
    return addSortByInternal('sequence', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenBySequenceDesc() {
    return addSortByInternal('sequence', Sort.desc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByValidationType() {
    return addSortByInternal('validationType', Sort.asc);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QAfterSortBy>
      thenByValidationTypeDesc() {
    return addSortByInternal('validationType', Sort.desc);
  }
}

extension IsarQuestionEntityQueryWhereDistinct
    on QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct> {
  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctByClassRisk() {
    return addDistinctByInternal('classRisk');
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctByConfirmationRequired() {
    return addDistinctByInternal('confirmationRequired');
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctByEnUS({bool caseSensitive = true}) {
    return addDistinctByInternal('enUS', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctByEsES({bool caseSensitive = true}) {
    return addDistinctByInternal('esES', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctByFlowCode({bool caseSensitive = true}) {
    return addDistinctByInternal('flowCode', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctByMarketType({bool caseSensitive = true}) {
    return addDistinctByInternal('marketType', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctByOperationType({bool caseSensitive = true}) {
    return addDistinctByInternal('operationType', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctByPlantCode({bool caseSensitive = true}) {
    return addDistinctByInternal('plantCode', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctByPtBR({bool caseSensitive = true}) {
    return addDistinctByInternal('ptBR', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctByQuestionId() {
    return addDistinctByInternal('questionId');
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctByRequired() {
    return addDistinctByInternal('required');
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctBySequence() {
    return addDistinctByInternal('sequence');
  }

  QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QDistinct>
      distinctByValidationType({bool caseSensitive = true}) {
    return addDistinctByInternal('validationType',
        caseSensitive: caseSensitive);
  }
}

extension IsarQuestionEntityQueryProperty
    on QueryBuilder<IsarQuestionEntity, IsarQuestionEntity, QQueryProperty> {
  QueryBuilder<IsarQuestionEntity, bool?, QQueryOperations>
      classRiskProperty() {
    return addPropertyNameInternal('classRisk');
  }

  QueryBuilder<IsarQuestionEntity, bool?, QQueryOperations>
      confirmationRequiredProperty() {
    return addPropertyNameInternal('confirmationRequired');
  }

  QueryBuilder<IsarQuestionEntity, String?, QQueryOperations> enUSProperty() {
    return addPropertyNameInternal('enUS');
  }

  QueryBuilder<IsarQuestionEntity, String?, QQueryOperations> esESProperty() {
    return addPropertyNameInternal('esES');
  }

  QueryBuilder<IsarQuestionEntity, String?, QQueryOperations>
      flowCodeProperty() {
    return addPropertyNameInternal('flowCode');
  }

  QueryBuilder<IsarQuestionEntity, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarQuestionEntity, String?, QQueryOperations>
      marketTypeProperty() {
    return addPropertyNameInternal('marketType');
  }

  QueryBuilder<IsarQuestionEntity, String?, QQueryOperations>
      operationTypeProperty() {
    return addPropertyNameInternal('operationType');
  }

  QueryBuilder<IsarQuestionEntity, String?, QQueryOperations>
      plantCodeProperty() {
    return addPropertyNameInternal('plantCode');
  }

  QueryBuilder<IsarQuestionEntity, String?, QQueryOperations> ptBRProperty() {
    return addPropertyNameInternal('ptBR');
  }

  QueryBuilder<IsarQuestionEntity, int?, QQueryOperations>
      questionIdProperty() {
    return addPropertyNameInternal('questionId');
  }

  QueryBuilder<IsarQuestionEntity, bool?, QQueryOperations> requiredProperty() {
    return addPropertyNameInternal('required');
  }

  QueryBuilder<IsarQuestionEntity, double?, QQueryOperations>
      sequenceProperty() {
    return addPropertyNameInternal('sequence');
  }

  QueryBuilder<IsarQuestionEntity, String?, QQueryOperations>
      validationTypeProperty() {
    return addPropertyNameInternal('validationType');
  }
}
