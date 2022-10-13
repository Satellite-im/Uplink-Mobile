import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/presentation/view/add_friend_page/helpers/build_user_list_tile_long_press.dart';
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
              final _friendController = GetIt.I.get<FriendBloc>();
              showDialog<void>(
                context: context,
                builder: (context) {
                  return UDialogUserProfile(
                    bodyText: UAppStrings.friendBody_remove_q,
                    buttonText: UAppStrings.remove,
                    buttonColor: UColors.termRed,
                    popButtonText: UAppStrings.goBackButton,
                    onTap: () {
                      _friendController.add(RemoveFriend(user));
                      Navigator.of(context).pop();
                    },
                    username: user.username,
                    uImage: UImage(
                      imagePath: user.profilePicture == null
                          ? ''
                          : user.profilePicture!.path,
                      imageSource: ImageSource.file,
                    ),
                    statusMessage: user.statusMessage,
                  );
                },
              ).then((value) {
                _friendController.add(
                  SearchUserStarted(
                    userDid: user.did!,
                  ),
                );
              });
            },
          ),
        )
      ],
    );
  }
}
