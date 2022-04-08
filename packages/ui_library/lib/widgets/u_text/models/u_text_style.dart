// ignore_for_file: constant_identifier_names

part of '../u_text.dart';

/// Returns a textStyle with pre setted properties
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
  TextStyle get _style {
    const _standardTextStyle = TextStyle(
      fontFamily: UFonts.textPoppinsFont,
      fontWeight: FontWeight.w400,
      fontSize: USizes.textPrimaryHeaderSize,
      fontStyle: FontStyle.normal,
    );
    switch (this) {
      case UTextStyle.H1_primaryHeader:
        return _standardTextStyle;
      case UTextStyle.H2_secondaryHeader:
        return _standardTextStyle.copyWith(
          fontFamily: UFonts.textSpaceMonoFont,
          fontWeight: FontWeight.w700,
          fontSize: USizes.textSecondaryHeaderSize,
        );
      case UTextStyle.H3_tertiaryHeader:
        return _standardTextStyle.copyWith(
          fontFamily: UFonts.textSpaceMonoFont,
          fontWeight: FontWeight.w700,
          fontSize: USizes.textTertiaryHeaderSize,
        );
      case UTextStyle.H4_fourthHeader:
        return _standardTextStyle.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: USizes.textFourthHeaderSize,
        );
      case UTextStyle.H5_topMenuBarTitle:
        return _standardTextStyle.copyWith(
          fontFamily: UFonts.textSpaceMonoFont,
          fontWeight: FontWeight.w700,
          fontSize: USizes.textTopMenuBarTitleSize,
        );
      case UTextStyle.B1_body:
        return _standardTextStyle.copyWith(
          fontSize: USizes.textBodySize,
        );
      case UTextStyle.B2_medium:
        return _standardTextStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: USizes.textMediumSize,
        );
      case UTextStyle.B3_italics:
        return _standardTextStyle.copyWith(
          fontSize: USizes.textItalicsSize,
          fontStyle: FontStyle.italic,
        );
      case UTextStyle.B4_bold:
        return _standardTextStyle.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: USizes.textBoldSize,
        );
      case UTextStyle.M1_micro:
        return _standardTextStyle.copyWith(
          fontSize: USizes.textMicroSize,
        );

      case UTextStyle.BUT1_button:
        return _standardTextStyle.copyWith(
          fontSize: USizes.textPrimaryButtonSize,
        );
      case UTextStyle.BUT2_secondaryButton:
        return _standardTextStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: USizes.textSecondaryButtonSize,
        );
      default:
        return _standardTextStyle;
    }
  }
}
