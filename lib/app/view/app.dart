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
import 'package:uplink/profile/presentation/controller/current_user_bloc.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/utils_export.dart';

enum Apps { mainApp, uiShowroom }

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _authController = GetIt.I.get<AuthBloc>();
  final _warpController = GetIt.I.get<WarpBloc>();
  final _currentUserController = GetIt.I.get<CurrentUserBloc>();
  @override
  void initState() {
    super.initState();
    _authController.add(AuthGetPinData());
  }

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
                home: BlocBuilder<AuthBloc, AuthState>(
                  bloc: _authController,
                  builder: (context, state) {
                    if (state is GetAuthKeysSuccess) {
                      return _buildEntryPage(
                        state,
                        _warpController,
                        _currentUserController,
                        _authController,
                      );
                    } else if (state is AuthLoadFailure) {
                      return const ScaffoldCenterPage(
                        child: UText(
                          'AuthLoadFailure in AuthBloc',
                          textStyle: UTextStyle.H2_secondaryHeader,
                        ),
                      );
                    } else {
                      return const ScaffoldCenterPage(
                        child: ULoadingIndicator(),
                      );
                    }
                  },
                ),
              );
      },
    );
  }
}

Widget _buildEntryPage(
  GetAuthKeysSuccess state,
  WarpBloc _warpController,
  CurrentUserBloc _currentUserController,
  AuthBloc _authController,
) {
  final authKeysMap = state.authKeysMap;
  if (authKeysMap[ULocalKey.isUserLogged] == true &&
      authKeysMap[ULocalKey.isPinStored] == true &&
      authKeysMap[ULocalKey.pinValue] != null) {
    final _pinValue = authKeysMap[ULocalKey.pinValue] as String;
    _warpController.add(WarpStarted(_pinValue));
    return BlocBuilder<WarpBloc, WarpState>(
      bloc: _warpController,
      builder: (context, state) {
        if (state is WarpLoadSuccess) {
          _currentUserController.add(GetCurrentUserInfo());
          return const MainBottomNavigationBar();
        }
        return UActionLoading(
          dashLoadingIndicatorPadding:
              const EdgeInsets.symmetric(horizontal: 16),
          isLoading: ValueNotifier(
            true,
          ),
          child: const SizedBox.shrink(),
        );
      },
    );
  } else if (authKeysMap[ULocalKey.isUserLogged] == true &&
      authKeysMap[ULocalKey.isPinStored] != true &&
      authKeysMap[ULocalKey.pinValue] != null) {
    _authController.pinValue = authKeysMap[ULocalKey.pinValue] as String;
    return SigninPage(
      authController: _authController,
    );
  } else {
    return const OnboardPinPage();
  }
}
