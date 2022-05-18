import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui_library/widgets/u_text/u_text_export.dart';

class URequestPermissions {
  Future<PermissionStatus> getPermissionToUseCamera(
          BuildContext context) async =>
      await _verifyPermission(context,
          objectPermission:
              Platform.isAndroid ? Permission.camera : Permission.photos);

  Future<PermissionStatus> getPermissionToAccessGallery(
          BuildContext context) async =>
      await _verifyPermission(context,
          objectPermission: Permission.mediaLibrary);

  Future<PermissionStatus> _verifyPermission(BuildContext context,
      {required Permission objectPermission}) async {
    final _objectPermissionStatus = await objectPermission.request();
    switch (_objectPermissionStatus) {
      case PermissionStatus.granted:
        // Do nothing
        return _objectPermissionStatus;
      case PermissionStatus.denied:
        // Ask for permission again
        return _objectPermissionStatus;
      case PermissionStatus.permanentlyDenied:
        // Tell the use to go to settings and change the
        // permissions of the app
        await showDialog(
          context: context,
          builder: (_context) => GestureDetector(
            onTap: () => openAppSettings(),
            child: const AlertDialog(
              title: UText(
                'Camera Permission',
                textStyle: UTextStyle.H4_fourthHeader,
              ),
            ),
          ),
        );
        return _objectPermissionStatus;
      case PermissionStatus.restricted:
        // do something
        return _objectPermissionStatus;
      case PermissionStatus.limited:
        // do something
        return _objectPermissionStatus;
    }
  }
}
