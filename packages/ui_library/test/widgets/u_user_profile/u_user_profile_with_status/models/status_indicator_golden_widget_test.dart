import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';

void main() {
  group('UUserProfile Status Indicator |', () {});

  testWidgets(
    'Golden Test clip path for USizes.userProfileLargeSize',
    (tester) async {
      await tester.runAsync(
        () async {
          await tester.pumpWidget(
            const SystemUnderTest(),
          );
          await tester.pumpAndSettle();
        },
      );

      await expectLater(find.byType(SystemUnderTest),
          matchesGoldenFile('three_status_indicator.png'));
    },
    tags: 'golden',
  );
}

class SystemUnderTest extends StatelessWidget {
  const SystemUnderTest({
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
            children: [
              StatusIndicator(Status.online,
                  userProfileSize: UUserProfileSize.large),
              const SizedBox.square(
                dimension: 8,
              ),
              StatusIndicator(Status.online,
                  userProfileSize: UUserProfileSize.normal),
              const SizedBox.square(
                dimension: 8,
              ),
              StatusIndicator(Status.online,
                  userProfileSize: UUserProfileSize.topMenuBar),
            ],
          ),
        ),
      ),
    );
  }
}
