import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/chat/presentation/view/chat_room_page/chat_room_page.dart';
import 'package:uplink/contacts/add_friend_page/presentation/view/models/user_notifier.dart';
import 'package:uplink/contacts/user_profile_page/models/user_profile_bottom_sheet.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

void buildUserListTileLongPress(BuildContext context, User user) {
  UBottomSheetOptions(
    context,
    sheetTitle: UAppStrings.moreOptions,
    titleList: [
      UAppStrings.message,
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
      () {
        Navigator.of(context, rootNavigator: true).pop();

        Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute<void>(
            builder: (context) => ChatRoomPage(
              user: user,
            ),
          ),
        );
      },
      // TODO(yijing): add profile pages
      () {
        Navigator.of(context, rootNavigator: true).pop();
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          useRootNavigator: true,
          builder: (context) => GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
            //close the sheet when the outside is tapped
            child: GestureDetector(
              onTap: () {},
              child: UserProfileBottomSheet(user: user),
            ),
          ),
        );
      },
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
                username: user.username,
                uImage: UImage(
                  imagePath: user.profilePicture == null
                      ? ''
                      : user.profilePicture!.path,
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
