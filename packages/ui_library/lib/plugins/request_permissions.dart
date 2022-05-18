import 'package:permission_handler/permission_handler.dart';

class URequestPermissions {
  Future<void> getPermissionToUseCamera() async {
    if (await Permission.camera.isGranted) {
      print('Everything is ok, go ahead!');
    } else if (await Permission.camera.isDenied) {
      await Permission.camera.request();
    } else if (await Permission.camera.isPermanentlyDenied) {
      print('Change the settings on Setting');
    }
  }

  Future getPermissionToAccessGallery() async {
    if (await Permission.mediaLibrary.isGranted) {
      print('Everything is ok, go ahead!');
    } else if (await Permission.mediaLibrary.isDenied) {
      await Permission.mediaLibrary.request();
    } else if (await Permission.mediaLibrary.isPermanentlyDenied) {
      print('Change the settings on Setting');
    }
  }
}
