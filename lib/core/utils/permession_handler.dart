import 'package:permission_handler/permission_handler.dart';

class PermessionHandler {
  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.request();
    if (!status.isGranted) {
      throw Exception('يجب إعطاء اذن السماح للطتبيق للوصول للكاميرا');
    }
  }

  Future<void> requestGalleryPermission() async {
    var status = await Permission.camera.request();
    if (!status.isGranted) {
      throw Exception('يجب إعطاء اذن السماح للطتبيق للوصول للمعرض');
    }
  }

  Future<void> goToSettings() async {
    await openAppSettings();
  }
}
