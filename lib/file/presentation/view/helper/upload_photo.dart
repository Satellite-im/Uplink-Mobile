import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';

Future<void> uploadPhoto(BuildContext context) async {
  return UBottomSheetTwoButtons(
    context,
    header: UAppStrings.upload_photo_title,
    firstButtonText: UAppStrings.upload_photo_camera,
    secondButtonText: UAppStrings.upload_photo_gallary,
    firstButtonIcon: UIcons.camera,
    secondButtonIcon: UIcons.image,
    firstButtonOnPressed: () async {
      await _nameAndUploadItem(
        context,
        await UImagePicker(
          shouldShowPermissionDialog: true,
          withCropper: false,
        ).pickImageFromCamera(
          context,
          device: CameraDevice.rear,
        ),
      );
    },
    secondButtonOnPressed: () async {
      await _nameAndUploadItem(
        context,
        await UImagePicker(
          shouldShowPermissionDialog: true,
          withCropper: false,
        ).pickImageFromGallery(context),
      );
    },
  ).show();
}

Future<void> _nameAndUploadItem(BuildContext context, File? imageFile) async {
  final _itemListController = GetIt.I.get<ItemListBloc>();
  if (imageFile != null) {
    //close bottem sheet and navigate to name page
    final _fileName =
        await Navigator.of(context).popAndPushNamed('/NameFilePage') as String?;
    //compose the photo as thumbnail after getting file name
    if (_fileName != null) {
      final _uint8List = await FlutterImageCompress.compressWithFile(
        imageFile.path,
        quality: 30,
      );
      if (_uint8List != null) {
        final _base64String = base64Encode(_uint8List);
        final _extension = path.extension(imageFile.path);
        final _item = Item(
          extension: _extension,
          name: _fileName,
          thumbnail: _base64String,
          type: ItemType.photo,
          file: imageFile,
        );
        _itemListController.add(UploadItem(item: _item));
      }
    }
  } else {
    // close the bottom sheet if user didn't upload phot
    Navigator.pop(context);
  }
}
