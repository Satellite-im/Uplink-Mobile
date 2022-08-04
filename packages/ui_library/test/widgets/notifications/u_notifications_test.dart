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
    });

    testWidgets(
        'Should return the right size and passed username param when notificationType is friendRequest',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Row(children: [
                Flexible(
                    child: UNotification(
                  username: 'Alice',
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
    });
  });
}
