import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/u_dialog/u_dialog_export.dart';

/// This class will handle with the device's permissions
///
/// It will show a dialog explaining what permission the app needs
///
/// If a permission is permanently denied, it will take the user to the
/// device settings to change it
class URequestPermissions {
  URequestPermissions({this.shouldShowPermissionDialog = false});

  final bool shouldShowPermissionDialog;

  Future<PermissionStatus> getPermissionToUseCamera(
          BuildContext context) async =>
      await _verifyPermission(
        context,
        objectPermission: Permission.camera,
        dialogPermissionTitle: ULibraryStrings.allowCameraPermission,
        permissionObject: ULibraryStrings.camera,
      );

  Future<PermissionStatus> getPermissionToAccessGallery(
          BuildContext context) async =>
      await _verifyPermission(
        context,
        objectPermission:
            Platform.isAndroid ? Permission.storage : Permission.photos,
        dialogPermissionTitle: ULibraryStrings.allowCameraRollPermission,
        permissionObject: ULibraryStrings.gallery,
      );

  Future<PermissionStatus> _verifyPermission(
    BuildContext context, {
    required Permission objectPermission,
    required String dialogPermissionTitle,
    required String permissionObject,
  }) async {
    PermissionStatus _objectPermissionStatus = await objectPermission.status;
    if (_objectPermissionStatus != PermissionStatus.granted &&
        shouldShowPermissionDialog) {
      await _dialogPermission(
        context,
        title: dialogPermissionTitle,
        permissionObject: permissionObject,
      );
      _objectPermissionStatus = await objectPermission.request();
    } else {
      _objectPermissionStatus = await objectPermission.request();
    }

    switch (_objectPermissionStatus) {
      case PermissionStatus.granted:
        return _objectPermissionStatus;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
        return _objectPermissionStatus;
      case PermissionStatus.permanentlyDenied:
        // Take the user to app settings
        await openAppSettings();
        return _objectPermissionStatus;
    }
  }

  Future<void> _dialogPermission(
    BuildContext context, {
    required String title,
    required String permissionObject,
  }) async {
    return await UDialog(
      context,
      title: title,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UText(
            ULibraryStrings.uDialogWeNeedPermission(permissionObject),
            textStyle: UTextStyle.B1_body,
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          Row(
            children: [
              Expanded(
                child: UButton.filled1(
                  label: ULibraryStrings.nextButton,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [],
    ).showUDialog();
  }
}
