import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/global/unread_messages_indicator.dart';
import 'package:ui_library/widgets/u_user_profile/u_user_profile_unreads_chat_bubble/u_user_profile_unreads_chat_bubble.dart';

void main() {
  group('Widget Test UUserProfileUnreadsChatBubble |', () {
    testWidgets('Should return the right size value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      UUserProfileUnreadsChatBubble(
                        unreadMessages: 9999,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final Size _baseSize =
          tester.getSize(find.byType(UUserProfileUnreadsChatBubble));
      expect(_baseSize.width, equals(56.0));
      expect(_baseSize.height, equals(56.0));
    });

    testWidgets('Should find unread messages indicator widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UUserProfileUnreadsChatBubble(
              unreadMessages: 9999,
            ),
          ),
        ),
      );

      final _unreadMessagesIndicator = find.byType(UnreadMessagesIndicator);
      expect(_unreadMessagesIndicator, findsOneWidget);
    });
    goldenTest(
      'Golden Test | Should return correct UUserProfileUnreadsChatBubble specs |',
      fileName: 'user_profile_unreads_chat_bubble',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name:
                'Should return correct format with unread messages is less than 10',
            child: const UUserProfileUnreadsChatBubble(
              unreadMessages: 9,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format with unread messages is less than 100',
            child: const UUserProfileUnreadsChatBubble(
              unreadMessages: 99,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format with unread messages is less than 1000',
            child: const UUserProfileUnreadsChatBubble(
              unreadMessages: 999,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format with unread messages is less than 10000',
            child: const UUserProfileUnreadsChatBubble(
              unreadMessages: 9999,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format with unread messages is greater than 10000',
            child: const UUserProfileUnreadsChatBubble(
              unreadMessages: 9999999,
            ),
          ),
        ],
      ),
    );
  });
}
