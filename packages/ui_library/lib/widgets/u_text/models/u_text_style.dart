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
  H1_primaryHeader,
  H2_secondaryHeader,
  H3_tertiaryHeader,
  H4_fourthHeader,
  H5_topMenuBarTitle,
  B1_body,
  B2_medium,
  B3_italics,
  B4_bold,
  M1_micro,
  BUT1_button,
  BUT2_secondaryButton,
}

extension UTextStyleExtension on UTextStyle {
  _UTextStyle get style {
    final _standardUTextStyle = _UTextStyle(
      fontFamily: UFonts.textPoppinsFont,
      fontWeight: FontWeight.w400,
      fontSize: USizes.textH1PrimaryHeaderSize,
      fontStyle: FontStyle.normal,
    );
    switch (this) {
      case UTextStyle.H1_primaryHeader:
        return _standardUTextStyle;
      case UTextStyle.H2_secondaryHeader:
        return _standardUTextStyle._copyWith(
          fontFamily: UFonts.textSpaceMonoFont,
          fontWeight: FontWeight.w700,
          fontSize: USizes.textH2SecondaryHeaderSize,
        );
      case UTextStyle.H3_tertiaryHeader:
        return _standardUTextStyle._copyWith(
          fontFamily: UFonts.textSpaceMonoFont,
          fontWeight: FontWeight.w700,
          fontSize: USizes.textH3TertiaryHeaderSize,
        );
      case UTextStyle.H4_fourthHeader:
        return _standardUTextStyle._copyWith(
          fontWeight: FontWeight.w600,
          fontSize: USizes.textH4FourthHeaderSize,
        );
      case UTextStyle.H5_topMenuBarTitle:
        return _standardUTextStyle._copyWith(
          fontFamily: UFonts.textSpaceMonoFont,
          fontWeight: FontWeight.w700,
          fontSize: USizes.textH5TopMenuBarTitleSize,
        );
      case UTextStyle.B1_body:
        return _standardUTextStyle._copyWith(
          fontSize: USizes.textB1BodySize,
        );
      case UTextStyle.B2_medium:
        return _standardUTextStyle._copyWith(
          fontWeight: FontWeight.w500,
          fontSize: USizes.textB2MediumSize,
        );
      case UTextStyle.B3_italics:
        return _standardUTextStyle._copyWith(
          fontSize: USizes.textB3ItalicsSize,
          fontStyle: FontStyle.italic,
        );
      case UTextStyle.B4_bold:
        return _standardUTextStyle._copyWith(
          fontWeight: FontWeight.w700,
          fontSize: USizes.textB4BoldSize,
        );
      case UTextStyle.M1_micro:
        return _standardUTextStyle._copyWith(
          fontSize: USizes.textM1MicroSize,
        );
      case UTextStyle.BUT1_button:
        return _standardUTextStyle._copyWith(
          fontSize: USizes.textBUT1ButtonSize,
        );
      case UTextStyle.BUT2_secondaryButton:
        return _standardUTextStyle._copyWith(
          fontWeight: FontWeight.w500,
          fontSize: USizes.textBUT2SecondaryButtonSize,
        );
      default:
        return _standardUTextStyle;
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

  _UTextStyle({
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
    this.letterSpacing,
  });

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
}
