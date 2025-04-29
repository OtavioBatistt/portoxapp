class SignatureEntity {
  const SignatureEntity({
    this.id = 0,
    this.required = false,
    this.docSignatureId = 0,
    this.sequence = 0,
    this.responsiblePt = '',
    this.responsibleUs = '',
    this.responsibleEs = '',
    this.flowCode = '',
    this.operation = '',
    this.loadType = '',
  });
  final int id;
  final int docSignatureId;
  final int sequence;
  final String responsiblePt;
  final String responsibleUs;
  final String responsibleEs;
  final bool required;
  final String flowCode;
  final String operation;
  final String loadType;

  static SignatureEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return SignatureEntity(
      id: map['id'] ?? '',
      required: map['required'] ?? false,
      docSignatureId: map['doc_signature_id'] ?? 0,
      sequence: map['seq'] ?? 0,
      responsiblePt: map['responsible_pt'] ?? '',
      responsibleUs: map['responsible_us'] ?? '',
      responsibleEs: map['responsible_es'] ?? '',
      flowCode: map['flow_code'] ?? '',
      operation: map['operation'] ?? '',
      loadType: map['load_type'] ?? '',
    );
  }
}
