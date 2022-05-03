import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/u_avatars_profile/u_group_profile/u_group_profile.dart';

void main() {
  group('Widget Test UGroupProfile |', () {
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
                      UGroupProfile(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      final Size _baseSize = tester.getSize(find.byType(UGroupProfile));
      expect(_baseSize.width, equals(40.0));
      expect(_baseSize.height, equals(40.0));
    });
  });
}
