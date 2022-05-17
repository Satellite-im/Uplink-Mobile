import 'package:flutter/material.dart';
import 'package:ui_library/core/const/const_export.dart';
import 'package:ui_library/plugins/image_picker.dart';

import '../u_icon/u_icon_export.dart';

class UUserPictureChange extends StatelessWidget {
  const UUserPictureChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        UImagePicker().pickerImageFromCamera();
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
