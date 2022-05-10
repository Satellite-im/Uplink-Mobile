import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

typedef KeyboardTapCallback = void Function(String text);

class UPinPad extends StatefulWidget {
  /// Action to trigger when right button is pressed
  final Function() rightButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  const UPinPad({
    Key? key,
    required this.onKeyboardTap,
    required this.rightButtonFn,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<UPinPad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(
                width: 60,
                height: 60,
              ),
              _calcButton('0'),
              InkWell(
                  borderRadius: BorderRadius.circular(40),
                  onTap: widget.rightButtonFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 60,
                      child: const UIcon(UIcons.pin_entry_backspace_button)))
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: () {
          widget.onKeyboardTap(value);
        },
        child: Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          //TODO:add UTextStyle later
          //Header/Android H2 - Poppins 14 Semibold;
          child: Text(
            value,
            style: const TextStyle(
                fontFamily: UFonts.textPoppinsFont,
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: UColors.white),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
