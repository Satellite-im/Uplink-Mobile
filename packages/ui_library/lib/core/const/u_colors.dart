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
  /// FF0D0E16
  static const backgroundDark = Color(0xFF0D0E16);

  /// FF232838
  static const foregroundDark = Color(0xFF232838);

  /// FF1A1E2E
  static const modalDark = Color(0xFF1A1E2E);

  /// FFEEF0F2
  static const white = Color(0xFFEEF0F2);

  /// FF205FFA
  static const ctaBlue = Color(0xFF205FFA);

  /// FF31353D
  static const ctaDark = Color(0xFF31353D);

  /// FF00B894
  static const onlineGreen = Color(0xFF00B894);

  /// FFFECA57
  static const idleYellow = Color(0xFFFECA57);

  /// FFF93854
  static const termRed = Color(0xFFF93854);

  /// FF576574
  static const defGrey = Color(0xFF576574);

  /// FFA8AABE
  static const textMed = Color(0xFFA8AABE);

  /// FF6F748A
  static const textDark = Color(0xFF6F748A);
}
