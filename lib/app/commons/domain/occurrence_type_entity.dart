class OccurrenceTypeEntity {
  const OccurrenceTypeEntity({
    this.id = '',
    this.classificId = 0,
    this.classificCodePt = '',
    this.classificCodeUs = '',
    this.classificCodeEs = '',
    this.profileCode = '',
    this.profileName = '',
    this.required = false,
    this.operationType = '',
  });
  final String id;
  final int classificId;
  final String classificCodePt;
  final String classificCodeUs;
  final String classificCodeEs;
  final String profileCode;
  final String profileName;
  final bool required;
  final String operationType;

  static OccurrenceTypeEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return OccurrenceTypeEntity(
      id: map['id'] ?? '',
      classificId: map['occurr_classific_id'] ?? 0,
      classificCodePt: map['occurr_classific_code_pt'] ?? '',
      classificCodeUs: map['occurr_classific_code_us'] ?? '',
      classificCodeEs: map['occurr_classific_code_es'] ?? '',
      profileCode: map['profile_code'] ?? '',
      profileName: map['profile_name'] ?? '',
      required: map['required'] ?? false,
      operationType: map['operation_type'] ?? '',
    );
  }
}
