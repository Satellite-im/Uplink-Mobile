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
                Flexible(
                    child: UTextInput.singleLine(
                  hintText: 'hint text',
                  onChanged: ((p0) => 'hint string'),
                ))
              ]),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UTextInput));
      await tester.enterText(find.byType(UTextInput), 'second text');
      await tester.pumpAndSettle();
      expect(_baseSize.height, equals(600.0));
      expect(find.text('second text'), findsOneWidget);
    });
  });
}
