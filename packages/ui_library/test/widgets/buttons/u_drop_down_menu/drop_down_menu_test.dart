import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/buttons/u_drop_down_menu/u_drop_down_menu.dart';

void main() {
  group('Widget Test Drop Down Menu |', () {
    testWidgets('Should return correct value', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: UDropDownMenu(
                items: const ['test1', 'test2', 'test3'],
                onSelectedItem: (value, index) {},
              ),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UDropDownMenu));
      expect(_baseSize.height, equals(40.0));
    });
  });
}
