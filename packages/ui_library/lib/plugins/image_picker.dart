import 'package:image_picker/image_picker.dart';

class UImagePicker {
  final ImagePicker _picker = ImagePicker();

  Future pickerImageFromGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 100,
      maxHeight: 100,
      imageQuality: 1,
    );
  }

  Future pickerImageFromCamera() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 100,
      maxHeight: 100,
      imageQuality: 1,
      preferredCameraDevice: CameraDevice.front,
    );
  }

  // void _requestPermission() {}
}
