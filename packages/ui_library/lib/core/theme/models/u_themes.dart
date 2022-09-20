import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

/// Used in [ThemeModel] to decide which [ThemeData] user is currently using
///
/// Current available [ThemeData] : [UThemes.dark],[UThemes.light],[UThemes.tbd]
class UThemes {
  UThemes._();
  static get dark => ThemeData(
        scaffoldBackgroundColor: UColors.backgroundDark,

        ///temporary use for dropdownButton in showroom page
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
        ),

        ///appbar in the main app
        appBarTheme: AppBarTheme(
          backgroundColor: UColors.backgroundDark,
          titleTextStyle:
              UTextStyle.H1_primaryHeader.style.returnTextStyleType(),
          centerTitle: false,
          elevation: 0,
        ),

        ///button in showroom page
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: UColors.ctaBlue),
        ),

        //cursorColor in search contact bar
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.white),

        //remove all the underline in text field.(search contact bar)
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(16),
          border: const UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          hintStyle: UTextStyle.H5_fifthHeader.style
              .returnTextStyleType(color: UColors.textDark),
        ),

        textTheme: TextTheme(
          //TextStyle in search bar
          subtitle1: UTextStyle.H5_fifthHeader.style
              .returnTextStyleType(color: Colors.white),
        ),
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
