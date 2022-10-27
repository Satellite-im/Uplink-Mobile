// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/chat/presentation/view/chat_room_page/chat_room_page.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class CTAButton extends StatelessWidget {
  const CTAButton({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    if (user.relationship == Relationship.friend) {
      return UButton.primary(
        label: UAppStrings.message,
        uIconData: UIcons.message,
        onPressed: () {
          Navigator.of(context, rootNavigator: true)
              .push(
                MaterialPageRoute<void>(
                  builder: (context) => ChatRoomPage(
                    user: user,
                  ),
                ),
              )
              .then(
                (value) =>
                    GetIt.I.get<FriendBloc>().closeWatchUserStatusStream(),
              );
        },
      );
    } else if (user.relationship == Relationship.none) {
      return _TwoButtonsRow(disabled: false, user: user);
    }
    return UButton.primary(
      label: UAppStrings.addFriend,
      uIconData: UIcons.add_contact,
      onPressed: () {
        GetIt.I.get<FriendBloc>().add(SendFriendRequestStarted());
      },
    );
  }
}

class _TwoButtonsRow extends StatelessWidget {
  const _TwoButtonsRow({Key? key, required this.disabled, required this.user})
      : super(key: key);

  final User user;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: UButton.secondary(
            label: UAppStrings.message,
            uIconData: UIcons.message,
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .push(
                    MaterialPageRoute<void>(
                      builder: (context) => ChatRoomPage(
                        user: user,
                      ),
                    ),
                  )
                  .then(
                    (value) =>
                        GetIt.I.get<FriendBloc>().closeWatchUserStatusStream(),
                  );
            },
            disabled: disabled,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: UButton.primary(
            label: UAppStrings.addFriend,
            uIconData: UIcons.add_contact,
            onPressed: () {
              GetIt.I.get<FriendBloc>().add(SendFriendRequestStarted());
            },
            disabled: disabled,
          ),
        )
      ],
    );
  }
}
