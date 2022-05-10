import 'package:flutter/material.dart';
import 'models/u_pin_pad.dart';
import 'models/u_pin_row.dart';

GlobalKey<UPinRowState> uPinRowStateKey = GlobalKey();

///UPin widget include a numberic pad and a row of number text
///
///[pinLength] only accept 4 or 8 digits
///
///For example, create a 4 digit UPin
///```dart
/// UPin(
///   pinLength: 4,
///   onCompleted: (pin) {
///     if (pin == '1234') {
///       showDialog(
///           context: context,
///           builder: (context) {
///             return const AlertDialog(
///               title: Text('Success'),
///              content: Text('Go to next page'),
///             );
///           });
///     } else {
///      uPinRowStateKey.currentState?.notifyWrongPin();
///     // animation for wiggling the UPinRow
///     }
///   },
/// )
///```
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
