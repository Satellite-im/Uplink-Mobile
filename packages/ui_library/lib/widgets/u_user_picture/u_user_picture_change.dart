import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui_library/core/const/const_export.dart';
import 'package:ui_library/plugins/image_picker.dart';
import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_export.dart';

import '../u_icon/u_icon_export.dart';

class UUserPictureChange extends StatefulWidget {
  const UUserPictureChange({Key? key, required this.onPictureSelected})
      : super(key: key);

  final Function(File? pictureSelected) onPictureSelected;

  @override
  State<UUserPictureChange> createState() => _UUserPictureChangeState();
}

class _UUserPictureChangeState extends State<UUserPictureChange> {
  final _uImagePicker = UImagePicker();
  XFile? _userPictureXFile;
  final _userPictureFile = ValueNotifier<File?>(null);

  File? _convertXFileToFile(XFile? _userPictureXFile) {
    if (_userPictureXFile != null) {
      _userPictureFile.value = File(_userPictureXFile.path);
      Navigator.of(context).pop();
      return _userPictureFile.value;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        UBottomSheetTwoButtons(
          context,
          header: 'Upload yout avatar picture from',
          firstButtonText: 'Take Photo',
          secondButtonText: 'Camera Roll',
          firstButtonIcon: UIcons.camera,
          secondButtonIcon: UIcons.image,
          firstButtonOnPressed: () async {
            _userPictureXFile =
                await _uImagePicker.pickImageFromCamera(context);

            widget.onPictureSelected(_convertXFileToFile(_userPictureXFile));
          },
          secondButtonOnPressed: () async {
            _userPictureXFile =
                await _uImagePicker.pickImageFromGallery(context);

            widget.onPictureSelected(_convertXFileToFile(_userPictureXFile));
          },
        ).show();
      },
      child: Stack(
        children: [
          Container(
            height: USizes.userPictureChangeSize,
            width: USizes.userPictureChangeSize,
            decoration: const BoxDecoration(
              color: UColors.defGrey,
              shape: BoxShape.circle,
            ),
            child: ValueListenableBuilder(
              valueListenable: _userPictureFile,
              child: const SizedBox(),
              builder: (context, _file, child) {
                return ClipOval(
                  child: _userPictureFile.value != null
                      ? Image.file(
                          File(_userPictureFile.value!.path),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high,
                        )
                      : child,
                );
              },
            ),
          ),
          Positioned(
            top: 76,
            right: 0,
            child: Container(
              height: USizes.userPictureChangeAddButtonSize,
              width: USizes.userPictureChangeAddButtonSize,
              decoration: const BoxDecoration(
                color: UColors.ctaBlue,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: UIcon(
                  UIcons.add_button,
                  size: UIconSize.small,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
