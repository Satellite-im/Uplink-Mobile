import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../permissions/request_permissions.dart';

/// A plugin to save any image in device's gallery
///
/// It already handles with device's permissions
class USaveImageOnGallery {
  USaveImageOnGallery({this.shouldShowPermissionDialog = false});

  final bool shouldShowPermissionDialog;

  Future<bool> saveImage(
    BuildContext context,
    Uint8List image, {

    /// This will be complement the name of the file
    /// that are going to be saved on the user gallery
    String imageNameToSave = '',
  }) async {
    Map _result = {'isSuccess': false};

    final _galleryPermissionStatus = await URequestPermissions(
      shouldShowPermissionDialog: shouldShowPermissionDialog,
    ).getPermissionToAccessGallery(context);
    if (_galleryPermissionStatus == PermissionStatus.granted) {
      final _time = DateTime.now()
          .toIso8601String()
          .replaceAll('.', '-')
          .replaceAll(':', '-');
      final _name = 'uplink_${imageNameToSave}_$_time';
      _result = await ImageGallerySaver.saveImage(image, name: _name);
    }
    return _result['isSuccess'];
  }
}
