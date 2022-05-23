import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_showroom/ui_showroom_export.dart';
import 'package:uplink/l10n/l10n.dart';
import 'package:uplink/pages_export.dart';

enum Apps { mainApp, uiShowroom }

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _appToBuild = Apps.mainApp;

    return ChangeNotifierProvider(
      create: (context) => ThemeModel(),
      builder: (context, _) {
        final themeModel = context.watch<ThemeModel>();
        return _appToBuild == Apps.uiShowroom
            ? UIShowRoomApp(themeData: themeModel.getThemeData)
            : MaterialApp(
                theme: themeModel.getThemeData,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
                home: const OnboardPinPage(),
              );
      },
    );
  }
}
