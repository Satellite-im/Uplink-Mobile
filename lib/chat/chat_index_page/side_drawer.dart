import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 304,
      backgroundColor: UColors.modalDark,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 52, 0, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                UUserProfileWithStatus(
                  // TODO(yijing): update to user profile in warp
                  uImage: UImage(
                    imagePath:
                        'packages/ui_library/images/placeholders/user_avatar_1.png',
                    imageSource: ImageSource.local,
                    fit: BoxFit.cover,
                  ),
                  userProfileSize: UUserProfileSize.normal,
                  status: Status.online,
                ),
                UText(
                  'username',
                  textStyle: UTextStyle.H4_fourthHeader,
                ),
                UText(
                  'Something something space station',
                  textStyle: UTextStyle.B1_body,
                  textColor: UColors.textMed,
                ),
              ],
            ),
          ),
          const UDivider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DrawerListTile(
                leadingUIconData: UIcons.location,
                onTap: () {},
                title: 'Location',
              ),
              _DrawerListTile(
                leadingUIconData: UIcons.location,
                onTap: () {},
                title: 'Help',
              ),
              _DrawerListTile(
                leadingUIconData: UIcons.setting,
                onTap: () {},
                title: 'Settings',
              ),
            ],
          ),
          const UDivider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 15, 0, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _DrawerTextButton(text: 'Privacy Policy', onPressed: () {}),
                _DrawerTextButton(text: 'Terms of Service', onPressed: () {}),
              ],
            ),
          ),
          const UDivider(),
          _DrawerListTile(
            leadingUIconData: UIcons.logout,
            onTap: () {
              log('log out');
            },
            title: 'Logout',
          ),
        ],
      ),
    );
  }
}

class _DrawerListTile extends StatelessWidget {
  const _DrawerListTile({
    Key? key,
    required this.leadingUIconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final UIconData leadingUIconData;
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UIcon(leadingUIconData),
      minLeadingWidth: 24,
      horizontalTitleGap: 8,
      title: UText(
        title,
        textStyle: UTextStyle.H5_fifthHeader,
        textColor: UColors.white,
        textAlign: TextAlign.left,
      ),
      onTap: onTap,
    );
  }
}

class _DrawerTextButton extends StatelessWidget {
  const _DrawerTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed: onPressed,
      child: UText(
        text,
        textStyle: UTextStyle.BUT2_secondaryButton,
        textColor: UColors.white,
        textAlign: TextAlign.left,
      ),
    );
  }
}
