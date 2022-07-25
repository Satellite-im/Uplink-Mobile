// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

enum _ButtonType { primary, secondary, filled1, filled2 }

class UButton extends StatelessWidget {
  final _ButtonType _buttonType;
  final String _label;
  final UIconData? _uIconData;
  final Color? _color;
  final VoidCallback _onPressed;
  final bool _disabled;

  ///[ElevatedButton] with Text and Icon:
  ///
  /// backgroundColor is [UColors.ctaBlue]
  ///
  ///```dart
  /// UButton.primary(
  ///    label: 'ButtonText',
  ///    uIconData: UIcons.about,
  ///    onPressed: () {},
  ///  )
  ///```
  const UButton.primary({
    Key? key,
    required String label,
    required UIconData uIconData,
    required VoidCallback onPressed,
    Color? color,
    bool disabled = false,
  })  : _buttonType = _ButtonType.primary,
        _label = label,
        _disabled = disabled,
        _uIconData = uIconData,
        _onPressed = onPressed,
        _color = color,
        super(key: key);

  ///[ElevatedButton] with Text and Icon:
  ///
  /// backgroundColor is [UColors.ctaDark]
  ///
  ///```dart
  /// UButton.secondary(
  ///    label: 'ButtonText',
  ///    uIconData: UIcons.about,
  ///    onPressed: () {},
  ///  )
  ///```
  const UButton.secondary({
    Key? key,
    required String label,
    required UIconData uIconData,
    required VoidCallback onPressed,
    Color? color,
    bool disabled = false,
  })  : _buttonType = _ButtonType.secondary,
        _label = label,
        _disabled = disabled,
        _uIconData = uIconData,
        _onPressed = onPressed,
        _color = color,
        super(key: key);

  ///[ElevatedButton] with Text only:
  ///
  /// backgroundColor is [UColors.ctaBlue]
  ///
  ///```dart
  /// UButton.filled1(
  ///    label: 'ButtonText',
  ///    onPressed: () {},
  ///  )
  ///```
  const UButton.filled1({
    Key? key,
    required String label,
    required VoidCallback onPressed,
    Color? color,
    bool disabled = false,
  })  : _buttonType = _ButtonType.filled1,
        _label = label,
        _disabled = disabled,
        _uIconData = null,
        _color = color,
        _onPressed = onPressed,
        super(key: key);

  ///[ElevatedButton] with Text only:
  ///
  /// backgroundColor is [UColors.ctaDark]
  ///
  ///```dart
  /// UButton.filled2(
  ///    label: 'ButtonText',
  ///    onPressed: () {},
  ///  )
  ///```
  const UButton.filled2({
    Key? key,
    required String label,
    required VoidCallback onPressed,
    Color? color,
    bool disabled = false,
  })  : _buttonType = _ButtonType.filled2,
        _label = label,
        _disabled = disabled,
        _uIconData = null,
        _color = color,
        _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? getBGColor(Set<MaterialState> states) {
      if (_color != null) {
        return _color;
      } else if ((_buttonType == _ButtonType.primary) ||
          (_buttonType == _ButtonType.filled1)) {
        return UColors.ctaBlue;
      }
      return UColors.ctaDark;
    }

    EdgeInsetsGeometry? getPadding(Set<MaterialState> states) {
      if ((_buttonType == _ButtonType.primary) ||
          (_buttonType == _ButtonType.secondary)) {
        return const EdgeInsets.fromLTRB(16, 8, 24, 8);
      }
      return const EdgeInsets.fromLTRB(24, 13, 24, 12);
    }

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      opacity: _disabled ? 0.5 : 1,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(getBGColor),
            padding: MaterialStateProperty.resolveWith(getPadding),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(50, 40),
            )),
        onPressed: _disabled ? null : _onPressed,
        onLongPress: null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_uIconData != null) ...[
              UIcon(_uIconData!),
              const SizedBox(width: 8),
            ],
            UText(
              _label,
              textStyle: UTextStyle.BUT1_primaryButton,
              textColor: UColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
