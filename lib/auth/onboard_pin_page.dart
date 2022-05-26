import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/auth_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class OnboardPinPage extends StatefulWidget {
  const OnboardPinPage({Key? key}) : super(key: key);

  @override
  State<OnboardPinPage> createState() => _OnboardPinPageState();
}

class _OnboardPinPageState extends State<OnboardPinPage> {
  int _pinLength = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(flex: 9, child: Container()),
            const UText(
              UAppStrings.onboardPinPage_PageTitle,
              textStyle: UTextStyle.H1_primaryHeader,
              textAlign: TextAlign.center,
            ),
            Flexible(child: Container()),
            const UText(
              UAppStrings.onboardPinPage_CreatePinToProtectYourAccount,
              textStyle: UTextStyle.B1_body,
              textAlign: TextAlign.center,
            ),
            Flexible(flex: 3, child: Container()),
            Stack(
              children: [
                UPin(
                  key: UniqueKey(),
                  pinLength: _pinLength,
                  rightButtonFn: (pin) {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) => const OnboardCreateAccountPage(),
                      ),
                    );
                  },
                ),
                Align(
                  heightFactor: 6.5,
                  child: UTertiaryButton(
                    label: UAppStrings.onboardPinPage_PinOptions,
                    onPressed: () {
                      UBottomSheetPin(
                        context,
                        onSelect: (selectedPinLength) {
                          setState(() {
                            _pinLength = selectedPinLength;
                            Navigator.pop(context);
                          });
                        },
                        initValue: _pinLength,
                      ).show();
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
