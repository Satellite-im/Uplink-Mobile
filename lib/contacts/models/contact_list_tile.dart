import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile({
    Key? key,
    required this.name,
    this.statusMessage,
    this.imageAddress,
    this.trailing,
    this.onLongPress,
    required this.status,
    this.onTap,
  }) : super(key: key);

  final String name;
  final String? statusMessage;
  final Status status;
  final String? imageAddress;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Theme(
      //remove splash effect when tap is diable
      data: onTap == null
          ? ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            )
          : ThemeData(),
      child: ListTile(
        tileColor: Colors.transparent,
        leading: UUserProfileWithStatus(
          // TODO(yijing): update to online image in profuction app
          uImage: UImage(
            imagePath: imageAddress,
            imageSource: ImageSource.local,
          ),
          userProfileSize: UUserProfileSize.normal,
          status: status,
        ),
        horizontalTitleGap: 12,
        title: UText(
          name,
          textStyle: UTextStyle.H4_fourthHeader,
        ),
        subtitle: UText(
          statusMessage ?? '',
          textStyle: UTextStyle.B1_body,
          textColor: UColors.textMed,
        ),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        onTap: onTap,
        onLongPress: onLongPress,
        trailing: trailing,
      ),
    );
  }
}
