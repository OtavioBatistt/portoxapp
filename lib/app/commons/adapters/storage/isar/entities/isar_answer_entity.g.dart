// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_answer_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarAnswerEntityCollection on Isar {
  IsarCollection<IsarAnswerEntity> get isarAnswerEntitys => getCollection();
}

const IsarAnswerEntitySchema = CollectionSchema(
  name: 'IsarAnswerEntity',
  schema:
      '{"name":"IsarAnswerEntity","idName":"id","properties":[{"name":"answerId","type":"String"},{"name":"code","type":"String"},{"name":"enUS","type":"String"},{"name":"esES","type":"String"},{"name":"itemId","type":"Long"},{"name":"plantCode","type":"String"},{"name":"ptBR","type":"String"},{"name":"validationType","type":"String"},{"name":"warehouseCode","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'answerId': 0,
    'code': 1,
    'enUS': 2,
    'esES': 3,
    'itemId': 4,
    'plantCode': 5,
    'ptBR': 6,
    'validationType': 7,
    'warehouseCode': 8
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarAnswerEntityGetId,
  setId: _isarAnswerEntitySetId,
  getLinks: _isarAnswerEntityGetLinks,
  attachLinks: _isarAnswerEntityAttachLinks,
  serializeNative: _isarAnswerEntitySerializeNative,
  deserializeNative: _isarAnswerEntityDeserializeNative,
  deserializePropNative: _isarAnswerEntityDeserializePropNative,
  serializeWeb: _isarAnswerEntitySerializeWeb,
  deserializeWeb: _isarAnswerEntityDeserializeWeb,
  deserializePropWeb: _isarAnswerEntityDeserializePropWeb,
  version: 3,
);

