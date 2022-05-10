import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UPinPage extends StatefulWidget {
  const UPinPage({Key? key}) : super(key: key);
  static const routeName = '/UPin';

  @override
  State<UPinPage> createState() => _UPinPadPageState();
}

class _UPinPadPageState extends State<UPinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UPinPage.routeName.substring(1)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 28),
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
              'Create a pin to protect your account.\nThe pin can be anything you want, just don’t forget it.',
              textStyle: UTextStyle.B1_body,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 56),
            UPin(
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
                  uPinRowStateKey.currentState?.notifyWrongPin();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
