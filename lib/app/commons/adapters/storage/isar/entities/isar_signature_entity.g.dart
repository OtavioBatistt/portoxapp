// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_signature_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIsarSignatureEntityCollection on Isar {
  IsarCollection<IsarSignatureEntity> get isarSignatureEntitys =>
      getCollection();
}

const IsarSignatureEntitySchema = CollectionSchema(
  name: 'IsarSignatureEntity',
  schema:
      '{"name":"IsarSignatureEntity","idName":"id","properties":[{"name":"docSignatureId","type":"Long"},{"name":"flowCode","type":"String"},{"name":"loadType","type":"String"},{"name":"operation","type":"String"},{"name":"required","type":"Bool"},{"name":"responsibleEs","type":"String"},{"name":"responsiblePt","type":"String"},{"name":"responsibleUs","type":"String"},{"name":"sequence","type":"Long"},{"name":"signatureId","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {
    'docSignatureId': 0,
    'flowCode': 1,
    'loadType': 2,
    'operation': 3,
    'required': 4,
    'responsibleEs': 5,
    'responsiblePt': 6,
    'responsibleUs': 7,
    'sequence': 8,
    'signatureId': 9
  },
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _isarSignatureEntityGetId,
  setId: _isarSignatureEntitySetId,
  getLinks: _isarSignatureEntityGetLinks,
  attachLinks: _isarSignatureEntityAttachLinks,
  serializeNative: _isarSignatureEntitySerializeNative,
  deserializeNative: _isarSignatureEntityDeserializeNative,
  deserializePropNative: _isarSignatureEntityDeserializePropNative,
  serializeWeb: _isarSignatureEntitySerializeWeb,
  deserializeWeb: _isarSignatureEntityDeserializeWeb,
  deserializePropWeb: _isarSignatureEntityDeserializePropWeb,
  version: 3,
);

