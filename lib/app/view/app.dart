import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_showroom/ui_showroom_export.dart';
import 'package:uplink/auth/presentation/view/view_export.dart';
import 'package:uplink/l10n/l10n.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/utils_export.dart';

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
                key: const Key('MainApp'),
                theme: themeModel.getThemeData,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
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
                        final _pinValue =
                            signinDataMap[ULocalKey.pinValue] as String;
                        GetIt.I.get<WarpBloc>().add(EnableWarp(_pinValue));
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
