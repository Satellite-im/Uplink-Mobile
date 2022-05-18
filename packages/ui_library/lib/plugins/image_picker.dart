import 'package:image_picker/image_picker.dart';
import 'package:ui_library/plugins/request_permissions.dart';

class UImagePicker {
  final ImagePicker _picker = ImagePicker();
  final _permissions = URequestPermissions();

  Future<XFile?> pickImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    return pickedFile;
  }

  Future<XFile?> pickImageFromCamera() async {
    await _permissions.getPermissionToUseCamera();

    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );
    return pickedFile;
  }

  // void _requestPermission() {}
}
