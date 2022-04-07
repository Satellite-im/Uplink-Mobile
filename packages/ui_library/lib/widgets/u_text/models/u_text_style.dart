part of '../u_text.dart';

enum UTextStyle {
  primaryHeader,
  secondaryHeader,
  tertiaryHeader,
  topMenuBarTitle,
  body,
  medium,
  italics,
  bold,
  micro,
  primaryButton,
  secondaryButton,
}

extension UTextStyleExtension on UTextStyle {
  _UTextStyle get _style {
    switch (this) {
      case UTextStyle.primaryHeader:
        return const _UTextStyle(
          uFontFamily: UFonts.textPoppinsFont,
          uFontWeight: FontWeight.w400,
          uFontSize: USizes.textPrimaryHeaderSize,
        );
      case UTextStyle.secondaryHeader:
        return const _UTextStyle(
          uFontFamily: UFonts.textSpaceMonoFont,
          uFontWeight: FontWeight.w700,
          uFontSize: USizes.textSecondaryHeaderSize,
        );
      case UTextStyle.tertiaryHeader:
        return const _UTextStyle(
          uFontFamily: UFonts.textPoppinsFont,
          uFontWeight: FontWeight.w600,
          uFontSize: USizes.textTertiaryHeaderSize,
        );
      case UTextStyle.topMenuBarTitle:
        return const _UTextStyle(
          uFontFamily: UFonts.textSpaceMonoFont,
          uFontWeight: FontWeight.w700,
          uFontSize: USizes.textTopMenuBarTitleSize,
        );
      case UTextStyle.body:
        return const _UTextStyle(
          uFontFamily: UFonts.textPoppinsFont,
          uFontWeight: FontWeight.w400,
          uFontSize: USizes.textBodySize,
        );
      case UTextStyle.medium:
        return const _UTextStyle(
          uFontFamily: UFonts.textPoppinsFont,
          uFontWeight: FontWeight.w500,
          uFontSize: USizes.textMediumSize,
        );
      case UTextStyle.italics:
        return const _UTextStyle(
          uFontFamily: UFonts.textPoppinsFont,
          uFontWeight: FontWeight.w400,
          uFontSize: USizes.textItalicsSize,
          uFontStyle: FontStyle.italic,
        );
      case UTextStyle.bold:
        return const _UTextStyle(
          uFontFamily: UFonts.textPoppinsFont,
          uFontWeight: FontWeight.w700,
          uFontSize: USizes.textBoldSize,
        );
      case UTextStyle.micro:
        return const _UTextStyle(
          uFontFamily: UFonts.textPoppinsFont,
          uFontWeight: FontWeight.w400,
          uFontSize: USizes.textMicroSize,
        );
      case UTextStyle.primaryButton:
        return const _UTextStyle(
          uFontFamily: UFonts.textPoppinsFont,
          uFontWeight: FontWeight.w400,
          uFontSize: USizes.textPrimaryButtonSize,
        );
      case UTextStyle.secondaryButton:
        return const _UTextStyle(
          uFontFamily: UFonts.textPoppinsFont,
          uFontWeight: FontWeight.w500,
          uFontSize: USizes.textSecondaryButtonSize,
        );

      default:
        return const _UTextStyle(
          uFontFamily: UFonts.textPoppinsFont,
          uFontWeight: FontWeight.w400,
          uFontSize: USizes.textPrimaryHeaderSize,
        );
    }
  }
}

class _UTextStyle extends TextStyle {
  final Color? uColor;

  final Color? uBackgroundColor;

  final double? uFontSize;

  final FontWeight? uFontWeight;

  final FontStyle? uFontStyle;

  final String? uFontFamily;

  final double? uLetterSpacing;

  const _UTextStyle({
    this.uColor,
    this.uBackgroundColor,
    this.uFontSize,
    this.uFontFamily,
    this.uFontWeight,
    this.uFontStyle = FontStyle.normal,
    this.uLetterSpacing,
  });
}
