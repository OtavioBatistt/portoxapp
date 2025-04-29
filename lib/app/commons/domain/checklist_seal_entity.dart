class ChecklistSealEntity {
  ChecklistSealEntity({
    this.code = '',
    this.validated = false,
    this.createdAt = '',
  });
  final String code;
  final bool validated;
  final String createdAt;

  Map<String, dynamic> toMap() => {
        'code': code,
        'validated': validated,
        'createdAt': createdAt,
      };
}
