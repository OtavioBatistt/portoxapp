class PlantEntity {
  PlantEntity(this.code, this.description);

  final String code;
  final String description;

  static PlantEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return PlantEntity(
      map['plant_code'],
      map['plant_descr'],
    );
  }
}
