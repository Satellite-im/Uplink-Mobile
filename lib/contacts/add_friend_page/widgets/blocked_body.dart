import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/models/user_notifier.dart';
import 'package:uplink/contacts/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
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
          trailing: const UIcon(
            UIcons.blocked_contacts,
            color: UColors.textDark,
          ),
          onLongPress: () {
            UBottomSheetOptions(
              context,
              sheetTitle: UAppStrings.moreOptions,
              titleList: ['Profile', 'Report'],
              iconList: [UIcons.user_profile, UIcons.report],
              onTapList: [
                // TODO(yijing): add profile pages
                () {},
                // TODO(yijing): add report pages
                () {},
              ],
            ).show();
          },
        ),
        const SizedBox(height: 56),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: UButton.primary(
            label: UAppStrings.blockedBody_unblock,
            uIconData: UIcons.blocked_contacts,
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
                      bodyText: UAppStrings.blockedBody_q,
                      buttonText: UAppStrings.blockedBody_unblock,
                      popButtonText: UAppStrings.goBackButton,
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
