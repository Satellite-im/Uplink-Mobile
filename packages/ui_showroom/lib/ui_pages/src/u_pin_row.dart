import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UPinRow extends StatefulWidget {
  final int pinLength;
  final Function(String) onCompleted;

  const UPinRow({
    Key? key,
    required this.pinLength,
    required this.onCompleted,
  })  : assert(pinLength == 6 || pinLength == 4),
        super(key: key);

  @override
  State<UPinRow> createState() => UPinRowState();
}

class UPinRowState extends State<UPinRow> with SingleTickerProviderStateMixin {
  late List<PinAnimation> _pinAnimationList;
  late List<GlobalObjectKey<PinAnimationState>> keyList;
  late AnimationController _wrongPinAnimationController;
  late Animation<double> _wiggleAnimation;
  String pin = '';

  void addPin(String pinText) {
    if (pin.length <= widget.pinLength) {
      if (pin.length < widget.pinLength) {
        pin = pin + pinText;
        keyList[pin.length - 1].currentState?.animate(pinText);
      }
      if (pin.length == widget.pinLength) {
        widget.onCompleted.call(pin);
      }
    }
  }

  void delete() {
    if (pin.isNotEmpty) {
      pin = pin.substring(0, pin.length - 1);
      keyList[pin.length].currentState?.animate('');
    }
  }

  void notifyWrongPin() {
    _wrongPinAnimationController.forward();
  }

  @override
  void initState() {
    super.initState();
    keyList = List.generate(
        widget.pinLength, (index) => GlobalObjectKey<PinAnimationState>(index));

    _pinAnimationList = List.generate(
        widget.pinLength,
        (index) => PinAnimation(
              key: keyList[index],
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

    _wiggleAnimation = Tween<double>(begin: 0.0, end: 20.0).animate(
        CurvedAnimation(
            parent: _wrongPinAnimationController, curve: Curves.elasticIn));
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_wiggleAnimation.value, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _pinAnimationList,
      ),
    );
  }
}

class PinAnimation extends StatefulWidget {
  const PinAnimation({Key? key}) : super(key: key);
  @override
  State<PinAnimation> createState() => PinAnimationState();
}

class PinAnimationState extends State<PinAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fontSizeAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _dotSizeAnimation;
  String pin = '';

  void animate(String pinText) {
    _controller.forward();
    setState(() {
      pin = pinText;
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
    _fontSizeAnimation = Tween<double>(begin: 1, end: 18).animate(_controller);
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _dotSizeAnimation = Tween<double>(begin: 40, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 60,
      width: 60,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: _dotSizeAnimation.value,
        width: _dotSizeAnimation.value,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: pin == '' ? UColors.ctaBlue : Colors.transparent),
        child: Opacity(
          opacity: _opacityAnimation.value,
          child: Text(
            pin,
            style: TextStyle(
                fontFamily: UFonts.textSpaceMonoFont,
                fontWeight: FontWeight.w700,
                height: 27 / 18,
                fontSize: _fontSizeAnimation.value,
                color: UColors.textMed),
          ),
        ),
      ),
    );
  }
}
