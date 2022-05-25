import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import 'save_image_on_gallery.dart';

/// A plugin to screenshot widgets from the app
/// or a customized tree of widgets
///
/// Example:
/// ```dart
///  final _uScreenShot = UScreenShot();
///  final _image = await _uScreenShot.captureFromWidget(
///     context,
///     widget: const _ScreenShotRecoverySeedBoxes(),
///     delay: const Duration(milliseconds: 200),
///   );
/// ```
class UScreenShot {
  final screenshotController = ScreenshotController();

  /// It is necessary to pass the widget to capture
  ///
  /// Is possible to already save the screenShot on gallery
  /// if [saveOnGallery] equals true
  Future<Uint8List> captureFromWidget(
    BuildContext context, {
    required Widget widget,
    bool saveOnGallery = false,
    Duration delay = const Duration(seconds: 1),
  }) async {
    final _screenshotImage = await screenshotController.captureFromWidget(
      widget,
      delay: delay,
    );

    if (saveOnGallery) {
      final _saveImageOnGallery = USaveImageOnGallery();
      await _saveImageOnGallery.saveImage(context, _screenshotImage);
    }

    return _screenshotImage;
  }
}
