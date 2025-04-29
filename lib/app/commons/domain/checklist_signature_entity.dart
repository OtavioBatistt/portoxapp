class ChecklistSignatureEntity {
  ChecklistSignatureEntity({
    this.id = 0,
    this.image = '',
    this.createdAt = '',
    this.mimeType = '',
    this.skipped = false,
  });
  final int id;
  final String image;
  final String createdAt;
  final String mimeType;
  final bool skipped;

  Map<String, dynamic> toMap() => {
        'id': id,
        'image': image,
        'createdAt': createdAt,
        'mimeType': mimeType,
        'skipped': skipped,
      };
}
