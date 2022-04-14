import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_showroom/theme/theme_model.dart';
import 'package:ui_showroom/ui_showroom_export.dart';

void main() {
  testWidgets('UIShowRoomApp:show UIShowRoomPage ', (tester) async {
    await tester.pumpWidget(const UIShowRoomApp());
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('UIShowRoomPage')), findsOneWidget);
  });

  testWidgets('UIShowRoomPage: scaffold background color matches ',
      (tester) async {
    await tester.pumpWidget(const UIShowRoomApp());
    await tester.pumpAndSettle();
    final themeModel = ThemeModel();
    final themeData = themeModel.getThemeData;
    expect(
        Theme.of(tester.element(find.byKey(const Key('UIShowRoomPage'))))
            .scaffoldBackgroundColor,
        themeData.scaffoldBackgroundColor);
  });
}
