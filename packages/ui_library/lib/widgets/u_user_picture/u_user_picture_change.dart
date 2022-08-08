import 'dart:io';

import 'package:flutter/material.dart';

import 'package:ui_library/ui_library_export.dart';

class UUserPictureChange extends StatefulWidget {
  const UUserPictureChange({
    Key? key,
    required this.onPictureSelected,
    this.showChangeImageButton = true,
    UImage? uImage,
  })  : _uImage = uImage ?? const UImage(),
        super(key: key);

  final Function(File? pictureSelected) onPictureSelected;
  final bool showChangeImageButton;
  final UImage _uImage;

  @override
  State<UUserPictureChange> createState() => _UUserPictureChangeState();
}

class _UUserPictureChangeState extends State<UUserPictureChange> {
  final _userPictureFile = ValueNotifier<File?>(null);
  File? _imageFile;

  void _verifyIfHasImage() {
    if (_imageFile != null && _imageFile!.path.isNotEmpty) {
      _userPictureFile.value = _imageFile;
      widget.onPictureSelected(_userPictureFile.value);
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  void dispose() {
    _userPictureFile.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.showChangeImageButton
          ? () {
              UBottomSheetTwoButtons(
                context,
                header: ULibraryStrings.uUserPictureChangeHeader,
                firstButtonText:
                    ULibraryStrings.uUserPictureChangeFirstButtonText,
                secondButtonText:
                    ULibraryStrings.uUserPictureChangeSecondButtonText,
                firstButtonIcon: UIcons.camera,
                secondButtonIcon: UIcons.image,
                firstButtonOnPressed: () async {
                  _imageFile =
                      await UImagePicker(shouldShowPermissionDialog: true)
                          .pickImageFromCamera(context);
                  _verifyIfHasImage();
                },
                secondButtonOnPressed: () async {
                  _imageFile =
                      await UImagePicker(shouldShowPermissionDialog: false)
                          .pickImageFromGallery(context);
                  _verifyIfHasImage();
                },
              ).show();
            }
          : null,
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
              child: const SizedBox.shrink(),
              builder: (context, _file, child) {
                return ClipOval(
                  child: UImage(
                    imagePath: widget._uImage.imagePath,
                    imageSource: widget._uImage.imageSource,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 76,
            right: 0,
            child: AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              firstChild: Container(
                height: USizes.userPictureChangeAddButtonSize,
                width: USizes.userPictureChangeAddButtonSize,
                decoration: const BoxDecoration(
                  color: UColors.ctaBlue,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: UIcon(
                    UIcons.add,
                    size: UIconSize.addPictureProfileButton,
                  ),
                ),
              ),
              secondChild: const SizedBox.shrink(),
              crossFadeState: widget.showChangeImageButton
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
        ],
      ),
    );
  }
}
