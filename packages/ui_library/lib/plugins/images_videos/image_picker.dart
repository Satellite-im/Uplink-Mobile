import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui_library/plugins/permissions/request_permissions.dart';

import 'image_cropper.dart';

/// Define the format of the crop
enum UCropStyle { circle, rectangle, none }

/// This class pick a image from camera or gallery
///
/// It already handles with device's permissions
class UImagePicker {
  UImagePicker({
    this.shouldShowPermissionDialog = false,
    this.withCropper = true,
  });

  final bool shouldShowPermissionDialog;
  final bool withCropper;
  final _picker = ImagePicker();
  final _uImageCropper = UImageCropper();

  Future<File?> pickImageFromGallery(
    BuildContext context, {
    UCropStyle uCropStyle = UCropStyle.circle,
    UCropAspectRatio? uCropAspectRatio,
  }) async {
    XFile? pickedFile;
    File? _imageCroppedFile;
    final _galleryPermissionStatus = await URequestPermissions(
      shouldShowPermissionDialog: shouldShowPermissionDialog,
    ).getPermissionToAccessGallery(context);
    if (_galleryPermissionStatus == PermissionStatus.granted) {
      pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
    }

    if (pickedFile != null) {
      if (withCropper == true) {
        _imageCroppedFile = await _uImageCropper.cropImage(
          File(pickedFile.path),
          uCropStyle: uCropStyle,
          uCropAspectRatio: uCropAspectRatio,
        );
        return _imageCroppedFile;
      } else {
        _imageCroppedFile = File(pickedFile.path);
      }
    }

    return _imageCroppedFile;
  }

  Future<File?> pickImageFromCamera(
    BuildContext context, {
    UCropStyle uCropStyle = UCropStyle.circle,
    UCropAspectRatio? uCropAspectRatio,
    CameraDevice device = CameraDevice.front,
  }) async {
    XFile? pickedFile;
    File? _imageCroppedFile;

    final _cameraPermissionStatus = await URequestPermissions(
      shouldShowPermissionDialog: shouldShowPermissionDialog,
    ).getPermissionToUseCamera(context);

    if (_cameraPermissionStatus == PermissionStatus.granted) {
      pickedFile = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: device,
      );
    }

    if (pickedFile != null) {
      if (withCropper == true) {
        _imageCroppedFile = await _uImageCropper.cropImage(
          File(pickedFile.path),
          uCropStyle: uCropStyle,
          uCropAspectRatio: uCropAspectRatio,
        );
      } else {
        _imageCroppedFile = File(pickedFile.path);
      }
    }

    return _imageCroppedFile;
  }
}

class UCropAspectRatio {
  UCropAspectRatio({
    required this.ratioX,
    required this.ratioY,
  });

  final double ratioX;
  final double ratioY;
}
