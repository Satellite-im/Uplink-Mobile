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
    UCropAspectRatio? uCropAspectRatio,
  }) async {
    File? _imageCroppedFile;
    CroppedFile? croppedFile;

    if (uCropStyle == UCropStyle.none) {
      croppedFile = await ImageCropper().cropImage(
          sourcePath: imageFile.path,
          uiSettings: _getUISetting(hasShape: false));
    } else {
      croppedFile = await ImageCropper().cropImage(
          sourcePath: imageFile.path,
          cropStyle: uCropStyle == UCropStyle.circle
              ? CropStyle.circle
              : CropStyle.rectangle,
          aspectRatio: uCropAspectRatio != null
              ? CropAspectRatio(
                  ratioX: uCropAspectRatio.ratioX,
                  ratioY: uCropAspectRatio.ratioY)
              : null,
          // TODO: Using low images quality to save app performance
          compressQuality: 50,
          maxHeight: 500,
          maxWidth: 500,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
          uiSettings: _getUISetting(hasShape: true));
    }

    if (croppedFile != null) _imageCroppedFile = File(croppedFile.path);

    return _imageCroppedFile;
  }
}

List<PlatformUiSettings> _getUISetting({required bool hasShape}) {
  return [
    AndroidUiSettings(
      toolbarTitle: ULibraryStrings.uImageCropperTitle,
      toolbarColor: UColors.foregroundDark,
      cropGridColumnCount: 0,
      cropGridRowCount: 0,
      backgroundColor: UColors.backgroundDark,
      toolbarWidgetColor: UColors.white,
      activeControlsWidgetColor: UColors.ctaBlue,
      statusBarColor: UColors.backgroundDark,
      initAspectRatio: hasShape == true
          ? CropAspectRatioPreset.square
          : CropAspectRatioPreset.original,
      lockAspectRatio: false,
      hideBottomControls: false,
    ),
    IOSUiSettings(
      minimumAspectRatio: 0.5,
      title: ULibraryStrings.uImageCropperTitle,
      resetButtonHidden: true,
      aspectRatioPickerButtonHidden: true,
    ),
  ];
}
