import 'package:flutter/material.dart';
import 'package:ui_library/core/const/u_colors.dart';

class USwitcher extends StatefulWidget {
  const USwitcher({
    Key? key,
    required this.switchValue,
    required this.onSwitch,
    this.disabled,
  }) : super(key: key);

  final bool switchValue;

  final bool? disabled;

  final Function(bool) onSwitch;

  @override
  State<USwitcher> createState() => _USwitcherState();
}

class _USwitcherState extends State<USwitcher> {
  bool _switchValue = false;
  late bool _disabled;
  @override
  void initState() {
    _switchValue = widget.switchValue;
    _disabled = widget.disabled ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!_disabled) {
          setState(() {
            _switchValue = !_switchValue;
            widget.onSwitch(_switchValue);
          });
        }
      },
      child: SizedBox(
        height: 20,
        width: 36,
        child: Stack(
          children: [
            Positioned(
              top: 2,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height: 16,
                width: 36,
                decoration: _disabled
                    ? _switcherTrackDisabled()
                    : _switchValue
                        ? _switcherTrackActive()
                        : _switcherTrackInactive(),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 150),
              top: 0,
              left: (_disabled || !_switchValue) ? 0 : 16,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: _disabled ? UColors.defGrey : UColors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _switcherTrackDisabled() {
    return BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 1,
          color: UColors.defGrey,
        ));
  }

  BoxDecoration _switcherTrackInactive() {
    return BoxDecoration(
      color: UColors.foregroundDark,
      borderRadius: BorderRadius.circular(50),
    );
  }

  BoxDecoration _switcherTrackActive() {
    return BoxDecoration(
      color: UColors.ctaBlue,
      borderRadius: BorderRadius.circular(50),
    );
  }
}
