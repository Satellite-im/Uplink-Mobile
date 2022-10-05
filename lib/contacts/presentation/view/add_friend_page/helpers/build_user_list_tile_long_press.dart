import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/chat/presentation/view/chat_room_page/chat_room_page.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/presentation/view/add_friend_page/models/models_export.dart';
import 'package:uplink/contacts/presentation/view/user_profile_page/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

void buildUserListTileLongPress(BuildContext context, User user) {
  final _friendController = GetIt.I.get<FriendBloc>();
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
        Navigator.of(context, rootNavigator: true).pop();
        showDialog<void>(
          context: context,
          builder: (context) {
            return UDialogUserProfile(
              bodyText: UAppStrings.blockDialogQ,
              buttonText: UAppStrings.block,
              popButtonText: UAppStrings.goBackButton,
              onTap: () {
                _friendController.add(BlockUserStarted(user));
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
            );
          },
        ).then((value) {
          _friendController.add(
            SearchUserStarted(userDid: user.did!),
          );
        });
      },
      // TODO(yijing): add report pages
      () {},
    ],
  ).show();
}
