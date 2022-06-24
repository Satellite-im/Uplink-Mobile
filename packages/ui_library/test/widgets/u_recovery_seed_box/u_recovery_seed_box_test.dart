import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/u_recovery_seed_box/u_recovery_seed_box.dart';

void main() {
  group('Widget Test Drop Down Menu |', () {
    testWidgets('Should return correct value', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: URecoverySeedBox(
                word: 'word',
                wordNumber: 1,
              ),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(URecoverySeedBox));
      expect(_baseSize.height, equals(40.0));
    });
  });
}
