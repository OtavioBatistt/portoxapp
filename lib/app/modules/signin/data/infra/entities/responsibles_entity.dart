class ResponsibleEntity {
  const ResponsibleEntity(
    this.functionCode,
    this.functionDescription,
  );

  final String functionCode;
  final String functionDescription;

  static ResponsibleEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return ResponsibleEntity(
      map['function_code'] as String,
      map['function_descr'] as String,
    );
  }

  static List<ResponsibleEntity>? fromList(List<dynamic>? list) {
    if (list == null || list.isEmpty) {
      return null;
    }

    return list
        .map((item) => ResponsibleEntity.fromMap(item as Map<String, dynamic>))
        .whereType<ResponsibleEntity>()
        .toList();
  }
}
