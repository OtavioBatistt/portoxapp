import 'package:flutter/services.dart';
import 'package:portox_app/app/commons/adapters/device/device_adapter.dart';
import 'package:unique_identifier/unique_identifier.dart';

class Device implements IDeviceAdapter {
  @override
  Future<String> getSerial() async {
    String identifier;
    try {
      identifier = await UniqueIdentifier.serial ?? '';
    } on PlatformException {
      identifier = '';
    }
    return identifier;
  }
}
