// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/presentation/controller/auth_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/utils_export.dart';

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
                UPin(
                  key: UniqueKey(),
                  // TODO(yijing): Get user's pin code length and update the pinLength
                  pinLength: 4,
                  rightButtonFn: (pin) {
                    // TODO(yijing): update pin validatio
                    if (pin == '9999') {
                      GetIt.I.get<WarpBloc>().add(EnableWarp(pin));
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute<void>(
                          builder: (context) => const MainBottomNavigationBar(),
                        ),
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
