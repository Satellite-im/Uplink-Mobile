// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/presentation/controller/auth_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/utils_export.dart';

GlobalKey<UPinState> uPinStateKey = GlobalKey();

class SigninPage extends StatefulWidget {
  const SigninPage({
    Key? key,
    required this.authController,
  }) : super(key: key);

  final AuthBloc authController;

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _warpController = GetIt.I.get<WarpBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.iconOnly(
        leading: const SizedBox.shrink(),
        actionList: [
          IconButton(
            icon: const UIcon(UIcons.menu_bar_contacts),
            onPressed: () {
              UBottomSheetOptions(
                context,
                sheetTitle: UAppStrings.moreOptions,
                titleList: [
                  UAppStrings.signinPage_newAccount,
                  UAppStrings.signinPage_newAccount,
                ],
                iconList: [UIcons.multiple_accounts, UIcons.add_contact],
                onTapList: [
                  () {
                    // TODO(yijing): add workflow later
                  },
                  () {
                    // TODO(yijing): add workflow later
                  },
                ],
              ).show();
            },
            splashRadius: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(flex: 9, child: Container()),
            const UText(
              UAppStrings.signinPage_enterPin,
              textStyle: UTextStyle.H1_primaryHeader,
              textAlign: TextAlign.center,
            ),
            Flexible(child: Container()),
            const UText(
              UAppStrings.signinPage_enterPinBody,
              textStyle: UTextStyle.B1_body,
              textAlign: TextAlign.center,
            ),
            Flexible(flex: 3, child: Container()),
            Stack(
              children: [
                BlocListener<WarpBloc, WarpState>(
                  bloc: _warpController,
                  child: _warpController.multipass == null
                      ? UPin(
                          key: uPinStateKey,
                          pinLength: widget.authController.pinValue!.length,
                          rightButtonFn: (pin) {
                            if (pin == widget.authController.pinValue) {
                              _warpController.add(WarpStarted(pin));
                            } else {
                              uPinStateKey.currentState?.notifyWrongPin();
                            }
                          },
                        )
                      : UActionLoading(
                          dashLoadingIndicatorPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          isLoading: ValueNotifier(
                            true,
                          ),
                          child: const SizedBox.shrink(),
                        ),
                  listener: (context, state) {
                    if (state is WarpLoadSuccess) {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/MainBottomNavigationBar',
                        (route) => false,
                      );
                    }
                  },
                ),
                Align(
                  heightFactor: 6.5,
                  child: UTertiaryButton(
                    label: UAppStrings.signinPage_forgotPin,
                    onPressed: () {
                      // TODO(yijing): add forgot pin pages
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
