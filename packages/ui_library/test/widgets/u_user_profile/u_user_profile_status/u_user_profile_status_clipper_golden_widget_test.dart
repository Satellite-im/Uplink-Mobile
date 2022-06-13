import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/u_status/u_status_indicator.dart';
import 'package:ui_library/widgets/u_user_profile/models/models_export.dart';
import 'package:ui_library/widgets/u_user_profile/u_user_profile_status/u_user_profile_status.dart';

void main() {
  group('Widget Test UUserProfileStatus |', () {
    goldenTest(
      'Golden Test | Should return correct UUserProfileStatus specs |',
      fileName: 'user_profile_status',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name:
                'Should return correct clip path format when size is USizes.userProfileLargeSize',
            child:
                const SystemUnderTest(uUserProfileSize: UUserProfileSize.large),
          ),
          GoldenTestScenario(
            name:
                'Should return correct clip path format when size is UUserProfileSize.normal',
            child: const SystemUnderTest(
                uUserProfileSize: UUserProfileSize.normal),
          ),
          GoldenTestScenario(
            name:
                'Should return correct clip path format when size is UUserProfileSize.topMenuBar',
            child: const SystemUnderTest(
                uUserProfileSize: UUserProfileSize.topMenuBar),
          ),
        ],
      ),
    );
  });
}

class SystemUnderTest extends StatelessWidget {
  const SystemUnderTest({
    Key? key,
    required UUserProfileSize uUserProfileSize,
  })  : _size = uUserProfileSize,
        super(key: key);

  final UUserProfileSize _size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UUserProfileWithStatus(
          status: Status.online,
          userProfileSize: _size,
        ),
        const SizedBox.square(
          dimension: 8,
        ),
        UUserProfileWithStatus(
          status: Status.idle,
          userProfileSize: _size,
        ),
        const SizedBox.square(
          dimension: 8,
        ),
        UUserProfileWithStatus(
          status: Status.offline,
          userProfileSize: _size,
        ),
      ],
    );
  }
}
