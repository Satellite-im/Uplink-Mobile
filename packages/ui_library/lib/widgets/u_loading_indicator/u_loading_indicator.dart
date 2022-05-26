import 'package:flutter/material.dart';
import 'package:ui_library/core/const/const_export.dart';

/// It creates a custom Loading Indicator
///
/// If [padding] is null, the value will be [const EdgeInsets.all(16.0)]
class ULoadingIndicator extends StatefulWidget {
  const ULoadingIndicator({Key? key, this.padding}) : super(key: key);

  final EdgeInsets? padding;

  @override
  State<ULoadingIndicator> createState() => _ULoadingIndicatorState();
}

class _ULoadingIndicatorState extends State<ULoadingIndicator>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;
  late Animation<double> _positionAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() {
        setState(() {});
      });

    _sizeAnimation =
        Tween<double>(begin: 5.0, end: 25.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 80.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
      reverseCurve: Curves.linear,
    ));
    _animationController.repeat(
      reverse: true,
      period: _animationController.duration,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          widget.padding != null ? widget.padding! : const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: _positionAnimation.value,
          ),
          Container(
            width: _sizeAnimation.value,
            height: USizes.loadingIndicatorHeight,
            decoration: const BoxDecoration(
              color: UColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