int? _isarSignatureEntityGetId(IsarSignatureEntity object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _isarSignatureEntitySetId(IsarSignatureEntity object, int id) {
  object.id = id;
}

List<IsarLinkBase> _isarSignatureEntityGetLinks(IsarSignatureEntity object) {
  return [];
}

void _isarSignatureEntitySerializeNative(
    IsarCollection<IsarSignatureEntity> collection,
    IsarRawObject rawObj,
    IsarSignatureEntity object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.docSignatureId;
  final _docSignatureId = value0;
  final value1 = object.flowCode;
  IsarUint8List? _flowCode;
  if (value1 != null) {
    _flowCode = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_flowCode?.length ?? 0) as int;
  final value2 = object.loadType;
  IsarUint8List? _loadType;
  if (value2 != null) {
    _loadType = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_loadType?.length ?? 0) as int;
  final value3 = object.operation;
  IsarUint8List? _operation;
  if (value3 != null) {
    _operation = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_operation?.length ?? 0) as int;
  final value4 = object.required;
  final _required = value4;
  final value5 = object.responsibleEs;
  IsarUint8List? _responsibleEs;
  if (value5 != null) {
    _responsibleEs = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_responsibleEs?.length ?? 0) as int;
  final value6 = object.responsiblePt;
  IsarUint8List? _responsiblePt;
  if (value6 != null) {
    _responsiblePt = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (_responsiblePt?.length ?? 0) as int;
  final value7 = object.responsibleUs;
  IsarUint8List? _responsibleUs;
  if (value7 != null) {
    _responsibleUs = IsarBinaryWriter.utf8Encoder.convert(value7);
  }
  dynamicSize += (_responsibleUs?.length ?? 0) as int;
  final value8 = object.sequence;
  final _sequence = value8;
  final value9 = object.signatureId;
  final _signatureId = value9;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _docSignatureId);
  writer.writeBytes(offsets[1], _flowCode);
  writer.writeBytes(offsets[2], _loadType);
  writer.writeBytes(offsets[3], _operation);
  writer.writeBool(offsets[4], _required);
  writer.writeBytes(offsets[5], _responsibleEs);
  writer.writeBytes(offsets[6], _responsiblePt);
  writer.writeBytes(offsets[7], _responsibleUs);
  writer.writeLong(offsets[8], _sequence);
  writer.writeLong(offsets[9], _signatureId);
}

IsarSignatureEntity _isarSignatureEntityDeserializeNative(
    IsarCollection<IsarSignatureEntity> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = IsarSignatureEntity();
  object.docSignatureId = reader.readLongOrNull(offsets[0]);
  object.flowCode = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.loadType = reader.readStringOrNull(offsets[2]);
  object.operation = reader.readStringOrNull(offsets[3]);
  object.required = reader.readBoolOrNull(offsets[4]);
  object.responsibleEs = reader.readStringOrNull(offsets[5]);
  object.responsiblePt = reader.readStringOrNull(offsets[6]);
  object.responsibleUs = reader.readStringOrNull(offsets[7]);
  object.sequence = reader.readLongOrNull(offsets[8]);
  object.signatureId = reader.readLongOrNull(offsets[9]);
  return object;
}

P _isarSignatureEntityDeserializePropNative<P>(
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
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _isarSignatureEntitySerializeWeb(
    IsarCollection<IsarSignatureEntity> collection,
    IsarSignatureEntity object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'docSignatureId', object.docSignatureId);
  IsarNative.jsObjectSet(jsObj, 'flowCode', object.flowCode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'loadType', object.loadType);
  IsarNative.jsObjectSet(jsObj, 'operation', object.operation);
  IsarNative.jsObjectSet(jsObj, 'required', object.required);
  IsarNative.jsObjectSet(jsObj, 'responsibleEs', object.responsibleEs);
  IsarNative.jsObjectSet(jsObj, 'responsiblePt', object.responsiblePt);
  IsarNative.jsObjectSet(jsObj, 'responsibleUs', object.responsibleUs);
  IsarNative.jsObjectSet(jsObj, 'sequence', object.sequence);
  IsarNative.jsObjectSet(jsObj, 'signatureId', object.signatureId);
  return jsObj;
}

IsarSignatureEntity _isarSignatureEntityDeserializeWeb(
    IsarCollection<IsarSignatureEntity> collection, dynamic jsObj) {
  final object = IsarSignatureEntity();
  object.docSignatureId = IsarNative.jsObjectGet(jsObj, 'docSignatureId');
  object.flowCode = IsarNative.jsObjectGet(jsObj, 'flowCode');
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.loadType = IsarNative.jsObjectGet(jsObj, 'loadType');
  object.operation = IsarNative.jsObjectGet(jsObj, 'operation');
  object.required = IsarNative.jsObjectGet(jsObj, 'required');
  object.responsibleEs = IsarNative.jsObjectGet(jsObj, 'responsibleEs');
  object.responsiblePt = IsarNative.jsObjectGet(jsObj, 'responsiblePt');
  object.responsibleUs = IsarNative.jsObjectGet(jsObj, 'responsibleUs');
  object.sequence = IsarNative.jsObjectGet(jsObj, 'sequence');
  object.signatureId = IsarNative.jsObjectGet(jsObj, 'signatureId');
  return object;
}

P _isarSignatureEntityDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'docSignatureId':
      return (IsarNative.jsObjectGet(jsObj, 'docSignatureId')) as P;
    case 'flowCode':
      return (IsarNative.jsObjectGet(jsObj, 'flowCode')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'loadType':
      return (IsarNative.jsObjectGet(jsObj, 'loadType')) as P;
    case 'operation':
      return (IsarNative.jsObjectGet(jsObj, 'operation')) as P;
    case 'required':
      return (IsarNative.jsObjectGet(jsObj, 'required')) as P;
    case 'responsibleEs':
      return (IsarNative.jsObjectGet(jsObj, 'responsibleEs')) as P;
    case 'responsiblePt':
      return (IsarNative.jsObjectGet(jsObj, 'responsiblePt')) as P;
    case 'responsibleUs':
      return (IsarNative.jsObjectGet(jsObj, 'responsibleUs')) as P;
    case 'sequence':
      return (IsarNative.jsObjectGet(jsObj, 'sequence')) as P;
    case 'signatureId':
      return (IsarNative.jsObjectGet(jsObj, 'signatureId')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _isarSignatureEntityAttachLinks(
    IsarCollection col, int id, IsarSignatureEntity object) {}

extension IsarSignatureEntityQueryWhereSort
    on QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QWhere> {
  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IsarSignatureEntityQueryWhere
    on QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QWhereClause> {
  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterWhereClause>
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

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterWhereClause>
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

extension IsarSignatureEntityQueryFilter on QueryBuilder<IsarSignatureEntity,
    IsarSignatureEntity, QFilterCondition> {
  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      docSignatureIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'docSignatureId',
      value: null,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      docSignatureIdEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'docSignatureId',
      value: value,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      docSignatureIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'docSignatureId',
      value: value,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      docSignatureIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'docSignatureId',
      value: value,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      docSignatureIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'docSignatureId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      flowCodeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'flowCode',
      value: null,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      flowCodeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'flowCode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      flowCodeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'flowCode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
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

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      loadTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'loadType',
      value: null,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      loadTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'loadType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      loadTypeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'loadType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      loadTypeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'loadType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      loadTypeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'loadType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      loadTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'loadType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      loadTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'loadType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      loadTypeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'loadType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      loadTypeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'loadType',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      operationIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'operation',
      value: null,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      operationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'operation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      operationGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'operation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      operationLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'operation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      operationBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'operation',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      operationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'operation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      operationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'operation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      operationContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'operation',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      operationMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'operation',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      requiredIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'required',
      value: null,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      requiredEqualTo(bool? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'required',
      value: value,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleEsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'responsibleEs',
      value: null,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleEsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'responsibleEs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleEsGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'responsibleEs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleEsLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'responsibleEs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleEsBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'responsibleEs',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleEsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'responsibleEs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleEsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'responsibleEs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleEsContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'responsibleEs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleEsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'responsibleEs',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsiblePtIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'responsiblePt',
      value: null,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsiblePtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'responsiblePt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsiblePtGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'responsiblePt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsiblePtLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'responsiblePt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsiblePtBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'responsiblePt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsiblePtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'responsiblePt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsiblePtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'responsiblePt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsiblePtContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'responsiblePt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsiblePtMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'responsiblePt',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleUsIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'responsibleUs',
      value: null,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleUsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'responsibleUs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleUsGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'responsibleUs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleUsLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'responsibleUs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleUsBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'responsibleUs',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleUsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'responsibleUs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleUsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'responsibleUs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleUsContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'responsibleUs',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      responsibleUsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'responsibleUs',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      sequenceIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'sequence',
      value: null,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      sequenceEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'sequence',
      value: value,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      sequenceGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'sequence',
      value: value,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      sequenceLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'sequence',
      value: value,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      sequenceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'sequence',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      signatureIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'signatureId',
      value: null,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      signatureIdEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'signatureId',
      value: value,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      signatureIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'signatureId',
      value: value,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      signatureIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'signatureId',
      value: value,
    ));
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterFilterCondition>
      signatureIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'signatureId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension IsarSignatureEntityQueryLinks on QueryBuilder<IsarSignatureEntity,
    IsarSignatureEntity, QFilterCondition> {}

extension IsarSignatureEntityQueryWhereSortBy
    on QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QSortBy> {
  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByDocSignatureId() {
    return addSortByInternal('docSignatureId', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByDocSignatureIdDesc() {
    return addSortByInternal('docSignatureId', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByFlowCode() {
    return addSortByInternal('flowCode', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByFlowCodeDesc() {
    return addSortByInternal('flowCode', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByLoadType() {
    return addSortByInternal('loadType', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByLoadTypeDesc() {
    return addSortByInternal('loadType', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByOperation() {
    return addSortByInternal('operation', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByOperationDesc() {
    return addSortByInternal('operation', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByRequired() {
    return addSortByInternal('required', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByRequiredDesc() {
    return addSortByInternal('required', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByResponsibleEs() {
    return addSortByInternal('responsibleEs', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByResponsibleEsDesc() {
    return addSortByInternal('responsibleEs', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByResponsiblePt() {
    return addSortByInternal('responsiblePt', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByResponsiblePtDesc() {
    return addSortByInternal('responsiblePt', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByResponsibleUs() {
    return addSortByInternal('responsibleUs', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortByResponsibleUsDesc() {
    return addSortByInternal('responsibleUs', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortBySequence() {
    return addSortByInternal('sequence', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortBySequenceDesc() {
    return addSortByInternal('sequence', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortBySignatureId() {
    return addSortByInternal('signatureId', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      sortBySignatureIdDesc() {
    return addSortByInternal('signatureId', Sort.desc);
  }
}

extension IsarSignatureEntityQueryWhereSortThenBy
    on QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QSortThenBy> {
  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByDocSignatureId() {
    return addSortByInternal('docSignatureId', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByDocSignatureIdDesc() {
    return addSortByInternal('docSignatureId', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByFlowCode() {
    return addSortByInternal('flowCode', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByFlowCodeDesc() {
    return addSortByInternal('flowCode', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByLoadType() {
    return addSortByInternal('loadType', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByLoadTypeDesc() {
    return addSortByInternal('loadType', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByOperation() {
    return addSortByInternal('operation', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByOperationDesc() {
    return addSortByInternal('operation', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByRequired() {
    return addSortByInternal('required', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByRequiredDesc() {
    return addSortByInternal('required', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByResponsibleEs() {
    return addSortByInternal('responsibleEs', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByResponsibleEsDesc() {
    return addSortByInternal('responsibleEs', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByResponsiblePt() {
    return addSortByInternal('responsiblePt', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByResponsiblePtDesc() {
    return addSortByInternal('responsiblePt', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByResponsibleUs() {
    return addSortByInternal('responsibleUs', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenByResponsibleUsDesc() {
    return addSortByInternal('responsibleUs', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenBySequence() {
    return addSortByInternal('sequence', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenBySequenceDesc() {
    return addSortByInternal('sequence', Sort.desc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenBySignatureId() {
    return addSortByInternal('signatureId', Sort.asc);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QAfterSortBy>
      thenBySignatureIdDesc() {
    return addSortByInternal('signatureId', Sort.desc);
  }
}

extension IsarSignatureEntityQueryWhereDistinct
    on QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QDistinct> {
  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QDistinct>
      distinctByDocSignatureId() {
    return addDistinctByInternal('docSignatureId');
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QDistinct>
      distinctByFlowCode({bool caseSensitive = true}) {
    return addDistinctByInternal('flowCode', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QDistinct>
      distinctByLoadType({bool caseSensitive = true}) {
    return addDistinctByInternal('loadType', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QDistinct>
      distinctByOperation({bool caseSensitive = true}) {
    return addDistinctByInternal('operation', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QDistinct>
      distinctByRequired() {
    return addDistinctByInternal('required');
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QDistinct>
      distinctByResponsibleEs({bool caseSensitive = true}) {
    return addDistinctByInternal('responsibleEs', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QDistinct>
      distinctByResponsiblePt({bool caseSensitive = true}) {
    return addDistinctByInternal('responsiblePt', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QDistinct>
      distinctByResponsibleUs({bool caseSensitive = true}) {
    return addDistinctByInternal('responsibleUs', caseSensitive: caseSensitive);
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QDistinct>
      distinctBySequence() {
    return addDistinctByInternal('sequence');
  }

  QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QDistinct>
      distinctBySignatureId() {
    return addDistinctByInternal('signatureId');
  }
}

extension IsarSignatureEntityQueryProperty
    on QueryBuilder<IsarSignatureEntity, IsarSignatureEntity, QQueryProperty> {
  QueryBuilder<IsarSignatureEntity, int?, QQueryOperations>
      docSignatureIdProperty() {
    return addPropertyNameInternal('docSignatureId');
  }

  QueryBuilder<IsarSignatureEntity, String?, QQueryOperations>
      flowCodeProperty() {
    return addPropertyNameInternal('flowCode');
  }

  QueryBuilder<IsarSignatureEntity, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<IsarSignatureEntity, String?, QQueryOperations>
      loadTypeProperty() {
    return addPropertyNameInternal('loadType');
  }

  QueryBuilder<IsarSignatureEntity, String?, QQueryOperations>
      operationProperty() {
    return addPropertyNameInternal('operation');
  }

  QueryBuilder<IsarSignatureEntity, bool?, QQueryOperations>
      requiredProperty() {
    return addPropertyNameInternal('required');
  }

  QueryBuilder<IsarSignatureEntity, String?, QQueryOperations>
      responsibleEsProperty() {
    return addPropertyNameInternal('responsibleEs');
  }

  QueryBuilder<IsarSignatureEntity, String?, QQueryOperations>
      responsiblePtProperty() {
    return addPropertyNameInternal('responsiblePt');
  }

  QueryBuilder<IsarSignatureEntity, String?, QQueryOperations>
      responsibleUsProperty() {
    return addPropertyNameInternal('responsibleUs');
  }

  QueryBuilder<IsarSignatureEntity, int?, QQueryOperations> sequenceProperty() {
    return addPropertyNameInternal('sequence');
  }

  QueryBuilder<IsarSignatureEntity, int?, QQueryOperations>
      signatureIdProperty() {
    return addPropertyNameInternal('signatureId');
  }
}
