// ignore_for_file: lines_longer_than_80_chars, no_default_cases

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uplink/contacts/add_friend_page/models/user_notifier.dart';
import 'package:uplink/contacts/add_friend_page/widgets/widgets_export.dart';
import 'package:uplink/utils/mock/models/models_export.dart';

class FoundUserBody extends StatelessWidget {
  const FoundUserBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserNotifier>().user;

    switch (user.relationship) {
      case Relationship.block:
        return BlockedBody(user: user);
      case Relationship.friend:
        return FriendBody(user: user);
      case Relationship.none:
        if (user.friendRequestSent == false) {
          return WithoutFriendRequestBody(user: user);
        } else {
          return WithFriendRequestBody(user: user);
        }
      default:
        return WithoutFriendRequestBody(user: user);
    }
  }
}
