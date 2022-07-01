import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/models/user_notifier.dart';
import 'package:uplink/contacts/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/models_export.dart';

class FriendBody extends StatelessWidget {
  const FriendBody({Key? key, required this.user}) : super(key: key);

  final MockContact user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 24),
        ContactListTile(
          name: user.name,
          status: user.status,
          statusMessage: user.statusMessage,
          imageAddress: user.imageAddress,
          onTap: () {},
          trailing: const UIcon(
            UIcons.friend_added,
            color: UColors.textDark,
          ),
        ),
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: UButton.primary(
            label: 'Remove Friend',
            uIconData: UIcons.remove_friend,
            color: UColors.termRed,
            onPressed: () {
              final userNotifier = context.read<UserNotifier>();
              //Dialog widget cut the route of context, so we need to get the existing UserNotifier and expose it to the dialog widget.
              showDialog<void>(
                context: context,
                builder: (context) {
                  return ChangeNotifierProvider.value(
                    value: userNotifier,
                    child: UDialogUserProfile(
                      bodyText:
                          'Are you sure you want to remove this user from your Contact’s list?',
                      buttonText: UAppStrings.remove,
                      buttonColor: UColors.termRed,
                      popButtonText: 'Go Back',
                      onTap: () {
                        userNotifier.removeFriend();
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
          ),
        )
      ],
    );
  }
}
