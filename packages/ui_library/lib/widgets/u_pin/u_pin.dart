import 'package:flutter/material.dart';
import 'models/u_pin_pad.dart';
import 'models/u_pin_row.dart';

GlobalKey<UPinRowState> uPinRowStateKey = GlobalKey();

class UPin extends StatelessWidget {
  const UPin({Key? key, required this.pinLength, required this.onCompleted})
      : super(key: key);
  final int pinLength;
  final Function(String pin) onCompleted;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UPinRow(
            key: uPinRowStateKey,
            pinLength: pinLength,
            onCompleted: onCompleted),
        const SizedBox(height: 70),
        UPinPad(
          onKeyboardTap: _onKeyboardTap,
          rightButtonFn: () {
            uPinRowStateKey.currentState?.delete();
          },
        ),
      ],
    );
  }

  void _onKeyboardTap(String value) {
    uPinRowStateKey.currentState?.addPin(value);
  }
}
