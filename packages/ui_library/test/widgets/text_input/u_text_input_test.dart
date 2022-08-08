import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/text_input/u_text_input.dart';

void main() {
  group('Widget Test UTextInput|', () {
    testWidgets('Should return the right size', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Column(children: [
                  UTextInput.singleLine(
                    hintText: 'hint text',
                    onChanged: ((p0) => 'hint string'),
                  )
                ])
              ]),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UTextInput));
      await tester.enterText(find.byType(UTextInput), 'second text');
      await tester.pumpAndSettle();
      expect(_baseSize.height, equals(56.0));
      expect(find.text('second text'), findsOneWidget);
    });
    testWidgets('Should return the right size for single line with title',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Column(children: [
                  UTextInput.singleLineWithTitle(
                    hintText: 'hint text',
                    onChanged: ((p0) => 'hint string'),
                    textFieldTitle: 'title text field',
                  )
                ])
              ]),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UTextInput));
      await tester.enterText(find.byType(UTextInput), 'second text');
      await tester.pumpAndSettle();
      expect(_baseSize.height, equals(81.0));
      expect(find.text('second text'), findsOneWidget);
    });
    testWidgets('Should return the right size for multiline',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Column(children: [
                  UTextInput.multiLines(
                    hintText: 'hint text',
                    onChanged: ((p0) => 'hint string'),
                  )
                ])
              ]),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UTextInput));
      await tester.enterText(find.byType(UTextInput), 'second text');
      await tester.pumpAndSettle();
      expect(_baseSize.height, equals(87.0));
      expect(find.text('second text'), findsOneWidget);
    });
    testWidgets('Should return the right size for multiline with title',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Column(children: [
                  UTextInput.multiLinesWithTitle(
                    hintText: 'hint text',
                    onChanged: ((p0) => 'hint string'),
                    textFieldTitle: 'title text field',
                  )
                ])
              ]),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UTextInput));
      await tester.enterText(find.byType(UTextInput), 'second text');
      await tester.pumpAndSettle();
      expect(_baseSize.height, equals(112.0));
      expect(find.text('second text'), findsOneWidget);
    });
  });
}
