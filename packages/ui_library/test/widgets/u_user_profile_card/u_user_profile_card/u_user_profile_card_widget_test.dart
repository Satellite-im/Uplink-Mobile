import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';

void main() {
  group('Widget Test UserProfileCard |', () {
    goldenTest(
      'Golden Test | Should return correct UserProfileCard specs |',
      fileName: 'u_user_profile_card',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name:
                'Should return correct UserProfileCard format with normal size username',
            child: const UserProfileCard(
              username: 'longusernameeeeeeeeeeeeeeeeeeeeeee',
              status: Status.online,
              message: 'Lorem ipsum dolor sit amet',
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct UserProfileCard format with large size username',
            child: const UserProfileCard(
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
