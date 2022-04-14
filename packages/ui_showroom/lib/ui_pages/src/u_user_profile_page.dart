import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UUserProfileImagePage extends StatelessWidget {
  const UUserProfileImagePage({Key? key}) : super(key: key);

  static const routeName = '/UUserProfile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox.square(
              dimension: 16,
            ),
            _UserProfileRow(
              title: '56x56',
              userProfileStatus: [
                UserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.large,
                ),
                UserProfileWithStatus(
                  status: Status.busy,
                  userProfileSize: UUserProfileSize.large,
                ),
                UserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.large,
                ),
              ],
            ),
            const SizedBox.square(
              dimension: 16,
            ),
            _UserProfileRow(
              title: '40x40',
              userProfileStatus: [
                const UserProfile(),
                const UserProfile.withName(
                  name: 'Name',
                ),
                UserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.normal,
                ),
                UserProfileWithStatus(
                  status: Status.busy,
                  userProfileSize: UUserProfileSize.normal,
                ),
                UserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.normal,
                ),
              ],
            ),
            const SizedBox.square(
              dimension: 16,
            ),
            _UserProfileRow(
              title: '36x36',
              userProfileStatus: [
                UserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.topMenuBar,
                ),
                UserProfileWithStatus(
                  status: Status.busy,
                  userProfileSize: UUserProfileSize.topMenuBar,
                ),
                UserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.topMenuBar,
                ),
              ],
            ),
            const SizedBox.square(
              dimension: 16,
            ),
            _UserProfileRow(
              title: 'All',
              userProfileStatus: [
                const UserProfile(),
                const UserProfile.withName(
                  name: 'Name',
                ),
                UserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.large,
                ),
                UserProfileWithStatus(
                  status: Status.busy,
                  userProfileSize: UUserProfileSize.normal,
                ),
                UserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.topMenuBar,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _UserProfileRow extends StatelessWidget {
  const _UserProfileRow(
      {Key? key, required this.title, required this.userProfileStatus})
      : super(key: key);

  final String title;
  final List<Widget> userProfileStatus;

  @override
  Widget build(BuildContext context) {
    List<Widget> _userProfiles = [];

    userProfileStatus.forEach(((element) {
      _userProfiles.add(element);
      _userProfiles.add(const SizedBox.square(dimension: 4));
    }));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
          children: _userProfiles,
        )
      ],
    );
  }
}
