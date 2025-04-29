import 'package:portox_app/app/commons/domain/signature_entity.dart';

class ExternalSignaturesResponseEntity {
  ExternalSignaturesResponseEntity({
    required this.removeList,
    required this.updateList,
  });

  List<SignatureEntity> updateList;
  List<String> removeList;
}
