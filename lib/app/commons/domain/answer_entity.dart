class AnswerEntity {
  const AnswerEntity({
    this.id = '',
    this.plantCode = '',
    this.validationType = '',
    this.code = '',
    this.ptBR = '',
    this.enUS = '',
    this.esES = '',
    this.warehouseCode = '',
    this.itemId,
  });
  final String id;
  final String plantCode;
  final String validationType;
  final int? itemId;
  final String code;
  final String ptBR;
  final String enUS;
  final String esES;
  final String warehouseCode;

  static AnswerEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return AnswerEntity(
      id: map['id'] ?? '',
      plantCode: map['plant_code'] ?? '',
      ptBR: map['pt_br'] ?? '',
      enUS: map['en_us'] ?? '',
      esES: map['es_es'] ?? '',
      validationType: map['validation_type'] ?? '',
      code: map['code'] != null ? map['code'].toString() : '',
      itemId: map['item_id'],
      warehouseCode:
          map['whse_code'] != null ? map['whse_code'].toString() : '',
    );
  }
}
