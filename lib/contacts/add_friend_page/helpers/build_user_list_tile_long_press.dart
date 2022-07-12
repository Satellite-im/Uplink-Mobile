import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/models_export.dart';

void buildUserListTileLongPress(BuildContext context, MockContact user) {
  UBottomSheetOptions(
    context,
    sheetTitle: UAppStrings.moreOptions,
    titleList: [
      UAppStrings.buildUserListTileLongPress_message,
      UAppStrings.buildUserListTileLongPress_profile,
      UAppStrings.block,
      UAppStrings.report,
    ],
    iconList: [
      UIcons.message,
      UIcons.user_profile,
      UIcons.blocked_contacts,
      UIcons.report
    ],
    colorList: [UColors.white, UColors.white, UColors.white, UColors.termRed],
    onTapList: [
      // TODO(yijing): add message pages
      () {},
      // TODO(yijing): add profile pages
      () {},
      () {
        final userNotifier = context.read<UserNotifier>();
        Navigator.of(context, rootNavigator: true).pop();
        showDialog<void>(
          context: context,
          builder: (context) {
            return ChangeNotifierProvider.value(
              value: userNotifier,
              child: UDialogUserProfile(
                bodyText: UAppStrings.blockDialogQ,
                buttonText: UAppStrings.block,
                popButtonText: UAppStrings.goBackButton,
                onTap: () {
                  userNotifier.blockFriend();
                  Navigator.of(context).pop();
                },
                username: user.name,
                uImage: UImage(
                  imagePath: user.imageAddress,
                  imageSource: ImageSource.local,
                ),
                statusMessage: user.statusMessage,
              ),
            );
          },
        );
      },
      // TODO(yijing): add report pages
      () {},
    ],
  ).show();
}