int? _isarAnswerEntityGetId(IsarAnswerEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarAnswerEntitySetId(IsarAnswerEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarAnswerEntityGetLinks(IsarAnswerEntity object) {
  return [];
}

void _isarAnswerEntitySerializeNative(
    IsarCollection<IsarAnswerEntity> collection,
    IsarRawObject rawObj,
    IsarAnswerEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.answerId;
  IsarUint8List? _answerId;
  if (value0 != null) {
    _answerId = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_answerId?.length ?? 0) as int;
  final value1 = object.code;
  IsarUint8List? _code;
  if (value1 != null) {
    _code = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_code?.length ?? 0) as int;
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
  final value4 = object.itemId;
  final _itemId = value4;
  final value5 = object.plantCode;
  IsarUint8List? _plantCode;
  if (value5 != null) {
    _plantCode = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_plantCode?.length ?? 0) as int;
  final value6 = object.ptBR;
  IsarUint8List? _ptBR;
  if (value6 != null) {
    _ptBR = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (_ptBR?.length ?? 0) as int;
  final value7 = object.validationType;
  IsarUint8List? _validationType;
  if (value7 != null) {
    _validationType = IsarBinaryWriter.utf8Encoder.convert(value7);
  }
  dynamicSize += (_validationType?.length ?? 0) as int;
  final value8 = object.warehouseCode;
  IsarUint8List? _warehouseCode;
  if (value8 != null) {
    _warehouseCode = IsarBinaryWriter.utf8Encoder.convert(value8);
  }
  dynamicSize += (_warehouseCode?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _answerId);
  writer.writeBytes(offsets[1], _code);
  writer.writeBytes(offsets[2], _enUS);
  writer.writeBytes(offsets[3], _esES);
  writer.writeLong(offsets[4], _itemId);
  writer.writeBytes(offsets[5], _plantCode);
  writer.writeBytes(offsets[6], _ptBR);
  writer.writeBytes(offsets[7], _validationType);
  writer.writeBytes(offsets[8], _warehouseCode);
}

IsarAnswerEntity _isarAnswerEntityDeserializeNative(
    IsarCollection<IsarAnswerEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarAnswerEntity();
  object.answerId = reader.readStringOrNull(offsets[0]);
  object.code = reader.readStringOrNull(offsets[1]);
  object.enUS = reader.readStringOrNull(offsets[2]);
  object.esES = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.itemId = reader.readLongOrNull(offsets[4]);
  object.plantCode = reader.readStringOrNull(offsets[5]);
  object.ptBR = reader.readStringOrNull(offsets[6]);
  object.validationType = reader.readStringOrNull(offsets[7]);
  object.warehouseCode = reader.readStringOrNull(offsets[8]);
  return object;
}

P _isarAnswerEntityDeserializePropNative<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarAnswerEntitySerializeWeb(
    IsarCollection<IsarAnswerEntity> collection, IsarAnswerEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'answerId', object.answerId);
  IsarNative.jsObjectSet(jsObj, 'code', object.code);
  IsarNative.jsObjectSet(jsObj, 'enUS', object.enUS);
  IsarNative.jsObjectSet(jsObj, 'esES', object.esES);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'itemId', object.itemId);
  IsarNative.jsObjectSet(jsObj, 'plantCode', object.plantCode);
  IsarNative.jsObjectSet(jsObj, 'ptBR', object.ptBR);
  IsarNative.jsObjectSet(jsObj, 'validationType', object.validationType);
  IsarNative.jsObjectSet(jsObj, 'warehouseCode', object.warehouseCode);
  return jsObj;
}

IsarAnswerEntity _isarAnswerEntityDeserializeWeb(
    IsarCollection<IsarAnswerEntity> collection, dynamic jsObj) {
  final object = IsarAnswerEntity();
  object.answerId = IsarNative.jsObjectGet(jsObj, 'answerId');
  object.code = IsarNative.jsObjectGet(jsObj, 'code');
  object.enUS = IsarNative.jsObjectGet(jsObj, 'enUS');
  object.esES = IsarNative.jsObjectGet(jsObj, 'esES');
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.itemId = IsarNative.jsObjectGet(jsObj, 'itemId');
  object.plantCode = IsarNative.jsObjectGet(jsObj, 'plantCode');
  object.ptBR = IsarNative.jsObjectGet(jsObj, 'ptBR');
  object.validationType = IsarNative.jsObjectGet(jsObj, 'validationType');
  object.warehouseCode = IsarNative.jsObjectGet(jsObj, 'warehouseCode');
  return object;
}

P _isarAnswerEntityDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'answerId':
      return (IsarNative.jsObjectGet(jsObj, 'answerId')) as P;
    case 'code':
      return (IsarNative.jsObjectGet(jsObj, 'code')) as P;
    case 'enUS':
      return (IsarNative.jsObjectGet(jsObj, 'enUS')) as P;
    case 'esES':
      return (IsarNative.jsObjectGet(jsObj, 'esES')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'itemId':
      return (IsarNative.jsObjectGet(jsObj, 'itemId')) as P;
    case 'plantCode':
      return (IsarNative.jsObjectGet(jsObj, 'plantCode')) as P;
    case 'ptBR':
      return (IsarNative.jsObjectGet(jsObj, 'ptBR')) as P;
    case 'validationType':
      return (IsarNative.jsObjectGet(jsObj, 'validationType')) as P;
    case 'warehouseCode':
      return (IsarNative.jsObjectGet(jsObj, 'warehouseCode')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarAnswerEntityAttachLinks(
    IsarCollection col, int id, IsarAnswerEntity object) {}

extension IsarAnswerEntityQueryWhereSort
    on QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QWhere> {
  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarAnswerEntityQueryWhere
    on QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QWhereClause> {
  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterWhereClause>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterWhereClause> idBetween(
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

extension IsarAnswerEntityQueryFilter
    on QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QFilterCondition> {
  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      answerIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'answerId',
      value: null,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      answerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'answerId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      answerIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'answerId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      answerIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'answerId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      answerIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'answerId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      answerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'answerId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      answerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'answerId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      answerIdContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'answerId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      answerIdMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'answerId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      codeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'code',
      value: null,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      codeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      codeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      codeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      codeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'code',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      codeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      codeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      codeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'code',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      codeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'code',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      enUSIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'enUS',
      value: null,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      enUSContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'enUS',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      enUSMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'enUS',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      esESIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'esES',
      value: null,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      esESContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'esES',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      esESMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'esES',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      itemIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'itemId',
      value: null,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      itemIdEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'itemId',
      value: value,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      itemIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'itemId',
      value: value,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      itemIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'itemId',
      value: value,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      itemIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'itemId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      plantCodeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'plantCode',
      value: null,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      plantCodeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'plantCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      plantCodeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'plantCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      ptBRIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'ptBR',
      value: null,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      ptBRContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'ptBR',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      ptBRMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'ptBR',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      validationTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'validationType',
      value: null,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      validationTypeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'validationType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      validationTypeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'validationType',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      warehouseCodeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'warehouseCode',
      value: null,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      warehouseCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'warehouseCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      warehouseCodeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'warehouseCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      warehouseCodeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'warehouseCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      warehouseCodeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'warehouseCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      warehouseCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'warehouseCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      warehouseCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'warehouseCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      warehouseCodeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'warehouseCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterFilterCondition>
      warehouseCodeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'warehouseCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension IsarAnswerEntityQueryLinks
    on QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QFilterCondition> {}

extension IsarAnswerEntityQueryWhereSortBy
    on QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QSortBy> {
  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByAnswerId() {
    return addSortByInternal('answerId', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByAnswerIdDesc() {
    return addSortByInternal('answerId', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy> sortByCode() {
    return addSortByInternal('code', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByCodeDesc() {
    return addSortByInternal('code', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy> sortByEnUS() {
    return addSortByInternal('enUS', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByEnUSDesc() {
    return addSortByInternal('enUS', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy> sortByEsES() {
    return addSortByInternal('esES', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByEsESDesc() {
    return addSortByInternal('esES', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByItemId() {
    return addSortByInternal('itemId', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByItemIdDesc() {
    return addSortByInternal('itemId', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByPlantCode() {
    return addSortByInternal('plantCode', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByPlantCodeDesc() {
    return addSortByInternal('plantCode', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy> sortByPtBR() {
    return addSortByInternal('ptBR', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByPtBRDesc() {
    return addSortByInternal('ptBR', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByValidationType() {
    return addSortByInternal('validationType', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByValidationTypeDesc() {
    return addSortByInternal('validationType', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByWarehouseCode() {
    return addSortByInternal('warehouseCode', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      sortByWarehouseCodeDesc() {
    return addSortByInternal('warehouseCode', Sort.desc);
  }
}

extension IsarAnswerEntityQueryWhereSortThenBy
    on QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QSortThenBy> {
  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByAnswerId() {
    return addSortByInternal('answerId', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByAnswerIdDesc() {
    return addSortByInternal('answerId', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy> thenByCode() {
    return addSortByInternal('code', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByCodeDesc() {
    return addSortByInternal('code', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy> thenByEnUS() {
    return addSortByInternal('enUS', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByEnUSDesc() {
    return addSortByInternal('enUS', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy> thenByEsES() {
    return addSortByInternal('esES', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByEsESDesc() {
    return addSortByInternal('esES', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByItemId() {
    return addSortByInternal('itemId', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByItemIdDesc() {
    return addSortByInternal('itemId', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByPlantCode() {
    return addSortByInternal('plantCode', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByPlantCodeDesc() {
    return addSortByInternal('plantCode', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy> thenByPtBR() {
    return addSortByInternal('ptBR', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByPtBRDesc() {
    return addSortByInternal('ptBR', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByValidationType() {
    return addSortByInternal('validationType', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByValidationTypeDesc() {
    return addSortByInternal('validationType', Sort.desc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByWarehouseCode() {
    return addSortByInternal('warehouseCode', Sort.asc);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QAfterSortBy>
      thenByWarehouseCodeDesc() {
    return addSortByInternal('warehouseCode', Sort.desc);
  }
}

extension IsarAnswerEntityQueryWhereDistinct
    on QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QDistinct> {
  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QDistinct>
      distinctByAnswerId({bool caseSensitive = true}) {
    return addDistinctByInternal('answerId', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QDistinct> distinctByCode(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('code', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QDistinct> distinctByEnUS(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('enUS', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QDistinct> distinctByEsES(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('esES', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QDistinct>
      distinctByItemId() {
    return addDistinctByInternal('itemId');
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QDistinct>
      distinctByPlantCode({bool caseSensitive = true}) {
    return addDistinctByInternal('plantCode', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QDistinct> distinctByPtBR(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('ptBR', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QDistinct>
      distinctByValidationType({bool caseSensitive = true}) {
    return addDistinctByInternal('validationType',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QDistinct>
      distinctByWarehouseCode({bool caseSensitive = true}) {
    return addDistinctByInternal('warehouseCode', caseSensitive: caseSensitive);
  }
}

extension IsarAnswerEntityQueryProperty
    on QueryBuilder<IsarAnswerEntity, IsarAnswerEntity, QQueryProperty> {
  QueryBuilder<IsarAnswerEntity, String?, QQueryOperations> answerIdProperty() {
    return addPropertyNameInternal('answerId');
  }

  QueryBuilder<IsarAnswerEntity, String?, QQueryOperations> codeProperty() {
    return addPropertyNameInternal('code');
  }

  QueryBuilder<IsarAnswerEntity, String?, QQueryOperations> enUSProperty() {
    return addPropertyNameInternal('enUS');
  }

  QueryBuilder<IsarAnswerEntity, String?, QQueryOperations> esESProperty() {
    return addPropertyNameInternal('esES');
  }

  QueryBuilder<IsarAnswerEntity, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarAnswerEntity, int?, QQueryOperations> itemIdProperty() {
    return addPropertyNameInternal('itemId');
  }

  QueryBuilder<IsarAnswerEntity, String?, QQueryOperations>
      plantCodeProperty() {
    return addPropertyNameInternal('plantCode');
  }

  QueryBuilder<IsarAnswerEntity, String?, QQueryOperations> ptBRProperty() {
    return addPropertyNameInternal('ptBR');
  }

  QueryBuilder<IsarAnswerEntity, String?, QQueryOperations>
      validationTypeProperty() {
    return addPropertyNameInternal('validationType');
  }

  QueryBuilder<IsarAnswerEntity, String?, QQueryOperations>
      warehouseCodeProperty() {
    return addPropertyNameInternal('warehouseCode');
  }
}
