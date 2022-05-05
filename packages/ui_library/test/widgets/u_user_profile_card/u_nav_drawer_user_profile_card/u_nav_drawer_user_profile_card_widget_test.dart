import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';

void main() {
  group('Widget Test UNavDrawerUserProfileCard |', () {
    goldenTest(
      'Golden Test | Should return correct UNavDrawerUserProfileCard specs |',
      fileName: 'u_nav_drawer_user_profile_card',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name:
                'Should return correct UNavDrawerUserProfileCard format with normal size username',
            child: const UNavDrawerUserProfileCard(
              username: 'Satellite',
              status: Status.online,
              message: 'I am happy today',
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct UNavDrawerUserProfileCard format with large size username',
            child: const UNavDrawerUserProfileCard(
              username: 'Usernamelonger',
              status: Status.online,
              message: 'I am happy today',
            ),
          ),
        ],
      ),
    );
  });
}
