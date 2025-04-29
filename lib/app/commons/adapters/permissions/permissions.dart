import 'package:permission_handler/permission_handler.dart';
import 'package:portox_app/app/commons/adapters/permissions/permissions_adapter.dart';

class Permissions implements PermissionsAdapter {
  @override
  Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status == PermissionStatus.granted;
  }
}
