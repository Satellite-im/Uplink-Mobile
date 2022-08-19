import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uplink/app/app.dart';

void main() {
  group('App', () {
    testWidgets(
      'renders First Page',
      (tester) async {
        await tester.pumpWidget(const App());
        final _mainAppPageOrUIShowroomPage = find.byWidgetPredicate(
          (widget) =>
              widget.key == const Key('MainApp') ||
              widget.key == const Key('UIShowRoomApp'),
        );
        expect(_mainAppPageOrUIShowroomPage, findsWidgets);
      },
      // TODO(test): Add register mock dependencies later
      skip: true,
    );
  });
}
