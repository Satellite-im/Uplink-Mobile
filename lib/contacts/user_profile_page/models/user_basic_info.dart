import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/utils/mock/models/data_export.dart';

class UserBasicInfo extends StatelessWidget {
  const UserBasicInfo({Key? key, required this.user}) : super(key: key);
  final MockContact user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: user.imageAddress == null
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: UColors.backgroundDark,
                  ),
                )
              : null,
          child: SizedBox(
            width: USizes.userPictureChangeSize,
            height: USizes.userPictureChangeSize,
            child: UImage(
              imagePath: user.imageAddress,
              imageSource: ImageSource.local,
            ),
          ),
        ),
        const SizedBox.square(
          dimension: 20,
        ),
        UText(
          user.name,
          textStyle: UTextStyle.H2_secondaryHeader,
        ),
        const SizedBox.square(
          dimension: 2,
        ),
        UText(
          user.statusMessage ?? '-',
          textStyle: UTextStyle.B1_body,
        ),
      ],
    );
  }
}
