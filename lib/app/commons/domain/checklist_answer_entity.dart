class ChecklistAnswerEntity {
  ChecklistAnswerEntity({
    this.createdAt = '',
    this.skipped = false,
    this.questionId = 0,
    this.textValue,
    this.lovValue,
    this.radioValue,
    this.numberValue,
  });
  final String? radioValue;
  final String? textValue;
  final String? lovValue;
  final bool skipped;
  final int questionId;
  final int? numberValue;
  final String createdAt;

  Map<String, dynamic> toMap() => {
        'radioValue': radioValue,
        'textValue': textValue,
        'lovValue': lovValue,
        'skipped': skipped,
        'questionId': questionId,
        'numberValue': numberValue,
        'createdAt': createdAt,
      };
}
