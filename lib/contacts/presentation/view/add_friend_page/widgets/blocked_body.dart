import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/presentation/view/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class BlockedBody extends StatelessWidget {
  const BlockedBody({Key? key, required this.user}) : super(key: key);

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
          trailing: const UIcon(
            UIcons.blocked_contacts,
            color: UColors.textDark,
          ),
          onLongPress: () {
            UBottomSheetOptions(
              context,
              sheetTitle: UAppStrings.moreOptions,
              titleList: [
                UAppStrings.buildUserListTileLongPress_profile,
                UAppStrings.report,
              ],
              iconList: [UIcons.user_profile, UIcons.report],
              colorList: [UColors.white, UColors.termRed],
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
            label: UAppStrings.unblock,
            uIconData: UIcons.unblock,
            color: UColors.ctaBlue,
            onPressed: () {
              final _friendController = GetIt.I.get<FriendBloc>();
              showDialog<void>(
                context: context,
                builder: (context) {
                  return UDialogUserProfile(
                    bodyText: UAppStrings.unblockDialogQ,
                    buttonText: UAppStrings.unblock,
                    popButtonText: UAppStrings.goBackButton,
                    onTap: () {
                      _friendController.add(UnblockUserStarted(user));
                      Navigator.of(context).pop();
                    },
                    username: user.username,
                    uImage: UImage(
                      imageSource: ImageSource.local,
                      imagePath: user.profilePicture == null
                          ? ''
                          : user.profilePicture!.path,
                    ),
                    statusMessage: user.statusMessage,
                  );
                },
              ).then((value) {
                _friendController.add(WatchUserStarted(userDid: user.did!));
              });
            },
          ),
        )
      ],
    );
  }
}
