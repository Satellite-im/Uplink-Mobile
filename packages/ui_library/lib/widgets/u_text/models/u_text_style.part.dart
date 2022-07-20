// ignore_for_file: constant_identifier_names

part of '../u_text.dart';

/// Returns a textStyle with pre setted properties
///
/// Need to be used within [UText]
///
/// Example:
/// ```dart
///    UText(
///     'Text example',
///     textStyle: UTextStyle.B1_body,
///    ),
/// ```
enum UTextStyle {
  /// Top Menu Bar Title
  H1_primaryHeader,
  H2_secondaryHeader,
  H3_tertiaryHeader,
  H4_fourthHeader,
  H5_fifthHeader,
  B1_body,
  B2_medium,
  B3_bold,
  B4_italics,
  M1_micro,
  BUT1_primaryButton,
  BUT2_secondaryButton,
}

extension UTextStyleExtension on UTextStyle {
  _UTextStyle get style {
    final _uTextStyle = _UTextStyle(
      fontStyle: FontStyle.normal,
    );
    switch (this) {
      case UTextStyle.H1_primaryHeader:
        return _uTextStyle._copyWith(
          fontFamily: UFonts.textSpaceMonoFont,
          fontWeight: FontWeight.w700,
          fontSize: USizes.textH1TopMenuBarTitleSize,
          color: UColors.textMed,
        );
      case UTextStyle.H2_secondaryHeader:
        return _uTextStyle._copyWith(
          fontFamily: UFonts.textPoppinsFont,
          fontWeight: FontWeight.w600,
          fontSize: USizes.textH2SecondaryHeaderSize,
          color: UColors.white,
        );
      case UTextStyle.H3_tertiaryHeader:
        return _uTextStyle._copyWith(
          fontFamily: UFonts.textSpaceMonoFont,
          fontWeight: FontWeight.w700,
          fontSize: USizes.textH3TertiaryHeaderSize,
          color: UColors.white,
        );
      case UTextStyle.H4_fourthHeader:
        return _uTextStyle._copyWith(
          fontFamily: UFonts.textSpaceMonoFont,
          fontWeight: FontWeight.w700,
          fontSize: USizes.textH4FourthHeaderSize,
          color: UColors.textMed,
        );
      case UTextStyle.H5_fifthHeader:
        return _uTextStyle._copyWith(
          fontFamily: UFonts.textPoppinsFont,
          fontWeight: FontWeight.w400,
          fontSize: USizes.textH5FifthHeaderSize,
          color: UColors.white,
        );
      case UTextStyle.B1_body:
        return _uTextStyle._copyWith(
          fontFamily: UFonts.textPoppinsFont,
          fontWeight: FontWeight.w400,
          fontSize: USizes.textB1BodySize,
          color: UColors.white,
        );
      case UTextStyle.B2_medium:
        return _uTextStyle._copyWith(
          fontFamily: UFonts.textPoppinsFont,
          fontWeight: FontWeight.w500,
          fontSize: USizes.textB2MediumSize,
          color: UColors.white,
        );
      case UTextStyle.B3_bold:
        return _uTextStyle._copyWith(
          fontFamily: UFonts.textPoppinsFont,
          fontWeight: FontWeight.w700,
          fontSize: USizes.textB3BoldSize,
          color: UColors.white,
        );
      case UTextStyle.B4_italics:
        return _uTextStyle._copyWith(
          fontFamily: UFonts.textPoppinsFont,
          fontSize: USizes.textB4ItalicsSize,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.italic,
          color: UColors.white,
        );

      case UTextStyle.M1_micro:
        return _uTextStyle._copyWith(
          fontFamily: UFonts.textPoppinsFont,
          fontWeight: FontWeight.w400,
          fontSize: USizes.textM1MicroSize,
          color: UColors.textDark,
        );
      case UTextStyle.BUT1_primaryButton:
        return _uTextStyle._copyWith(
          fontFamily: UFonts.textPoppinsFont,
          fontWeight: FontWeight.w400,
          fontSize: USizes.textBUT1ButtonSize,
          color: UColors.white,
        );
      case UTextStyle.BUT2_secondaryButton:
        return _uTextStyle._copyWith(
          fontFamily: UFonts.textPoppinsFont,
          fontWeight: FontWeight.w500,
          fontSize: USizes.textBUT2SecondaryButtonSize,
          color: UColors.ctaBlue,
        );
    }
  }
}

class _UTextStyle {
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final double? letterSpacing;
  final String package;

  _UTextStyle({
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
  }) : package = 'ui_library';

  _UTextStyle _copyWith({
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    String? fontFamily,
    double? letterSpacing,
  }) {
    return _UTextStyle(
      color: color ?? this.color,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  TextStyle returnTextStyleType({
    Color? color,
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    String? fontFamily,
    double? letterSpacing,
  }) {
    return TextStyle(
      color: color ?? this.color,
      package: 'ui_library',
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      fontStyle: fontStyle ?? this.fontStyle,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }
}
