import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_template.dart';

class UBottomSheetPin {
  final BuildContext context;

  final Function(int) onSelect;

  final int? initValue;

  /// Creates a bottom sheet to use in Pin Pages
  ///
  /// It allows to select between 4, 6 or 8 digits as pin length.
  ///
  /// [onSelect] method will return the number of selected integer type digits
  ///
  /// To use, is necessary to call the class and the method [show]
  ///
  /// You need to call an action to show the [UBottomSheetPin],
  /// example:
  /// ```dart
  /// UButton.filled1(
  ///     label: 'Click here to see the bottom sheet',
  ///       onPressed: () {
  ///         UBottomSheetPin(
  ///             context,
  ///             onSelect: (p0) {},
  ///         ).show();
  /// }),
  /// ```
  UBottomSheetPin(
    this.context, {
    required this.onSelect,
    this.initValue,
  });

  Future show() {
    return UBottomSheet(
      context,
      child: _UBottomSheetPinBody(
        onSelect: onSelect,
        initValue: initValue,
      ),
    ).show();
  }
}

class _UBottomSheetPinBody extends StatefulWidget {
  const _UBottomSheetPinBody({
    Key? key,
    required this.onSelect,
    this.initValue,
  }) : super(key: key);

  final Function(int) onSelect;
  final int? initValue;

  @override
  State<_UBottomSheetPinBody> createState() => _UBottomSheetPinBodyState();
}

class _UBottomSheetPinBodyState extends State<_UBottomSheetPinBody> {
  bool _isFourDigitsSelected = false;
  bool _isSixDigitsSelected = false;
  bool _isEightDigitsSelected = false;

  void _selectTheNumberOfDigits(int value) {
    setState(() {
      _isFourDigitsSelected = value == 4 ? true : false;
      _isSixDigitsSelected = value == 6 ? true : false;
      _isEightDigitsSelected = value == 8 ? true : false;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.initValue != null) {
      _selectTheNumberOfDigits(widget.initValue!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 36, 19, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UText(
            'Pin Options',
            textStyle: UTextStyle.H3_tertiaryHeader,
          ),
          const SizedBox.square(
            dimension: 26,
          ),
          _PinOption(
            onSelect: (p0) {
              _selectTheNumberOfDigits(p0);
              widget.onSelect(p0);
            },
            numberOfDigits: 4,
            digitSelected: _isFourDigitsSelected,
          ),
          const SizedBox.square(
            dimension: 33,
          ),
          _PinOption(
            onSelect: (p0) {
              _selectTheNumberOfDigits(p0);
              widget.onSelect(p0);
            },
            numberOfDigits: 6,
            digitSelected: _isSixDigitsSelected,
          ),
          const SizedBox.square(
            dimension: 33,
          ),
          _PinOption(
            onSelect: (p0) {
              _selectTheNumberOfDigits(p0);
              widget.onSelect(p0);
            },
            numberOfDigits: 8,
            digitSelected: _isEightDigitsSelected,
          ),
        ],
      ),
    );
  }
}

class _PinOption extends StatelessWidget {
  const _PinOption({
    Key? key,
    required this.onSelect,
    required this.numberOfDigits,
    required this.digitSelected,
  }) : super(key: key);

  final Function(int) onSelect;
  final int numberOfDigits;
  final bool digitSelected;

  @override
  Widget build(BuildContext context) {
    final _valueToAnimate = digitSelected ? 1.0 : 0.0;
    const _animationDuration = Duration(milliseconds: 150);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onSelect(numberOfDigits);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UText('$numberOfDigits Digits',
              textStyle: UTextStyle.BUT1_primaryButton),
          AnimatedScale(
            scale: _valueToAnimate,
            duration: _animationDuration,
            child: AnimatedOpacity(
              opacity: _valueToAnimate,
              duration: _animationDuration,
              child: const UIcon(
                UIcons.checkmark,
                color: UColors.ctaBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
