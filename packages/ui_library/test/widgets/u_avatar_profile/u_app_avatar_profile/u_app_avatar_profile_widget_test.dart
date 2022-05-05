import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/global/unread_messages_indicator/unread_messages_indicator.dart';
import 'package:ui_library/widgets/u_avatars_profile/u_app_avatar_profile/u_app_avatar_profile.dart';

void main() {
  group('Widget Test UAppAvatarProfile |', () {
    testWidgets('Should return the right size value when the type is normal',
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
                      UAppAvatarProfile(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UAppAvatarProfile));
      expect(_baseSize.width, equals(40.0));
      expect(_baseSize.height, equals(40.0));
    });

    testWidgets(
        'Should return the right size value when the type is chat bubble',
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
                      UAppAvatarProfile.chatBubble(
                        unreadMessages: 333,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UAppAvatarProfile));
      expect(_baseSize.width, equals(56.0));
      expect(_baseSize.height, equals(56.0));
    });

    testWidgets('Should find unread messages indicator widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UAppAvatarProfile.chatBubble(
              unreadMessages: 9999,
            ),
          ),
        ),
      );

      final _unreadMessagesIndicator = find.byType(UnreadMessagesIndicator);
      expect(_unreadMessagesIndicator, findsOneWidget);
    });
    goldenTest(
      'Golden Test | Should return correct UAppAvatarProfile Chat Buble Type specs |',
      fileName: 'u_app_avatar_profile_chat_bubble',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'Should return correct format when unread messages is null',
            child: const UAppAvatarProfile.chatBubble(),
          ),
          GoldenTestScenario(
            name: 'Should return correct format when unread messages is 0',
            child: const UAppAvatarProfile.chatBubble(
              unreadMessages: 0,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format when unread messages is less than 10',
            child: const UAppAvatarProfile.chatBubble(
              unreadMessages: 9,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format when unread messages is less than 100',
            child: const UAppAvatarProfile.chatBubble(
              unreadMessages: 99,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format when unread messages is less than 1000',
            child: const UAppAvatarProfile.chatBubble(
              unreadMessages: 999,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format when unread messages is less than 10000',
            child: const UAppAvatarProfile.chatBubble(
              unreadMessages: 9999,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct format when unread messages is greater than 10000',
            child: const UAppAvatarProfile.chatBubble(
              unreadMessages: 9999999,
            ),
          ),
        ],
      ),
    );
  });
}
