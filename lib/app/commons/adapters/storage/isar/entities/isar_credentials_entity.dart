import 'package:isar/isar.dart';

part 'isar_credentials_entity.g.dart';

@Collection()
class IsarCredentialsEntity {
  int id = Isar.autoIncrement;

  String? token;
  String? expirationDate;
}
