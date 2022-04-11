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
  static const ctablue = Color(0xFF205FFA);
  static const ctadark = Color(0xFF31353D);
}
