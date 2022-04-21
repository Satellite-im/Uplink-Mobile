import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/u_user_profile/models/models_export.dart';
import 'package:ui_library/widgets/u_user_profile/u_user_profile_status/u_user_profile_status.dart';

void main() {
  group('UClipperUserProfileStatus |', () {
    testWidgets(
      '*** just a trick to load asset images ***',
      (tester) async {
        await tester.pumpWidget(
            const SystemUnderTest(uUserProfileSize: UUserProfileSize.large));
        await tester.pumpAndSettle();
      },
      tags: 'golden',
    );

    testWidgets(
      'Golden Test clip path for USizes.userProfileLargeSize',
      (tester) async {
        await tester.runAsync(
          () async {
            await tester.pumpWidget(
              const SystemUnderTest(uUserProfileSize: UUserProfileSize.large),
            );
            await tester.pumpAndSettle();
          },
          additionalTime: const Duration(seconds: 3),
        );

        await expectLater(find.byType(SystemUnderTest),
            matchesGoldenFile('user_profile_status_large_size.png'));
      },
      tags: 'golden',
    );

    testWidgets(
      'Golden Test clip path for USizes.userProfileNormalSize',
      (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            const SystemUnderTest(uUserProfileSize: UUserProfileSize.normal),
          );
          await tester.pumpAndSettle();
        });

        await expectLater(find.byType(SystemUnderTest),
            matchesGoldenFile('user_profile_status_normal_size.png'));
      },
      tags: 'golden',
    );

    testWidgets(
      'Golden Test clip path for USizes.userProfileTopMenuBarSize',
      (tester) async {
        await tester.runAsync(() async {
          await tester.pumpWidget(
            const SystemUnderTest(
                uUserProfileSize: UUserProfileSize.topMenuBar),
          );
          await tester.pumpAndSettle();
        });

        await expectLater(find.byType(SystemUnderTest),
            matchesGoldenFile('user_profile_status_top_menu_bar_size.png'));
      },
      tags: 'golden',
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
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserProfileWithStatus(
                status: Status.online,
                userProfileSize: _size,
              ),
              const SizedBox.square(
                dimension: 8,
              ),
              UserProfileWithStatus(
                status: Status.idle,
                userProfileSize: _size,
              ),
              const SizedBox.square(
                dimension: 8,
              ),
              UserProfileWithStatus(
                status: Status.offline,
                userProfileSize: _size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
