import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class NoItemBody extends StatefulWidget {
  const NoItemBody({
    Key? key,
  }) : super(key: key);

  @override
  State<NoItemBody> createState() => _NoItemBodyState();
}

class _NoItemBodyState extends State<NoItemBody> {
  final _itemListController = GetIt.I.get<ItemListBloc>();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const UText(
          UAppStrings.noItemBody_title,
          textStyle: UTextStyle.H1_primaryHeader,
        ),
        const SizedBox(
          height: 16,
        ),
        const UText(
          UAppStrings.noItemBody_content,
          textStyle: UTextStyle.B1_body,
        ),
        const SizedBox(
          height: 56,
        ),
        SizedBox(
          width: double.infinity,
          child: UButton.primary(
            label: UAppStrings.noItemBody_buttonText,
            uIconData: UIcons.document,
            onPressed: () {
//upload photo
              UBottomSheetTwoButtons(
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
                    if (!mounted) return;
                    final _fileName = await Navigator.of(context)
                        .popAndPushNamed('/NameFilePage') as String?;
                    //compose the photo as thumbnail after getting file name
                    if (_fileName != null) {
                      final _uint8List =
                          await FlutterImageCompress.compressWithFile(
                        _imageFile.path,
                        quality: 10,
                      );
                      if (_uint8List != null) {
                        final _base64String = base64Encode(_uint8List);
                        final _item = Item(
                          name: _fileName,
                          thumbnail: _base64String,
                          type: ItemType.photo,
                          size: _imageFile.lengthSync(),
                          creation: DateTime.now(),
                          modified: DateTime.now(),
                        );
                        _itemListController.add(UploadItem(item: _item));
                      }
                    }
                  } else {
                    // close the bottom sheet if user didn't upload photo
                    if (!mounted) return;
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
                    if (!mounted) return;
                    final _fileName = await Navigator.of(context)
                        .popAndPushNamed('/NameFilePage') as String?;
                    //compose the photo as thumbnail after getting file name
                    if (_fileName != null) {
                      final _uint8List =
                          await FlutterImageCompress.compressWithFile(
                        _imageFile.path,
                        quality: 10,
                      );
                      if (_uint8List != null) {
                        final _base64String = base64Encode(_uint8List);
                        final _item = Item(
                          name: _fileName,
                          thumbnail: _base64String,
                          type: ItemType.photo,
                          size: _imageFile.lengthSync(),
                          creationDateTime: DateTime.now(),
                          modifiedDateTime: DateTime.now(),
                        );
                        _itemListController.add(UploadItem(item: _item));
                      }
                    }
                  } else {
                    // close the bottom sheet if user didn't upload photo
                    if (!mounted) return;
                    Navigator.pop(context);
                  }
                },
              ).show();
            },
          ),
        )
      ],
    );
  }
}
