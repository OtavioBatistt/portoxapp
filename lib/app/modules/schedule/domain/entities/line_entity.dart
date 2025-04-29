class LineEntity {
  const LineEntity({
    this.id = 0,
    this.docType = '',
    this.docTypeDescription = '',
    this.orderNumber = '',
    this.freightTerms = '',
    this.entityCode = '',
    this.entityName = '',
    this.expectedDate = '',
    this.window = '',
    this.itemCode = '',
    this.itemDescription = '',
    this.equipmentType = '',
    this.equipmentTypeDescription = '',
    this.uom = '',
    this.location = '',
    this.warehouse = '',
    this.lineNumber = '',
    this.hazardClassCode = '',
    this.hazardClassDescription = '',
    this.unCode = '',
    this.unDescription = '',
    this.compartment,
    this.quantity,
    this.itemId,
    this.leadTime,
  });

  final int id;
  final String docType;
  final String docTypeDescription;
  final String orderNumber;
  final String freightTerms;
  final String entityCode;
  final String entityName;
  final String expectedDate;
  final String window;
  final String itemCode;
  final String itemDescription;
  final String equipmentType;
  final String equipmentTypeDescription;
  final String uom;
  final String location;
  final String warehouse;
  final String lineNumber;
  final String hazardClassCode;
  final String hazardClassDescription;
  final String unCode;
  final String unDescription;
  final int? compartment;
  final int? quantity;
  final int? itemId;
  final int? leadTime;

  static LineEntity? fromFirebaseMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return LineEntity(
      id: map['lineId'] ?? 0,
      docType: map["docType"] ?? '',
      docTypeDescription: map["docTypeDescr"] ?? '',
      orderNumber: map["orderNumber"] ?? '',
      freightTerms: map["freightTerms"] ?? '',
      entityCode: map["entityCode"] ?? '',
      entityName: map["entityName"] ?? '',
      expectedDate: map["expectedDate"] ?? '',
      window: map["window"] ?? '',
      itemId: map["itemId"],
      itemCode: map["itemCode"] ?? '',
      itemDescription: map["itemDescr"] ?? '',
      equipmentType: map["equipmentType"] ?? '',
      equipmentTypeDescription: map["equipmentTypeDescr"] ?? '',
      quantity: map["qty"],
      uom: map["uom"] ?? '',
      location: map["location"] ?? '',
      warehouse: map["warehouse"] ?? '',
      leadTime: map["leadTime"] != null ? int.parse(map["leadTime"]) : null,
      lineNumber: map["linhaNum"] ?? '',
      hazardClassCode: map["hazardClassCode"] ?? '',
      hazardClassDescription: map["hazardClassDescr"] ?? '',
      unCode: map["unCode"] ?? '',
      unDescription: map["unDescr"] ?? '',
      compartment: map["compartment"],
    );
  }
}
