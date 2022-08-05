import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uplink/utils/ui_utils/loading_page.dart';

void main() {
  group(
    'Widget Test Loading Page |',
    () {
      testWidgets('Should return the right size value',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    LoadingPage(title: 'title', body: 'body'),
                  ],
                ),
              ),
            ),
          ),
        );

        final _baseSize = tester.getSize(find.byType(LoadingPage));
        expect(_baseSize.width, equals(40.0));
        // expect(find.text('body'), findsOneWidget);
      });
    },
    skip: true,
  );
}
