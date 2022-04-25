import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';

void main() {
  group('UUserProfile |', () {
    testWidgets(
      '*** just a trick to load asset images ***',
      (tester) async {
        await tester.pumpWidget(const SystemUnderTestWithoutUsername());
        await tester.pumpAndSettle();
      },
      tags: 'golden',
    );

    testWidgets(
      'Golden Test User Profile without username',
      (tester) async {
        tester.binding.ensureVisualUpdate();
        await tester.pumpWidget(
          const SystemUnderTestWithoutUsername(),
        );
        await tester.pumpAndSettle(const Duration(seconds: 3));

        await expectLater(find.byType(SystemUnderTestWithoutUsername),
            matchesGoldenFile('user_profile_without_username.png'));
      },
      tags: 'golden',
    );

    testWidgets(
      'Golden Test User Profile with username',
      (tester) async {
        await tester.pumpWidget(
          const SystemUnderTestWithUsername(),
        );
        await tester.pumpAndSettle();

        await expectLater(find.byType(SystemUnderTestWithUsername),
            matchesGoldenFile('user_profile_with_username.png'));
      },
      tags: 'golden',
    );
  });
}

class SystemUnderTestWithoutUsername extends StatelessWidget {
  const SystemUnderTestWithoutUsername({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: UUserProfile(),
        ),
      ),
    );
  }
}

class SystemUnderTestWithUsername extends StatelessWidget {
  const SystemUnderTestWithUsername({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
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
        ),
      ),
    );
  }
}
