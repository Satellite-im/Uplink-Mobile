import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UUserProfileImagePage extends StatelessWidget {
  const UUserProfileImagePage({Key? key}) : super(key: key);

  static const routeName = '/UUserProfileImage';

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
                UserProfileStatus.large(
                  status: Status.online,
                ),
                UserProfileStatus.large(
                  status: Status.busy,
                ),
                UserProfileStatus.large(
                  status: Status.offline,
                ),
              ],
            ),
            const SizedBox.square(
              dimension: 16,
            ),
            _UserProfileRow(
              title: '40x40',
              userProfileStatus: [
                UserProfileStatus.normal(
                  status: Status.online,
                ),
                UserProfileStatus.normal(
                  status: Status.busy,
                ),
                UserProfileStatus.normal(
                  status: Status.offline,
                ),
              ],
            ),
            const SizedBox.square(
              dimension: 16,
            ),
            _UserProfileRow(
              title: '36x36',
              userProfileStatus: [
                UserProfileStatus.topMenuBar(
                  status: Status.online,
                ),
                UserProfileStatus.topMenuBar(
                  status: Status.busy,
                ),
                UserProfileStatus.topMenuBar(
                  status: Status.offline,
                ),
              ],
            ),
            const SizedBox.square(
              dimension: 16,
            ),
            _UserProfileRow(
              title: 'All',
              userProfileStatus: [
                UserProfileStatus.large(
                  status: Status.online,
                ),
                UserProfileStatus.normal(
                  status: Status.busy,
                ),
                UserProfileStatus.topMenuBar(
                  status: Status.offline,
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
  final List<UserProfileStatus> userProfileStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
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
          children: [
            const SizedBox.square(
              dimension: 4,
            ),
            Container(
                decoration: BoxDecoration(color: Colors.grey.shade300),
                child: userProfileStatus[0]),
            const SizedBox.square(
              dimension: 4,
            ),
            Container(
                decoration: BoxDecoration(color: Colors.grey.shade300),
                child: userProfileStatus[1]),
            const SizedBox.square(
              dimension: 4,
            ),
            Container(
                decoration: BoxDecoration(color: Colors.grey.shade300),
                child: userProfileStatus[2]),
          ],
        )
      ],
    );
  }
}
