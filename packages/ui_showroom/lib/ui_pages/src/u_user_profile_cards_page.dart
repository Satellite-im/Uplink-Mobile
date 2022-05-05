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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox.square(
              dimension: 16,
            ),
            _AvatarProfileRow(
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
          ],
        ),
      ),
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
