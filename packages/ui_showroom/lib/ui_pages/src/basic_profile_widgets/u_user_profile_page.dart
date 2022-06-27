import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UUserProfilePage extends StatelessWidget {
  const UUserProfilePage({Key? key}) : super(key: key);

  static const routeName = '/UUserProfile';

  String _generateNewImage() {
    final _random = 1 + Random().nextInt(8);
    return 'packages/ui_library/images/placeholders/user_avatar_$_random.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: ListView(
          children: [
            _UserProfileRow(
              title: 'User Profile Status 56x56',
              userProfile: [
                UUserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.large,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfileWithStatus(
                  status: Status.idle,
                  userProfileSize: UUserProfileSize.large,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.large,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Status 40x40',
              userProfile: [
                UUserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.normal,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfileWithStatus(
                  status: Status.idle,
                  userProfileSize: UUserProfileSize.normal,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.normal,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Status 36x36',
              userProfile: [
                UUserProfileWithStatus(
                  status: Status.online,
                  userProfileSize: UUserProfileSize.topMenuBar,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfileWithStatus(
                  status: Status.idle,
                  userProfileSize: UUserProfileSize.topMenuBar,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfileWithStatus(
                  status: Status.offline,
                  userProfileSize: UUserProfileSize.topMenuBar,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile 40x40',
              userProfile: [
                const UUserProfile(),
                UUserProfile.withUsername(
                  username: 'username',
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfile.withUsername(
                  username: 'longusername',
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfile.withUsername(
                  username: 'longusernamebigger',
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Notification 40x40',
              userProfile: [
                const UUserProfileNotification(),
                UUserProfileNotification.withUsername(
                  username: 'username',
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfileNotification.withUsername(
                  username: 'longusername',
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfileNotification.withUsername(
                  username: 'longusernamebigger',
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Unreads 40x40',
              userProfile: [
                UUserProfileUnreads(
                  unreadMessages: 2,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfileUnreads.withUsername(
                  username: 'username',
                  unreadMessages: 89,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfileUnreads.withUsername(
                  username: 'longusername',
                  unreadMessages: 100,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                const UUserProfileUnreads.withUsername(
                  username: 'longusernamebigger',
                  unreadMessages: 99999,
                ),
              ],
            ),
            _UserProfileRow(
              title: 'User Profile Unreads Chat Bubble 56x56',
              userProfile: [
                UUserProfileUnreadsChatBubble(
                  unreadMessages: 2,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                UUserProfileUnreadsChatBubble(
                  unreadMessages: 89,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
                const UUserProfileUnreadsChatBubble(
                  unreadMessages: 100,
                ),
                UUserProfileUnreadsChatBubble(
                  unreadMessages: 99999,
                  uImage: UImage(
                    imagePath: _generateNewImage(),
                    imageSource: ImageSource.local,
                  ),
                ),
              ],
            ),
            const SizedBox.square(
              dimension: 16,
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
          textStyle: UTextStyle.H1_primaryHeader,
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
