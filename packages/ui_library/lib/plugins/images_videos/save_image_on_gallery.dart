import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../permissions/request_permissions.dart';

class USaveImageOnGallery {
  final _permissions = URequestPermissions();

  Future<bool> saveImage(
    BuildContext context,
    Uint8List image, {
    String nameComplement = '',
  }) async {
    Map _result = {'isSuccess': false};

    final _galleryPermissionStatus =
        await _permissions.getPermissionToAccessGallery(context);
    if (_galleryPermissionStatus == PermissionStatus.granted) {
      final _time = DateTime.now()
          .toIso8601String()
          .replaceAll('.', '-')
          .replaceAll(':', '-');
      final _name = 'uplink_${nameComplement}_$_time';
      _result = await ImageGallerySaver.saveImage(image, name: _name);
    }
    return _result['isSuccess'];
  }
}
