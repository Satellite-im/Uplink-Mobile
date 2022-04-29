import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';

void main() {
  group('UUserProfile Status Indicator |', () {});

  testWidgets(
    'Golden Test for Status Indicator Sizes and Colors',
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

  testWidgets(
      'Should return the right size value when the User Profile is large',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: StatusIndicator(Status.online,
              userProfileSize: UUserProfileSize.large),
        ),
      ),
    );

    final Size _baseSize = tester.getSize(find.byType(StatusIndicator));
    expect(_baseSize.width, equals(12.0));
    expect(_baseSize.height, equals(12.0));
  });

  testWidgets(
      'Should return the right size value when the User Profile is normal',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: StatusIndicator(Status.online,
              userProfileSize: UUserProfileSize.normal),
        ),
      ),
    );

    final Size _baseSize = tester.getSize(find.byType(StatusIndicator));
    expect(_baseSize.width, equals(12.0));
    expect(_baseSize.height, equals(12.0));
  });

  testWidgets(
      'Should return the right size value when the User Profile is top menu bar',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: StatusIndicator(Status.online,
              userProfileSize: UUserProfileSize.topMenuBar),
        ),
      ),
    );

    final Size _baseSize = tester.getSize(find.byType(StatusIndicator));
    expect(_baseSize.width, equals(8.0));
    expect(_baseSize.height, equals(8.0));
  });
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const UText('When User Profile has Large Size',
                  textStyle: UTextStyle.H5_topMenuBarTitle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StatusIndicator(Status.online,
                      userProfileSize: UUserProfileSize.large),
                  const SizedBox.square(
                    dimension: 8,
                  ),
                  StatusIndicator(Status.idle,
                      userProfileSize: UUserProfileSize.large),
                  const SizedBox.square(
                    dimension: 8,
                  ),
                  StatusIndicator(Status.offline,
                      userProfileSize: UUserProfileSize.large),
                ],
              ),
              const SizedBox.square(
                dimension: 8,
              ),
              const UText('When User Profile has Normal Size',
                  textStyle: UTextStyle.H5_topMenuBarTitle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StatusIndicator(Status.online,
                      userProfileSize: UUserProfileSize.normal),
                  const SizedBox.square(
                    dimension: 8,
                  ),
                  StatusIndicator(Status.idle,
                      userProfileSize: UUserProfileSize.normal),
                  const SizedBox.square(
                    dimension: 8,
                  ),
                  StatusIndicator(Status.offline,
                      userProfileSize: UUserProfileSize.normal),
                ],
              ),
              const SizedBox.square(
                dimension: 8,
              ),
              const UText('When User Profile has Top Menu Bar Size',
                  textStyle: UTextStyle.H5_topMenuBarTitle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StatusIndicator(Status.online,
                      userProfileSize: UUserProfileSize.topMenuBar),
                  const SizedBox.square(
                    dimension: 8,
                  ),
                  StatusIndicator(Status.idle,
                      userProfileSize: UUserProfileSize.topMenuBar),
                  const SizedBox.square(
                    dimension: 8,
                  ),
                  StatusIndicator(Status.offline,
                      userProfileSize: UUserProfileSize.topMenuBar),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
