import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UAvatarProfilePage extends StatelessWidget {
  const UAvatarProfilePage({Key? key}) : super(key: key);

  static const routeName = '/UAvatarProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: ListView(
          children: const [
            _AvatarProfileRow(
              title: 'Group Profile',
              userProfile: [
                UGroupProfile(),
              ],
            ),
            _AvatarProfileRow(
              title: 'Server Profile',
              userProfile: [
                UServerProfile(),
              ],
            ),
            SizedBox.square(
              dimension: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarProfileRow extends StatelessWidget {
  const _AvatarProfileRow(
      {Key? key, required this.title, required this.userProfile})
      : super(key: key);

  final String title;
  final List<Widget> userProfile;

  @override
  Widget build(BuildContext context) {
    List<Widget> _avatarProfiles = [];

    userProfile.forEach(((element) {
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
          textStyle: UTextStyle.H5_topMenuBarTitle,
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
