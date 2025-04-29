import 'dart:convert';

class StorageCredentialsEntity {
  const StorageCredentialsEntity({
    required this.token,
    required this.expirationDate,
  });

  final String token;
  final String expirationDate;

  Map<String, dynamic> toMap() => {
        'token': token,
        'expirationDate': expirationDate,
      };

  static StorageCredentialsEntity? fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return null;
    }

    return StorageCredentialsEntity(
      token: map['token'],
      expirationDate: map['expirationDate'],
    );
  }

  String toJson() => json.encode(toMap());

  static StorageCredentialsEntity? fromJson(String source) =>
      fromMap(jsonDecode(source));
}
