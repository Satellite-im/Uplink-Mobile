import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

import 'u_pin_row.dart';

GlobalKey<UPinRowState> _uPinRowStateKey = GlobalKey();

class UPinPadPage extends StatefulWidget {
  const UPinPadPage({Key? key}) : super(key: key);
  static const routeName = '/UPinPad';

  @override
  State<UPinPadPage> createState() => _UPinPadPageState();
}

class _UPinPadPageState extends State<UPinPadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UPinPadPage.routeName.substring(1)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: Column(
          children: <Widget>[
            Expanded(child: Container()),
            const Text(
              'Create Account Pin',
              //TODO:add UTextStyle later
              style: TextStyle(
                  fontFamily: UFonts.textSpaceMonoFont,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  height: 27 / 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            const UText(
              'Create a pin to protect your account.\nThe pin can be anything you want, just don\’t forget it.',
              textStyle: UTextStyle.B1_body,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 56),
            UPinRow(
              key: _uPinRowStateKey,
              pinLength: 4,
              onCompleted: (pin) {
                if (pin == '1234') {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          title: Text('Success'),
                          content: Text('Go to next page'),
                        );
                      });
                } else {
                  _uPinRowStateKey.currentState?.notifyWrongPin();
                }
              },
            ),
            Expanded(child: Container()),
            UPinPad(
              onKeyboardTap: _onKeyboardTap,
              rightButtonFn: () {
                _uPinRowStateKey.currentState?.delete();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onKeyboardTap(String value) {
    _uPinRowStateKey.currentState?.addPin(value);
  }
}
