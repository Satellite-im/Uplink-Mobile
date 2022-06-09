import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_showroom/ui_showroom_export.dart';
import 'package:uplink/auth/onboard_pin_page.dart';
import 'package:uplink/auth/signin_page.dart';
import 'package:uplink/home/main_navigation_section.dart';
import 'package:uplink/l10n/l10n.dart';

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
                home: FutureBuilder<Map<String, bool>>(
                  future: _getUserLogState(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final signinDataMap = snapshot.data!;
                      if (signinDataMap['isUserLogged'] == true &&
                          signinDataMap['isPinStored'] == true) {
                        return const MainNavigationSection();
                      } else if (signinDataMap['isUserLogged'] == true &&
                          signinDataMap['isPinStored'] == false) {
                        return const SigninPage();
                      } else {
                        return const OnboardPinPage();
                      }
                    } else {
                      return const ULoadingIndicator();
                    }
                  },
                ),
              );
      },
    );
  }
}

Future<Map<String, bool>> _getUserLogState() async {
  final prefs = await SharedPreferences.getInstance();
  final _isUserLogged = prefs.getBool('isUserLogged') ?? false;
  final _isPinStored = prefs.getBool('isPinStored') ?? false;
  return {
    'isUserLogged': _isUserLogged,
    'isPinStored': _isPinStored,
  };
}
