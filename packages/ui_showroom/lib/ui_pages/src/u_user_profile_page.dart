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
          children: const [
            _UserProfileRow(
              title: 'User Profile Status 56x56',
              userProfile: [
                UserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.large,
                ),
                UserProfileWithStatus(
                  status: Status.idle,
                  userProfileSize: UUserProfileSize.large,
                ),
                UserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.large,
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Status 40x40',
              userProfile: [
                UserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.normal,
                ),
                UserProfileWithStatus(
                  status: Status.idle,
                  userProfileSize: UUserProfileSize.normal,
                ),
                UserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.normal,
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Status 36x36',
              userProfile: [
                UserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.topMenuBar,
                ),
                UserProfileWithStatus(
                  status: Status.idle,
                  userProfileSize: UUserProfileSize.topMenuBar,
                ),
                UserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.topMenuBar,
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile 40x40',
              userProfile: [
                UserProfile(),
                UserProfile.withUsername(
                  username: 'username',
                ),
                UserProfile.withUsername(
                  username: 'longusername',
                ),
                UserProfile.withUsername(
                  username: 'longusernamebigger',
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Notifications 40x40',
              userProfile: [
                UserProfileNotification(),
                UserProfileNotification.withUsername(
                  username: 'username',
                ),
                UserProfileNotification.withUsername(
                  username: 'longusername',
                ),
                UserProfileNotification.withUsername(
                  username: 'longusernamebigger',
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
      {Key? key, required this.title, required this.userProfile})
      : super(key: key);

  final String title;
  final List<Widget> userProfile;

  @override
  Widget build(BuildContext context) {
    List<Widget> _userProfiles = [];

    userProfile.forEach(((element) {
      _userProfiles.add(element);
      _userProfiles.add(const SizedBox.square(dimension: 8));
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
          children: _userProfiles,
        )
      ],
    );
  }
}
