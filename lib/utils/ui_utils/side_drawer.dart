import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/presentation/controller/auth_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';

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
          // user info
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
                SizedBox(height: 8),
                UText(
                  'username',
                  textStyle: UTextStyle.H4_fourthHeader,
                ),
                SizedBox(height: 3),
                UText(
                  'Something something space station',
                  textStyle: UTextStyle.B1_body,
                  textColor: UColors.textMed,
                ),
              ],
            ),
          ),
          const UDivider(),
          //options
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DrawerListTile(
                leadingUIconData: UIcons.location,
                onTap: () {},
                title: UAppStrings.sideDrawer_location,
              ),
              _DrawerListTile(
                leadingUIconData: UIcons.location,
                onTap: () {},
                title: UAppStrings.sideDrawer_help,
              ),
              _DrawerListTile(
                leadingUIconData: UIcons.setting,
                onTap: () {},
                title: UAppStrings.sideDrawer_settings,
              ),
            ],
          ),
          const UDivider(),
          // text buttons
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DrawerTextListTile(
                text: UAppStrings.sideDrawer_privacy,
                onTap: () {},
              ),
              _DrawerTextListTile(
                text: UAppStrings.sideDrawer_terms,
                onTap: () {},
              ),
            ],
          ),
          const UDivider(),
          // logout
          _DrawerListTile(
            leadingUIconData: UIcons.logout,
            onTap: () {
              final _warpController = GetIt.I.get<WarpBloc>();
              final _authController = GetIt.I.get<AuthBloc>();
              try {
                _warpController.add(WarpLogout());
                _authController.add(AuthLogout());
              } catch (e) {
                log(e.toString());
              }
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
            },
            title: UAppStrings.sideDrawer_logout,
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

class _DrawerTextListTile extends StatelessWidget {
  const _DrawerTextListTile({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UText(
        text,
        textStyle: UTextStyle.BUT2_secondaryButton,
        textColor: UColors.white,
        textAlign: TextAlign.left,
      ),
      onTap: onTap,
    );
  }
}
