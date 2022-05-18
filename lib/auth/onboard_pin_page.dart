// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

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
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(),
            ),
            const UText(
              'Create Account Pin',
              textStyle: UTextStyle.H1_primaryHeader,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const UText(
              'Create a pin to protect your account.\nThe pin can be anything you want, just don’t forget it.',
              textStyle: UTextStyle.B1_body,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 56),
            Expanded(child: Container()),
            Stack(
              children: [
                UPin(
                  key: UniqueKey(),
                  pinLength: _pinLength,
                  rightButtonFn: (pin) {
                    showDialog<String>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Pin:$pin'),
                          content: const Text('Go to next page'),
                        );
                      },
                    );
                  },
                ),
                Align(
                  heightFactor: 4,
                  //TODO: extract this widget to ui_library
                  child: TextButton(
                    onPressed: () {
                      UBottomSheetPin(
                        context,
                        onSelect: (selectedPinLength) {
                          setState(() {
                            _pinLength = selectedPinLength;
                            // uPinStateKey.currentState?.clearPin();
                            Navigator.pop(context);
                          });
                        },
                        initValue: _pinLength,
                      ).show();
                    },
                    child: const UText(
                      'Pin Options',
                      textStyle: UTextStyle.BUT2_secondaryButton,
                      textColor: UColors.textDark,
                    ),
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
