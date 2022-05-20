import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui_library/plugins/image_cropper.dart';
import 'package:ui_library/plugins/request_permissions.dart';

class UImagePicker {
  final _picker = ImagePicker();
  final _permissions = URequestPermissions();
  final _uImageCropper = UImageCropper();

  Future<File?> pickImageFromGallery(BuildContext context) async {
    XFile? pickedFile;
    File? _imageCroppedFile;
    final _galleryPermissionStatus =
        await _permissions.getPermissionToAccessGallery(context);
    if (_galleryPermissionStatus == PermissionStatus.granted) {
      pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
    }

    if (pickedFile != null) {
      _imageCroppedFile = await _uImageCropper.cropImage(File(pickedFile.path));
    }

    return _imageCroppedFile;
  }

  Future<File?> pickImageFromCamera(BuildContext context) async {
    XFile? pickedFile;
    File? _imageCroppedFile;

    final _cameraPermissionStatus =
        await _permissions.getPermissionToUseCamera(context);

    if (_cameraPermissionStatus == PermissionStatus.granted) {
      pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
      );
    }

    if (pickedFile != null) {
      _imageCroppedFile = await _uImageCropper.cropImage(File(pickedFile.path));
    }

    return _imageCroppedFile;
  }
}
