import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/models/user_notifier.dart';
import 'package:uplink/contacts/models/models_export.dart';
import 'package:uplink/utils/mock/models/models_export.dart';

class BlockedBody extends StatelessWidget {
  const BlockedBody({Key? key, required this.user}) : super(key: key);

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
            UIcons.blocked_contacts,
            color: UColors.textDark,
          ),
        ),
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: UButton.primary(
            label: 'Unblock',
            uIconData: UIcons.blocked_contacts,
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
                      bodyText: 'Are you sure you want to unblock this user?',
                      buttonText: 'Unblock',
                      popButtonText: 'Go Back',
                      onTap: () {
                        userNotifier.unblockFriend();
                        Navigator.of(context).pop();
                      },
                      username: user.name,
                      uImage: UImage(
                        imageSource: ImageSource.local,
                        imagePath: user.imageAddress,
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
