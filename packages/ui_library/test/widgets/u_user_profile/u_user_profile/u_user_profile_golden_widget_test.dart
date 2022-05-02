import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';

void main() {
  group('UUserProfile |', () {
    goldenTest(
      'Golden Tests for UUserProfile |',
      fileName: 'user_profile',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name:
                'Should return correct UUserProfiles format with username variations',
            child: const _SystemUnderTestWithUsername(),
          ),
          GoldenTestScenario(
            name: 'Should return correct UUserProfile without username',
            child: const _SystemUnderTestWithoutUsername(),
          ),
        ],
      ),
    );
  });
}

class _SystemUnderTestWithoutUsername extends StatelessWidget {
  const _SystemUnderTestWithoutUsername({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: UUserProfile(),
    );
  }
}

class _SystemUnderTestWithUsername extends StatelessWidget {
  const _SystemUnderTestWithUsername({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox.square(
            dimension: 8,
          ),
          UUserProfile.withUsername(
            username: 'username',
          ),
          SizedBox.square(
            dimension: 8,
          ),
          UUserProfile.withUsername(
            username: 'longusername',
          ),
          SizedBox.square(
            dimension: 8,
          ),
          UUserProfile.withUsername(
            username: 'longusernamebigger',
          ),
        ],
      ),
    );
  }
}
