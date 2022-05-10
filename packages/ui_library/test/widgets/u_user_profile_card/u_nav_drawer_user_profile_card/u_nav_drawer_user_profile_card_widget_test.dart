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
              username: 'longusernameeeeeeeeeeeeeeeeeeeeeee',
              status: Status.online,
              message: 'Lorem ipsum dolor sit amet',
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct UNavDrawerUserProfileCard format with large size username',
            child: const UNavDrawerUserProfileCard(
              username: 'username',
              status: Status.online,
              message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
            ),
          ),
        ],
      ),
    );
  });
}
