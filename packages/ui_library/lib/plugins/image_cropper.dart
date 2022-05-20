import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:ui_library/core/const/const_export.dart';

class UImageCropper {
  Future<File?> cropImage(File imageFile) async {
    File? _imageCroppedFile;

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      cropStyle: CropStyle.circle,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: UColors.foregroundDark,
          backgroundColor: UColors.backgroundDark,
          toolbarWidgetColor: UColors.white,
          activeControlsWidgetColor: UColors.ctaBlue,
          statusBarColor: UColors.backgroundDark,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    if (croppedFile != null) _imageCroppedFile = File(croppedFile.path);

    return _imageCroppedFile;
  }
}
