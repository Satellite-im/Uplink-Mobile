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
///      color: UColors.bgDark,
///    );
///  }
/// ```
class UColors {
  ///FF0D0E16
  static const dark = Color(0xFF0D0E16);

  ///FF232838
  static const fgDark = Color(0xFF232838);

  ///FF1A1E2E
  static const mdDark = Color(0xFF1A1E2E);

  ///FF205FFA
  static const ctaBlue = Color(0xFF205FFA);

  ///FF31353D
  static const ctaDark = Color(0xFF31353D);
}
