import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/global/unread_messages_indicator/unread_messages_indicator.dart';
import 'package:ui_library/widgets/u_user_profile/u_user_profile_unreads/u_user_profile_unreads.dart';

void main() {
  group('Widget Test UUserProfileUnreads |', () {
    testWidgets(
        'Should return the right size value when the unread messages is less than or equal to 999',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: const [
                  UUserProfileUnreads(
                    unreadMessages: 199,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UUserProfileUnreads));
      expect(_baseSize.width, equals(40.0));
      expect(_baseSize.height, equals(40.0));
    });

    testWidgets(
        'Should return the right size value when the unread messages is greater than or equal to 1000',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  UUserProfileUnreads(
                    unreadMessages: 9999,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UUserProfileUnreads));
      expect(_baseSize.width, equals(42.0));
      expect(_baseSize.height, equals(40.0));
    });

    testWidgets('Should find unread messages indicator widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UUserProfileUnreads(
              unreadMessages: 9999,
            ),
          ),
        ),
      );

      final _unreadMessagesIndicator = find.byType(UnreadMessagesIndicator);
      expect(_unreadMessagesIndicator, findsOneWidget);
    });
    goldenTest(
      'Golden Test | Should return correct UUserProfileUnreads specs |',
      fileName: 'user_profile_unreads',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name:
                'Should return correct format with unread messages is less than 10',
            child: const UUserProfileUnreads(
              unreadMessages: 9,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format with unread messages is less than 100',
            child: const UUserProfileUnreads(
              unreadMessages: 99,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format with unread messages is less than 1000',
            child: const UUserProfileUnreads(
              unreadMessages: 999,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format with unread messages is less than 10000',
            child: const UUserProfileUnreads(
              unreadMessages: 9999,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format with unread messages is greater than 10000',
            child: const UUserProfileUnreads(
              unreadMessages: 9999999,
            ),
          ),
        ],
      ),
    );
  });
}
