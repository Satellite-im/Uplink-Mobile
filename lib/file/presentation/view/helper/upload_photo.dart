// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';

Future<dynamic> uploadPhoto(BuildContext context) async {
  final _itemListController = GetIt.I.get<ItemListBloc>();
  return UBottomSheetTwoButtons(
    context,
    header: 'Upload your picture from',
    firstButtonText: 'Take Photo',
    secondButtonText: 'Camera Roll',
    firstButtonIcon: UIcons.camera,
    secondButtonIcon: UIcons.image,
    firstButtonOnPressed: () async {
      final _imageFile = await UImagePicker(
        shouldShowPermissionDialog: true,
      ).pickImageFromCamera(
        context,
        uCropStyle: UCropStyle.none,
        device: CameraDevice.rear,
      );

      if (_imageFile != null) {
        //close bottem sheet and navigate to name page
        final _fileName = await Navigator.of(context)
            .popAndPushNamed('/NameFilePage') as String?;
        //compose the photo as thumbnail after getting file name
        if (_fileName != null) {
          final _uint8List = await FlutterImageCompress.compressWithFile(
            _imageFile.path,
            quality: 30,
          );
          if (_uint8List != null) {
            final _base64String = base64Encode(_uint8List);
            final _item = Item(
              name: _fileName,
              thumbnail: _base64String,
              type: ItemType.photo,
              size: _imageFile.lengthSync(),
              file: _imageFile,
              creationDateTime: DateTime.now(),
              modifiedDateTime: DateTime.now(),
            );
            _itemListController.add(UploadItem(item: _item));
          }
        }
      } else {
        // close the bottom sheet if user didn't upload phot
        Navigator.pop(context);
      }
    },
    secondButtonOnPressed: () async {
      // similar code as uploading from camera
      final _imageFile = await UImagePicker(
        shouldShowPermissionDialog: true,
      ).pickImageFromGallery(context, uCropStyle: UCropStyle.none);

      if (_imageFile != null) {
        //close bottem sheet and navigate to name page
        final _fileName = await Navigator.of(context)
            .popAndPushNamed('/NameFilePage') as String?;
        //compose the photo as thumbnail after getting file name
        if (_fileName != null) {
          final _uint8List = await FlutterImageCompress.compressWithFile(
            _imageFile.path,
            quality: 30,
          );
          if (_uint8List != null) {
            final _base64String = base64Encode(_uint8List);
            final _item = Item(
              name: _fileName,
              thumbnail: _base64String,
              type: ItemType.photo,
              size: _imageFile.lengthSync(),
              file: _imageFile,
              creationDateTime: DateTime.now(),
              modifiedDateTime: DateTime.now(),
            );
            _itemListController.add(UploadItem(item: _item));
          }
        }
      } else {
        // close the bottom sheet if user didn't upload photo
        Navigator.pop(context);
      }
    },
  ).show();
}
