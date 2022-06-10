import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_showroom/ui_showroom_export.dart';
import 'package:uplink/auth/onboard_pin_page.dart';
import 'package:uplink/auth/signin_page.dart';
import 'package:uplink/l10n/l10n.dart';
import 'package:uplink/utils/services/local_storage_service.dart';
import 'package:uplink/utils/ui_utils/bottom_navigation_bar.dart';

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
                home: FutureBuilder<Map<ULocalKey, dynamic>>(
                  future: ULocalStorageService().getMultipleValues(
                    localKeyList: [
                      ULocalKey.isUserLogged,
                      ULocalKey.isPinStored,
                    ],
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final signinDataMap = snapshot.data!;
                      if (signinDataMap[ULocalKey.isUserLogged] == true &&
                          signinDataMap[ULocalKey.isPinStored] == true) {
                        return const MainBottomNavigationBar();
                      } else if (signinDataMap[ULocalKey.isUserLogged] ==
                              true &&
                          signinDataMap[ULocalKey.isPinStored] != true) {
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
