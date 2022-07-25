import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_showroom/ui_showroom_page.dart';
import 'package:uplink/app/app.dart';

void main() {
  group('App', () {
    testWidgets('renders First Page', (tester) async {
      await tester.pumpWidget(const App());
      final _mainAppPageOrUIShowroomPage = find.byWidgetPredicate(
        (widget) => widget is MaterialApp || widget is UIShowRoomApp,
      );
      expect(_mainAppPageOrUIShowroomPage, findsWidgets);
    });
  });
}
