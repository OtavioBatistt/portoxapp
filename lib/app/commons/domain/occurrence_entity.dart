class OccurrenceEntity {
  const OccurrenceEntity({
    this.scheduleNumber = '',
    this.token = '',
    this.createdAt = '',
    this.type = '',
    this.rncNumber = '',
    this.lineId,
    this.comments = '',
    this.sync = false,
  });
  final String scheduleNumber;
  final String token;
  final String createdAt;
  final String type;
  final String rncNumber;
  final int? lineId;
  final String comments;
  final bool sync;

  static OccurrenceEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return OccurrenceEntity(
      scheduleNumber: map['schedule_number'] ?? '',
      token: map['token'] ?? '',
      createdAt: map['created_at'] ?? '',
      type: map['type'] ?? '',
      rncNumber: map['rnc_number'] ?? '',
      lineId: map['line_id'] ?? 0,
      comments: map['comments'] ?? '',
      sync: map['sync'] ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
        'scheduleNumber': scheduleNumber,
        'token': token,
        'createdAt': createdAt,
        'type': type,
        'rncNumber': rncNumber,
        'lineId': lineId,
        'comments': comments,
        'sync': sync,
      };
}
