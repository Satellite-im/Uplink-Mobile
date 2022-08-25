import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_showroom/ui_showroom_export.dart';
import 'package:uplink/auth/presentation/controller/auth_bloc.dart';
import 'package:uplink/auth/presentation/view/view_export.dart';
import 'package:uplink/l10n/l10n.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/utils_export.dart';

enum Apps { mainApp, uiShowroom }

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  final _authController = GetIt.I.get<AuthBloc>();
  final _warpController = GetIt.I.get<WarpBloc>();

  @override
  void initState() {
    _authController.add(GetAuthKeys());
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      _warpController.add(DropMultipass());
    }
  }

  @override
  Widget build(BuildContext context) {
    const _appToBuild = Apps.uiShowroom;

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
                home: BlocBuilder<AuthBloc, AuthState>(
                  bloc: _authController,
                  builder: (context, state) {
                    if (state is GetAuthKeysSuccess) {
                      final signinDataMap = state.authKeysMap;
                      if (signinDataMap[ULocalKey.isUserLogged] == true &&
                          signinDataMap[ULocalKey.isPinStored] == true &&
                          signinDataMap[ULocalKey.pinValue] != null) {
                        final _pinValue =
                            signinDataMap[ULocalKey.pinValue] as String;
                        _warpController.add(EnableWarp(_pinValue));
                        return const MainBottomNavigationBar();
                      } else if (signinDataMap[ULocalKey.isUserLogged] ==
                              true &&
                          signinDataMap[ULocalKey.isPinStored] != true) {
                        return SigninPage(
                          authController: _authController,
                        );
                      } else {
                        return const OnboardPinPage();
                      }
                    } else if (state is GetAuthKeysLoading) {
                      return const ULoadingIndicator();
                    } else if (state is GetAuthKeysError) {
                      return const UText(
                        'Unexpected Error Happened',
                        textStyle: UTextStyle.H2_secondaryHeader,
                      );
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
