import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/models_export.dart';

class AppBarWithBanner extends StatelessWidget {
  const AppBarWithBanner({Key? key, required this.user}) : super(key: key);

  final MockContact user;

  @override
  Widget build(BuildContext context) {
    return UAppBar.iconOnly(
      backIconColor: UColors.white,
      actionList: [
        if (user.relationship == Relationship.block && user.isBlocked == false)
          const UIcon(
            UIcons.blocked_contacts,
            color: UColors.textDark,
          ),
        if (user.relationship == Relationship.friend &&
            user.isBlocked == false) ...[
          IconButton(
            onPressed: () {},
            icon: const UIcon(UIcons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const UIcon(UIcons.video_call_button),
          ),
        ],
        if (user.relationship == Relationship.none &&
            user.friendRequestSent == true &&
            user.isBlocked == false)
          const UIcon(
            UIcons.outgoing_requests,
            color: UColors.textDark,
          ),
//hamburger menu
        HamburgerMenuButton(
          user: user,
        ),
      ],
      flexibleSpace: const SizedBox(
        height: 164,
        width: double.infinity,
        // TODO(yijing): update user's banner image
        child: UImage(
          imagePath: 'lib/utils/mock/images/bannerImage1.png',
          imageSource: ImageSource.local,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class HamburgerMenuButton extends StatelessWidget {
  const HamburgerMenuButton({
    Key? key,
    required this.user,
  }) : super(key: key);

  final MockContact user;

  @override
  Widget build(BuildContext context) {
    var model = 'Block';
    if (user.relationship == Relationship.block) model = 'Unblock';

    return UPopupMenuButton<String>(
      icon: const UIcon(UIcons.hamburger_menu),
      onSelected: (String result) async {
        switch (result) {
          case 'Unblock':
            await showDialog<void>(
              context: context,
              builder: (_) => UDialogUserProfile(
                bodyText: 'Are you sure you want to unblock this user?',
                buttonText: UAppStrings.unblock,
                popButtonText: UAppStrings.goBackButton,
                username: user.name,
                statusMessage: user.statusMessage,
                uImage: UImage(
                  imagePath: user.imageAddress,
                  imageSource: ImageSource.local,
                ),
                onTap: () {
                  // !! add unblock workflow
                },
              ),
            );
            break;
          case 'Block':
            await showDialog<void>(
              context: context,
              builder: (_) => UDialogUserProfile(
                bodyText: 'Are you sure you want to block this user?',
                buttonText: UAppStrings.block,
                popButtonText: UAppStrings.goBackButton,
                username: user.name,
                statusMessage: user.statusMessage,
                uImage: UImage(
                  imagePath: user.imageAddress,
                  imageSource: ImageSource.local,
                ),
                onTap: () {
                  // !! add block workflow
                },
              ),
            );
            break;
          case 'Report':
            // TODO(yijing): add report workflow
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) {
        return <UPopupMenuEntry<String>>[
          UPopupMenuItem<String>(
            padding: EdgeInsets.zero,
            value: model,
            child: SizedBox(
              width: 160,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: UText(
                  model,
                  textStyle: UTextStyle.BUT1_primaryButton,
                  textColor: UColors.white,
                ),
              ),
            ),
          ),
          const UPopupMenuItem<String>(
            value: 'Report',
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: 160,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: UText(
                  'Report',
                  textStyle: UTextStyle.BUT1_primaryButton,
                  textColor: UColors.termRed,
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
