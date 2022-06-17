import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:ui_library/core/const/const_export.dart';

import 'image_picker.dart';

/// A plugin to crop the image
///
/// It works with different options for IOS and Android
class UImageCropper {
  Future<File?> cropImage(
    File imageFile, {
    UCropStyle uCropStyle = UCropStyle.circle,
  }) async {
    File? _imageCroppedFile;

    final croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      cropStyle: uCropStyle == UCropStyle.circle
          ? CropStyle.circle
          : CropStyle.rectangle,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: ULibraryStrings.uImageCropperTitle,
          toolbarColor: UColors.foregroundDark,
          cropGridColumnCount: 0,
          cropGridRowCount: 0,
          backgroundColor: UColors.backgroundDark,
          toolbarWidgetColor: UColors.white,
          activeControlsWidgetColor: UColors.ctaBlue,
          statusBarColor: UColors.backgroundDark,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
          hideBottomControls: false,
        ),
        IOSUiSettings(
          title: ULibraryStrings.uImageCropperTitle,
          resetButtonHidden: true,
          aspectRatioPickerButtonHidden: true,
        ),
      ],
    );

    if (croppedFile != null) _imageCroppedFile = File(croppedFile.path);

    return _imageCroppedFile;
  }
}
