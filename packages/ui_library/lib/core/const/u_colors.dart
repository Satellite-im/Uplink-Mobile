import 'package:flutter/material.dart';

/// Used to define the colors of widgets and themes inside ui_library
///
/// Example:
/// ```dart
///  @override
///  Widget build(BuildContext context) {
///    return UText(
///      'Color example',
///      textStyle: UTextStyle.H1_primaryHeader,
///      color: UColors.backgroundDark,
///    );
///  }
/// ```
class UColors {
  static const backgroundDark = Color(0xFF0D0E16);

  static const foregroundDark = Color(0xFF232838);

  static const modalDark = Color(0xFF1A1E2E);

  static const white = Color(0xFFEEF0F2);

  static const ctaBlue = Color(0xFF205FFA);

  static const ctaDark = Color(0xFF31353D);

  static const onlineGreen = Color(0xFF00B894);

  static const idleYellow = Color(0xFFFECA57);

  static const termRed = Color(0xFFF93854);

  static const defGrey = Color(0xFF576574);

  static const textMed = Color(0xFFA8AABE);

  static const textDark = Color(0xFF6F748A);
}
