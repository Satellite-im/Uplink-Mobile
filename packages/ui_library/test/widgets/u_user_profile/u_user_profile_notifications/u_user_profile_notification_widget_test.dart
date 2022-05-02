import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/u_user_profile/u_user_profile_notifications/u_user_profile_notification.dart';

void main() {
  group('Widget Test UUserProfileNotification |', () {
    testWidgets('Should return the right size value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: const [
                UUserProfileNotification(),
              ],
            ),
          ),
        ),
      );

      final Size _baseSize =
          tester.getSize(find.byType(UUserProfileNotification));
      expect(_baseSize.width, equals(40.0));
      expect(_baseSize.height, equals(40.0));
    });

    testWidgets('Should find notification indicator widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UUserProfileNotification(),
          ),
        ),
      );

      final _notificationIndicator = find.byType(NotificationIndicator);
      expect(_notificationIndicator, findsOneWidget);
    });
    goldenTest(
      'Golden Test | Should return correct UUserProfileNotification specs |',
      fileName: 'user_profile_notification',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'Should return correct format without username',
            child: const UUserProfileNotification(),
          ),
          GoldenTestScenario(
            name: 'Should return correct format with username normal',
            child: const UUserProfileNotification.withUsername(
              username: 'username',
            ),
          ),
          GoldenTestScenario(
            name: 'Should return correct format with username long',
            child: const UUserProfileNotification.withUsername(
              username: 'longusername',
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format with username that doesn\'t fit',
            child: const UUserProfileNotification.withUsername(
              username: 'longusernamebigger',
            ),
          ),
        ],
      ),
    );
  });
}
