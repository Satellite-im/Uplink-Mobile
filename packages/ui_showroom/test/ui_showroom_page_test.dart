import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_showroom/ui_showroom_export.dart';

void main() {
  group('UIShowRoomApp', () {
    testWidgets(
      'show UIShowRoomPage',
      (tester) async {
        await tester.pumpWidget(
          ChangeNotifierProvider(
              create: (context) => ThemeModel(),
              builder: (context, _) {
                final themeModel = context.watch<ThemeModel>();
                return UIShowRoomApp(themeData: themeModel.getThemeData);
              }),
        );
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('UIShowRoomPage')), findsOneWidget);
      },
      skip: true,
    );
    testWidgets(
      'scaffoldBackgroundColor shows correctly in UIShowRoomPage',
      (tester) async {
        await tester.pumpWidget(
          ChangeNotifierProvider(
              create: (context) => ThemeModel(),
              builder: (context, _) {
                final themeModel = context.watch<ThemeModel>();
                return UIShowRoomApp(themeData: themeModel.getThemeData);
              }),
        );
        await tester.pumpAndSettle();

        expect(
            Theme.of(tester.element(find.byKey(const Key('UIShowRoomPage'))))
                .scaffoldBackgroundColor,
            ThemeModel().getThemeData.scaffoldBackgroundColor);
      },
      skip: true,
    );
  });
}
