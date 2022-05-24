import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import 'save_image_on_gallery.dart';

class UScreenShot {
  final screenshotController = ScreenshotController();

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
