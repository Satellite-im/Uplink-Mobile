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
              username: 'Satellite',
              status: Status.online,
              message: 'I am happy today',
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct UserProfileCard format with large size username',
            child: const UserProfileCard(
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
