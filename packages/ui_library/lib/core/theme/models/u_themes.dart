import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

/// Used in [ThemeModel] to decide which [ThemeData] user is currently using
///
/// Current available [ThemeData] : [UThemes.dark],[UThemes.light],[UThemes.tbd]
class UThemes {
  UThemes._();
  static final dark = ThemeData(
    scaffoldBackgroundColor: UColors.backgroundDark,

    ///temporary use for dropdownButton in showroom page
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
    ),

    ///appbar in the main app
    appBarTheme: AppBarTheme(
      backgroundColor: UColors.backgroundDark,
      titleTextStyle: UTextStyle.H1_primaryHeader.style.returnTextStyleType(),
      centerTitle: false,
    ),

    ///button in showroom page
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(UColors.ctaBlue))),
  );

  static final light = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.dark());

  static final tbd = ThemeData(
    scaffoldBackgroundColor: Colors.pink,
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
    ),
  );
}
