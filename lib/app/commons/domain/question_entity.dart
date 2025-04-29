class QuestionEntity {
  const QuestionEntity({
    this.id = '',
    this.questionId = 0,
    this.plantCode = '',
    this.flowCode = '',
    this.operationType = '',
    this.sequence = 0,
    this.ptBR = '',
    this.enUS = '',
    this.esES = '',
    this.validationType = '',
    this.required = false,
    this.confirmationRequired = false,
    this.marketType = '',
    this.classRisk = false,
  });
  final String id;
  final int questionId;
  final String plantCode;
  final String flowCode;
  final String operationType;
  final double sequence;
  final String ptBR;
  final String enUS;
  final String esES;
  final String validationType;
  final bool required;
  final bool confirmationRequired;
  final String marketType;
  final bool classRisk;

  static QuestionEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return QuestionEntity(
      id: map['id'] ?? '',
      questionId: map['question_id'] ?? 0,
      plantCode: map['plant_code'] ?? '',
      flowCode: map['flow_code'] ?? '',
      operationType: map['operation_type'] ?? '',
      sequence: map['seq'] != null ? map['seq'].toDouble() : 0,
      ptBR: map['pt_br'] ?? '',
      enUS: map['en_us'] ?? '',
      esES: map['es_es'] ?? '',
      validationType: map['validation_type'] ?? '',
      required: map['required'] ?? false,
      confirmationRequired: map['confirmation_required'] ?? false,
      marketType: map['market_type'] ?? '',
      classRisk: map['class_risk'] ?? false,
    );
  }
}
