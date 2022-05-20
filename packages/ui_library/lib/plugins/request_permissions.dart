import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui_library/ui_library_export.dart';

class URequestPermissions {
  Future<PermissionStatus> getPermissionToUseCamera(
          BuildContext context) async =>
      await _verifyPermission(context, objectPermission: Permission.camera);

  Future<PermissionStatus> getPermissionToAccessGallery(
          BuildContext context) async =>
      await _verifyPermission(context, objectPermission: Permission.camera);

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
        if (Platform.isAndroid) {
          await showDialog(
            context: context,
            builder: (_context) => AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              backgroundColor: UColors.foregroundDark,
              actions: [
                UButton.filled1(
                  label: 'Go to app Settings',
                  onPressed: () => openAppSettings(),
                ),
                UButton.filled2(
                  label: 'Change this later',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
              title: const UText(
                'Hey my friend, for update this permission, you can go to the app settings or change it later!',
                textStyle: UTextStyle.H4_fourthHeader,
              ),
            ),
          );
        }
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
