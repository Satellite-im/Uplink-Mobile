import 'package:ui_library/ui_library_export.dart';
import 'package:flutter/material.dart';

class UUserProfileCardsPage extends StatelessWidget {
  const UUserProfileCardsPage({Key? key}) : super(key: key);

  static const routeName = '/UUserProfileCards';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox.square(
              dimension: 16,
            ),
            const _AvatarProfileRow(
              title: 'Nav Drawer User Profile Card',
              widgets: [
                UNavDrawerUserProfileCard(
                  username: 'Satellite',
                  status: Status.online,
                  message: 'I am happy today',
                ),
                UNavDrawerUserProfileCard(
                  username: 'usernamelonger',
                  status: Status.online,
                  message: 'I am happy today',
                ),
              ],
            ),
            _userProfileCard(),
            _unreadMessagesUserProfileCard(),
          ],
        ),
      ),
    );
  }

  Column _userProfileCard() {
    return Column(
      children: [
        const SizedBox.square(
          dimension: 16,
        ),
        const UText(
          'User Profile Card',
          textStyle: UTextStyle.H4_fourthHeader,
        ),
        const SizedBox.square(
          dimension: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            UserProfileCard(
              username: 'Satellite',
              status: Status.online,
              message: 'I am happy today',
            ),
            SizedBox.square(
              dimension: 16,
            ),
            UserProfileCard(
              username: 'usernamelonger',
              status: Status.online,
              message: 'I am happy today',
            ),
          ],
        ),
      ],
    );
  }

  Column _unreadMessagesUserProfileCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox.square(
          dimension: 16,
        ),
        UText(
          'Unread Messages User Profile Card',
          textStyle: UTextStyle.H4_fourthHeader,
        ),
        SizedBox.square(
          dimension: 16,
        ),
        UnreadMessagesUserProfileCard(
          username: 'Satellite',
          status: Status.online,
          message: 'I am happy today',
          unreadMessages: 1,
        ),
        SizedBox.square(
          dimension: 8,
        ),
        UnreadMessagesUserProfileCard(
          username: 'usernamelonger',
          status: Status.online,
          message: 'I am happy today',
          unreadMessages: 10,
        ),
      ],
    );
  }
}

class _AvatarProfileRow extends StatelessWidget {
  const _AvatarProfileRow(
      {Key? key, required this.title, required this.widgets})
      : super(key: key);

  final String title;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    List<Widget> _avatarProfiles = [];

    widgets.forEach(((element) {
      _avatarProfiles.add(element);
      _avatarProfiles.add(const SizedBox.square(dimension: 8));
    }));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox.square(
          dimension: 16,
        ),
        UText(
          title,
          textStyle: UTextStyle.H4_fourthHeader,
        ),
        const SizedBox.square(
          dimension: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _avatarProfiles,
        )
      ],
    );
  }
}
