import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ui_library/core/const/const_export.dart';
import 'package:ui_library/plugins/plugins_export.dart';
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
  final _uImagePicker = UImagePicker(shouldShowPermissionDialog: true);
  final _userPictureFile = ValueNotifier<File?>(null);
  File? _imageFile;

  void _verifyIfHasImage() {
    if (_imageFile != null && _imageFile!.path.isNotEmpty) {
      _userPictureFile.value = _imageFile;
      widget.onPictureSelected(_userPictureFile.value);
      Navigator.of(context).pop();
    }
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
            _imageFile = await _uImagePicker.pickImageFromCamera(context);
            _verifyIfHasImage();
          },
          secondButtonOnPressed: () async {
            _imageFile = await _uImagePicker.pickImageFromGallery(context);
            _verifyIfHasImage();
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
                  size: UIconSize.addPictureProfileButton,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
