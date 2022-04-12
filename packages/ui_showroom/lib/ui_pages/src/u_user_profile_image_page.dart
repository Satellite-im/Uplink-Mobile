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
          children: const [
            SizedBox.square(
              dimension: 16,
            ),
            UserProfileStatus.large(
              status: 'online',
            ),
            SizedBox.square(
              dimension: 16,
            ),
            UserProfileStatus.normal(
              status: 'online',
            ),
            SizedBox.square(
              dimension: 16,
            ),
            UserProfileStatus.topMenuBar(
              status: 'online',
            ),
          ],
        ),
      ),
    );
  }
}
