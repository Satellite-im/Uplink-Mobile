import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/u_colors.dart';
import 'package:ui_library/widgets/u_user_profile/u_user_profile_notifications/u_user_profile_notification.dart';

void main() {
  group('Widget Test Notification Indicator |', () {
    testWidgets('Should return the right size value',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: NotificationIndicator(),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(NotificationIndicator));
      expect(_baseSize.width, equals(8.0));
      expect(_baseSize.height, equals(8.0));
    });

    testWidgets('Should return correct notification indicator color',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: NotificationIndicator(),
          ),
        ),
      );

      final _container = find.byWidgetPredicate(
        ((widget) => (widget is Container &&
            widget.decoration ==
                const BoxDecoration(
                  color: UColors.ctaBlue,
                  shape: BoxShape.circle,
                ))),
      );

      expect(_container, findsOneWidget);
    });
  });
}
