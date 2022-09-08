import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class UserBasicInfo extends StatelessWidget {
  const UserBasicInfo({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: user.profilePicture == null
              ? BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: UColors.backgroundDark,
                  ),
                )
              : null,
          child: ClipOval(
            child: SizedBox(
              width: USizes.userPictureChangeSize,
              height: USizes.userPictureChangeSize,
              child: UImage(
                imagePath: user.profilePicture?.path,
                imageSource: ImageSource.file,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox.square(
          dimension: 20,
        ),
        UText(
          user.username,
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
