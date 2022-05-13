import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

GlobalKey<UPinState> uPinStateKey = GlobalKey();

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
            UPin(
              key: uPinStateKey,
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
                  uPinStateKey.currentState?.notifyWrongPin();
                }
              },
              rightButtonFn: (pin) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Pin:$pin'),
                        content: const Text('Go to next page'),
                      );
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
