import 'package:flutter/material.dart';
import 'package:ui_library/core/const/const_export.dart';

class USwitcher extends StatefulWidget {
  /// Creates a switcher
  ///
  /// [disabled] If true, it blocks [USwitcher] for use.
  /// If null the value will be false
  ///
  /// [switchValue] is the first value for the switcher and the
  /// value to be changed in [onSwitch]
  ///
  /// The [USwitcher] can be changed with a tap or
  /// a horizontally drag movement
  ///
  /// Example:
  /// ```dart
  /// Center(
  ///   child: USwitcher(
  ///     disabled: false,
  ///     switchValue: _switchValueFirstSwitcher,
  ///     onSwitch: (value) {
  ///       setState(() {
  ///         _switchValueFirstSwitcher = value;
  ///       });
  ///     },
  ///   ),
  /// ),
  /// ```
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
  late bool _switchValue;
  late bool _disabled;
  @override
  void initState() {
    super.initState();
    _switchValue = widget.switchValue;
    _disabled = widget.disabled ?? false;
  }

  void _changeValue() {
    if (!_disabled) {
      setState(() {
        _switchValue = !_switchValue;
        widget.onSwitch(_switchValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changeValue,
      onHorizontalDragStart: (dragStartDetails) => _changeValue(),
      child: SizedBox(
        height: USizes.switcherTotalHeight,
        width: USizes.switcherTotalWidth,
        child: Stack(
          children: [
            Positioned(
              top: 2,
              left: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height: USizes.switcherTrackHeight,
                width: USizes.switcherTotalWidth,
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
                height: USizes.switcherTotalHeight,
                width: USizes.switcherTotalHeight,
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
      ),
    );
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
