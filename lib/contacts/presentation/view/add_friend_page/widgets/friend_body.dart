import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/presentation/view/add_friend_page/helpers/build_user_list_tile_long_press.dart';
import 'package:uplink/contacts/presentation/view/add_friend_page/models/models_export.dart';
import 'package:uplink/contacts/presentation/view/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class FriendBody extends StatelessWidget {
  const FriendBody({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        ContactListTile(
          name: user.username,
          status: user.status ?? Status.offline,
          statusMessage: user.statusMessage,
          imageAddress:
              user.profilePicture == null ? '' : user.profilePicture!.path,
          onLongPress: () {
            buildUserListTileLongPress(context, user);
          },
          trailing: const UIcon(
            UIcons.friend_added,
            color: UColors.textDark,
          ),
        ),
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: UButton.primary(
            label: UAppStrings.friendBody_remove,
            uIconData: UIcons.remove_friend,
            color: UColors.termRed,
            onPressed: () {
              final userNotifier = context.read<UserNotifier>();
              //Dialog widget cut the route of context, we need to
              //get the existing UserNotifier and expose it to the dialog widget
              showDialog<void>(
                context: context,
                builder: (context) {
                  return ChangeNotifierProvider.value(
                    value: userNotifier,
                    child: UDialogUserProfile(
                      bodyText: UAppStrings.friendBody_remove_q,
                      buttonText: UAppStrings.remove,
                      buttonColor: UColors.termRed,
                      popButtonText: UAppStrings.goBackButton,
                      onTap: () {
                        userNotifier.removeFriend();
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
          ),
        )
      ],
    );
  }
}
