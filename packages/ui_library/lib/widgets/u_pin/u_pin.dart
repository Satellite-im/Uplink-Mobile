import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

///UPin widget include a numberic pad and a row of number text
///
///[pinLength] only accept 4, 6 or 8 digits
///
///[onCompleted] is an optional function to handler the pin after user type the last digit, like checking the pin is correct or not
///
///[rightButtonFn] is a required function to handler the next step when user finish typing
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
/// rightButtonFn: () {
///    showDialog(
///          context: context,
///          builder: (context) {
///            return const AlertDialog(
///              title: Text('Pin:$pin'),
///              content: Text('Go to next page'),
///        );
///     });
///   },
/// )
///```
class UPin extends StatefulWidget {
  const UPin(
      {Key? key,
      required this.pinLength,
      this.onCompleted,
      required this.rightButtonFn})
      : assert(pinLength == 4 || pinLength == 6 || pinLength == 8),
        super(key: key);

  final int pinLength;
  final Function(String pin)? onCompleted;
  final Function(String pin) rightButtonFn;

  @override
  State<UPin> createState() => UPinState();
}

class UPinState extends State<UPin> with TickerProviderStateMixin {
  //list for every pin dot and its key
  late List<PinDotWithAnimation> _pinDotWithAnimationList;
  late List<GlobalObjectKey<PinDotWithAnimationState>>
      _pinDotWithAnimationKeyList;

  //wrong pin animaiton
  late AnimationController _wrongPinAnimationController;
  late Animation<double> _wiggleAnimation;

  //right button animation
  late AnimationController _rightButtonAnimationController;
  late Animation<double> _rightButtonOpacityAnimation;
  String pin = '';

  @override
  void initState() {
    super.initState();
    _pinDotWithAnimationKeyList = List.generate(widget.pinLength,
        (index) => GlobalObjectKey<PinDotWithAnimationState>(index));

    _pinDotWithAnimationList = List.generate(
        widget.pinLength,
        (index) => PinDotWithAnimation(
              key: _pinDotWithAnimationKeyList[index],
            ));

    _wrongPinAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _wrongPinAnimationController.reverse();
        }
      });

    _wiggleAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
        CurvedAnimation(
            parent: _wrongPinAnimationController, curve: Curves.elasticIn));

    _rightButtonAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100))
      ..addListener(() {
        setState(() {});
      });

    _rightButtonOpacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(
            parent: _rightButtonAnimationController, curve: Curves.elasticIn));
  }

  void addPin(String singlePin) {
    if (pin.length < widget.pinLength) {
      pin = pin + singlePin;
      _pinDotWithAnimationKeyList[pin.length - 1]
          .currentState
          ?.animate(singlePin);
    }

    if (pin.length == widget.pinLength) {
      _rightButtonAnimationController.forward();
      widget.onCompleted?.call(pin);
    }
  }

  void delete() {
    if (pin.isNotEmpty) {
      if (pin.length == widget.pinLength) {
        _rightButtonAnimationController.reverse();
      }
      pin = pin.substring(0, pin.length - 1);
      _pinDotWithAnimationKeyList[pin.length].currentState?.animate('');
    }
  }

  void notifyWrongPin() {
    _wrongPinAnimationController.forward();
  }

  Widget _pinButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: () => addPin(value),
        child: Container(
          alignment: Alignment.center,
          width: 60,
          height: 60,
          child: UText(
            value,
            textStyle: UTextStyle.H2_secondaryHeader,
            textColor: UColors.white,
          ),
        ));
  }

  @override
  void dispose() {
    _wrongPinAnimationController.dispose();
    _rightButtonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.translate(
          offset: Offset(_wiggleAnimation.value, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _pinDotWithAnimationList,
          ),
        ),
        const SizedBox(height: 70),
        Container(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _pinButton('1'),
                  _pinButton('2'),
                  _pinButton('3'),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _pinButton('4'),
                  _pinButton('5'),
                  _pinButton('6'),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _pinButton('7'),
                  _pinButton('8'),
                  _pinButton('9'),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    borderRadius: BorderRadius.circular(40),
                    onTap: () => delete(),
                    child: Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 60,
                        child: const UIcon(
                          UIcons.pin_entry_backspace_button,
                          color: UColors.white,
                        )),
                  ),
                  _pinButton('0'),
                  InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        if (pin.length == widget.pinLength) {
                          widget.rightButtonFn(pin);
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: 60,
                          height: 60,
                          child: Opacity(
                              opacity: _rightButtonOpacityAnimation.value,
                              child: const UIcon(
                                UIcons.checkmark,
                                color: UColors.white,
                              ))))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PinDotWithAnimation extends StatefulWidget {
  const PinDotWithAnimation({Key? key}) : super(key: key);
  @override
  State<PinDotWithAnimation> createState() => PinDotWithAnimationState();
}

class PinDotWithAnimationState extends State<PinDotWithAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  String pinDotPin = '';

  void animate(String singlePin) {
    _controller.forward();
    if (_controller.isCompleted) {
      _controller.reverse();
    }
    setState(() {
      pinDotPin = singlePin;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _controller.addListener(() {
      setState(() {});
    });
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Stack(children: [
        Center(
          child: Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: pinDotPin == '' ? UColors.ctaBlue : Colors.transparent,
            ),
          ),
        ),
        Center(
          child: Opacity(
            opacity: _opacityAnimation.value,
            child: UText(
              pinDotPin,
              textStyle: UTextStyle.H1_primaryHeader,
            ),
          ),
        )
      ]),
    );
  }
}
