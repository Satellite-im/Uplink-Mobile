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

  File? _convertXFileToFile(XFile? _userPictureXFile) {
    if (_userPictureXFile != null) {
      return File(_userPictureXFile.path);
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
            _userPictureXFile = await _uImagePicker.pickImageFromCamera();

            widget.onPictureSelected(_convertXFileToFile(_userPictureXFile));
            Navigator.of(context).pop();

            setState(() {});
          },
          secondButtonOnPressed: () async {
            _userPictureXFile = await _uImagePicker.pickImageFromGallery();

            widget.onPictureSelected(_convertXFileToFile(_userPictureXFile));
            Navigator.of(context).pop();

            setState(() {});
          },
        ).show();
      },
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: UColors.defGrey,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: _userPictureXFile != null
                  ? Image.file(
                      File(_userPictureXFile!.path),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    )
                  : const SizedBox(),
            ),
          ),
          Positioned(
            top: 76,
            right: 0,
            child: Container(
              height: 24,
              width: 24,
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
