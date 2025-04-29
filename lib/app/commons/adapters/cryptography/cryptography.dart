import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:portox_app/app/commons/adapters/cryptography/cryptography_adapter.dart';

class Cryptography implements ICryptographyAdapter {
  @override
  Future<String> hash(String value) async {
    String hashValue;
    try {
      hashValue = md5.convert(utf8.encode(value)).toString();
    } on Exception {
      hashValue = '';
    }
    return hashValue;
  }
}
