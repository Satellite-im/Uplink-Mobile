// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:uplink/contacts/user_profile_page/user_profile_page.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

GlobalKey<UserProfilePageState> userProfilePageKey = GlobalKey();

class UserProfileBottomSheet extends StatelessWidget {
  const UserProfileBottomSheet({
    Key? key,
    required this.user,
  }) : super(key: key);

  final MockContact user;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        // close the bottom sheet when its height is less 0
        if (notification.extent <= 0) {
          Navigator.of(context, rootNavigator: true).pop();
        }
        // when in the full screen status
        if (notification.extent == 1) {
          userProfilePageKey.currentState?.backButtonOpacity = 1;
          //disconnect the profile pages's scrollController with DraggableScrollableSheet's scrollController
          userProfilePageKey.currentState?.controller = null;
          userProfilePageKey.currentState?.reduecdTopHeight = 0;
          userProfilePageKey.currentState?.showHomeIndicator = false;
        }
        return true;
      },
      child: DraggableScrollableSheet(
        snapSizes: const [0, 1],
        minChildSize: 0,
        snap: true,
        builder: (context, scrollController) => UserProfilePage(
          key: userProfilePageKey,
          user: user,
          controller: scrollController,
          //connect the scrollController from DraggableScrollableSheet
          reduecdTopHeight: 44,
          backButtonOpacity: 0,
          isFromBottomSheet: true,
          showHomeIndicator: true,
        ),
      ),
    );
  }
}
