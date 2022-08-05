import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/notifications/u_notification.dart';
import 'package:ui_library/widgets/notifications/u_notification_card.dart';

void main() {
  group('Widget Test UNotification Notification Types|', () {
    testWidgets(
        'Should return the right size and passed username param when notificationType is serverMessage',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(children: [
                Flexible(
                    child: UNotification(
                  username: 'Bob',
                  notificationType: NotificationType.serverMessage,
                  arrivalNotificationTime: DateTime(2022, 07, 01, 09),
                  isUnread: true,
                ))
              ]),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UNotification));
      expect(_baseSize.width, equals(800.0));
      expect(_baseSize.height, equals(58.0));

      final UNotificationCard _uNotificationCard =
          tester.widget(find.byType(UNotificationCard));
      expect(_uNotificationCard.uNotification.username, equals('Bob'));
    });
    testWidgets(
        'Should return the right size and passed username param when notificationType is repliedComment',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(children: [
                Flexible(
                    child: UNotification(
                  username: 'Bob',
                  notificationType: NotificationType.repliedComment,
                  arrivalNotificationTime: DateTime(2022, 07, 01, 09),
                  isUnread: true,
                ))
              ]),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UNotification));
      expect(_baseSize.width, equals(800.0));
      expect(_baseSize.height, equals(40.0));

      final UNotificationCard _uNotificationCard =
          tester.widget(find.byType(UNotificationCard));
      expect(_uNotificationCard.uNotification.username, equals('Bob'));
    });
    testWidgets(
        'Should return the right size and passed username param when notificationType is reactedComment',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(children: [
                Flexible(
                    child: UNotification(
                  username: 'Bob',
                  notificationType: NotificationType.reactedComment,
                  arrivalNotificationTime: DateTime(2022, 07, 01, 09),
                  isUnread: true,
                ))
              ]),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UNotification));
      expect(_baseSize.width, equals(800.0));
      expect(_baseSize.height, equals(40.0));

      final UNotificationCard _uNotificationCard =
          tester.widget(find.byType(UNotificationCard));
      expect(_uNotificationCard.uNotification.username, equals('Bob'));
    });

    testWidgets(
        'Should return the right size and passed username param when notificationType is message',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(children: [
                Flexible(
                    child: UNotification(
                  username: 'Jane',
                  notificationType: NotificationType.message,
                  arrivalNotificationTime: DateTime(2022, 07, 01, 09),
                  isUnread: true,
                ))
              ]),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UNotification));
      expect(_baseSize.width, equals(126.0));
      expect(_baseSize.height, equals(18.0));
    });

    testWidgets(
        'Should return the right size and passed username param when notificationType is friendRequest and is rejected',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(children: [
                Flexible(
                    child: UNotification(
                  username: 'Alice',
                  notificationType: NotificationType.friendRequest,
                  arrivalNotificationTime: DateTime(2022, 07, 01, 09),
                  isUnread: true,
                ))
              ]),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UNotification));
      expect(_baseSize.width, equals(800.0));
      expect(_baseSize.height, equals(600.0));

      expect(find.text('Decline'), findsOneWidget);
      await tester.tap(find.text('Decline'));
      await tester.pumpAndSettle();
      expect(find.textContaining('You declined a friend request from'),
          findsOneWidget);
      expect(find.textContaining('Undo'), findsOneWidget);
    });

    testWidgets(
        'Should return the right size and passed username param when notificationType is friendRequest and is accepted',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(children: [
                Flexible(
                    child: UNotification(
                  username: 'Alice',
                  notificationType: NotificationType.friendRequest,
                  arrivalNotificationTime: DateTime(2022, 07, 01, 09),
                  isUnread: true,
                ))
              ]),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UNotification));
      expect(_baseSize.width, equals(800.0));
      expect(_baseSize.height, equals(600.0));

      expect(find.text('Decline'), findsOneWidget);
      await tester.tap(find.text('Accept'));
      await tester.pumpAndSettle();
      expect(find.textContaining('You are now friends with'), findsOneWidget);
    });
  });
}
