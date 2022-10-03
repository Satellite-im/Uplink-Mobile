// ignore_for_file: lines_longer_than_80_chars, no_default_cases

import 'package:flutter/material.dart';
import 'package:uplink/contacts/presentation/view/add_friend_page/widgets/widgets_export.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class FoundUserBody extends StatelessWidget {
  const FoundUserBody({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
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
