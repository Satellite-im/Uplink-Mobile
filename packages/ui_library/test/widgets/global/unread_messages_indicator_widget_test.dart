import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/global/unread_messages_indicator/unread_messages_indicator.dart';

void main() {
  group('Widget Test Unread Messages Indicator for Profile |', () {
    testWidgets(
        'Should return the right size and unread messages value when the number of messages are smaller than 10',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UnreadMessagesIndicator(
              unreadMessages: 9,
              type: UnreadMessagesIndicatorType.profile,
            ),
          ),
        ),
      );

      final Size _baseSize =
          tester.getSize(find.byType(UnreadMessagesIndicator));
      expect(_baseSize.width, equals(20.0));
      expect(_baseSize.height, equals(20.0));

      final UText _uText = tester.widget(find.byType(UText));
      expect(_uText.text, equals('9'));
    });

    testWidgets(
        'Should return the right size value when the number of messages are between 10 and 99',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UnreadMessagesIndicator(
              unreadMessages: 99,
              type: UnreadMessagesIndicatorType.profile,
            ),
          ),
        ),
      );

      final Size _baseSize =
          tester.getSize(find.byType(UnreadMessagesIndicator));
      expect(_baseSize.width, equals(27.0));
      expect(_baseSize.height, equals(20.0));

      final UText _uText = tester.widget(find.byType(UText));
      expect(_uText.text, equals('99'));
    });

    testWidgets(
        'Should return the right size value when the number of messages are between 100 and 999',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UnreadMessagesIndicator(
              unreadMessages: 999,
              type: UnreadMessagesIndicatorType.profile,
            ),
          ),
        ),
      );

      final Size _baseSize =
          tester.getSize(find.byType(UnreadMessagesIndicator));
      expect(_baseSize.width, equals(35.0));
      expect(_baseSize.height, equals(20.0));

      final UText _uText = tester.widget(find.byType(UText));
      expect(_uText.text, equals('999'));
    });

    testWidgets(
        'Should return the right size value when the number of messages are between 1000 and 9999',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UnreadMessagesIndicator(
              unreadMessages: 9999,
              type: UnreadMessagesIndicatorType.profile,
            ),
          ),
        ),
      );

      final Size _baseSize =
          tester.getSize(find.byType(UnreadMessagesIndicator));
      expect(_baseSize.width, equals(42.0));
      expect(_baseSize.height, equals(20.0));

      final UText _uText = tester.widget(find.byType(UText));
      expect(_uText.text, equals('9999'));
    });

    testWidgets(
        'Should return the right size and 9999 as text value when the number of messages are greater than 9999',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UnreadMessagesIndicator(
              unreadMessages: 10000,
              type: UnreadMessagesIndicatorType.profile,
            ),
          ),
        ),
      );

      final Size _baseSize =
          tester.getSize(find.byType(UnreadMessagesIndicator));
      expect(_baseSize.width, equals(42.0));
      expect(_baseSize.height, equals(20.0));

      final UText _uText = tester.widget(find.byType(UText));
      expect(_uText.text, equals('9999'));
    });
  });

  group('Widget Test Unread Messages Indicator for Card |', () {
    testWidgets(
        'Should return the right size and unread messages value when the number of messages are smaller than 10',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UnreadMessagesIndicator(
              unreadMessages: 9,
              type: UnreadMessagesIndicatorType.card,
            ),
          ),
        ),
      );

      final Size _baseSize =
          tester.getSize(find.byType(UnreadMessagesIndicator));
      expect(_baseSize.width, equals(20.0));
      expect(_baseSize.height, equals(20.0));

      final UText _uText = tester.widget(find.byType(UText));
      expect(_uText.text, equals('9'));
    });

    testWidgets(
        'Should return the right size value when the number of messages are between 10 and 99',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UnreadMessagesIndicator(
              unreadMessages: 99,
              type: UnreadMessagesIndicatorType.card,
            ),
          ),
        ),
      );

      final Size _baseSize =
          tester.getSize(find.byType(UnreadMessagesIndicator));
      expect(_baseSize.width, equals(27.0));
      expect(_baseSize.height, equals(20.0));

      final UText _uText = tester.widget(find.byType(UText));
      expect(_uText.text, equals('99'));
    });

    testWidgets(
        'Should return the right size value when the number of messages are between 100 and 999',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UnreadMessagesIndicator(
              unreadMessages: 999,
              type: UnreadMessagesIndicatorType.card,
            ),
          ),
        ),
      );

      final Size _baseSize =
          tester.getSize(find.byType(UnreadMessagesIndicator));
      expect(_baseSize.width, equals(35.0));
      expect(_baseSize.height, equals(20.0));

      final UText _uText = tester.widget(find.byType(UText));
      expect(_uText.text, equals('999'));
    });

    testWidgets(
        'Should return the right size value when the number of messages are between 1000 and 9999',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UnreadMessagesIndicator(
              unreadMessages: 9999,
              type: UnreadMessagesIndicatorType.card,
            ),
          ),
        ),
      );

      final Size _baseSize =
          tester.getSize(find.byType(UnreadMessagesIndicator));
      expect(_baseSize.width, equals(42.0));
      expect(_baseSize.height, equals(20.0));

      final UText _uText = tester.widget(find.byType(UText));
      expect(_uText.text, equals('9999'));
    });

    testWidgets(
        'Should return the right size and 9999 as text value when the number of messages are greater than 9999',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Center(
            child: UnreadMessagesIndicator(
              unreadMessages: 10000,
              type: UnreadMessagesIndicatorType.card,
            ),
          ),
        ),
      );

      final Size _baseSize =
          tester.getSize(find.byType(UnreadMessagesIndicator));
      expect(_baseSize.width, equals(42.0));
      expect(_baseSize.height, equals(20.0));

      final UText _uText = tester.widget(find.byType(UText));
      expect(_uText.text, equals('9999'));
    });
  });
}
