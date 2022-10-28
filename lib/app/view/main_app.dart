import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/app/view/route_generator.dart';
import 'package:uplink/auth/presentation/controller/auth_bloc.dart';
import 'package:uplink/auth/presentation/view/view_export.dart';
import 'package:uplink/l10n/l10n.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/utils_export.dart';

class MainApp extends StatefulWidget {
  const MainApp({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final _authController = GetIt.I.get<AuthBloc>();
  final _warpController = GetIt.I.get<WarpBloc>();

  @override
  void initState() {
    super.initState();
    _authController.add(AuthGetPinData());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: const Key('MainApp'),
      theme: widget.themeData,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: BlocBuilder<AuthBloc, AuthState>(
        bloc: _authController,
        builder: (context, state) {
          if (state is AuthKeysLoadSuccess) {
            return _buildEntryPage(
              state,
              _warpController,
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
  }
}

Widget _buildEntryPage(
  AuthKeysLoadSuccess state,
  WarpBloc _warpController,
  AuthBloc _authController,
) {
  final authKeysMap = state.authKeysMap;
  log('authKeysMap -> isUserLogged:${authKeysMap[ULocalKey.isUserLogged]}');
  log('authKeysMap -> isPinStored:${authKeysMap[ULocalKey.isPinStored]}');
  log('authKeysMap -> pinValue:${authKeysMap[ULocalKey.pinValue]}');

  if (authKeysMap[ULocalKey.isUserLogged] == true &&
      authKeysMap[ULocalKey.isPinStored] == true &&
      authKeysMap[ULocalKey.pinValue] != null) {
    final _pinValue = authKeysMap[ULocalKey.pinValue] as String;
    _warpController.add(WarpStarted(_pinValue));
    return BlocBuilder<WarpBloc, WarpState>(
      bloc: _warpController,
      builder: (context, state) {
        if (state is WarpLoadSuccess ||
            state is RaygunLoadSuccess ||
            state is ConstellationLoadSuccess) {
          return const MainBottomNavigationBar();
        }
        return ScaffoldCenterPage(
          child: UActionLoading(
            dashLoadingIndicatorPadding:
                const EdgeInsets.symmetric(horizontal: 16),
            isLoading: ValueNotifier(
              true,
            ),
            child: const SizedBox.shrink(),
          ),
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
