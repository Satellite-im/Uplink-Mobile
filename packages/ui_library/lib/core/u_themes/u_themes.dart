import 'package:flutter/material.dart';
import 'package:ui_library/core/const/const_export.dart';

class UThemes {
  static final dark = ThemeData(
    scaffoldBackgroundColor: UColors.bgDark,
    colorScheme: const ColorScheme.dark(),
  );
  static final light = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.dark());
  static final tbd = ThemeData(
    scaffoldBackgroundColor: Colors.blue,
    colorScheme: const ColorScheme.highContrastDark(),
  );
}
