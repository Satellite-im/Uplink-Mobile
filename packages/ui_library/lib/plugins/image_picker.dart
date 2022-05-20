import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui_library/plugins/request_permissions.dart';

class UImagePicker {
  final _picker = ImagePicker();
  final _permissions = URequestPermissions();

  Future<XFile?> pickImageFromGallery(BuildContext context) async {
    XFile? pickedFile;
    final _galleryPermissionStatus =
        await _permissions.getPermissionToAccessGallery(context);

    if (_galleryPermissionStatus == PermissionStatus.granted) {
      pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
    }
    return pickedFile;
  }

  Future<XFile?> pickImageFromCamera(BuildContext context) async {
    XFile? pickedFile;
    final _cameraPermissionStatus =
        await _permissions.getPermissionToUseCamera(context);

    if (_cameraPermissionStatus == PermissionStatus.granted) {
      pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
      );
    }

    return pickedFile;
  }
}
