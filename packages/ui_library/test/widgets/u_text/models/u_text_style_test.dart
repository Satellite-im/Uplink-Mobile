import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/u_colors.dart';
import 'package:ui_library/widgets/widgets_export.dart';

void main() {
  group('UTextStyles |', () {
    const _textPoppinsFont = 'Poppins';
    const _textSpaceMonoFont = 'SpaceMono';

    test('Test quantity of TextStyles', () {
      const _listTextStyles = UTextStyle.values;
      const _numberOfTextStyles = 12;
      expect(_listTextStyles.length, _numberOfTextStyles);
    });

    test('Test H1 Primary Header', () {
      final _textStyleUnderTest = UTextStyle.H1_primaryHeader.style;

      expect(_textStyleUnderTest.fontFamily, _textSpaceMonoFont);
      expect(_textStyleUnderTest.fontSize, 18.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w700);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
      expect(_textStyleUnderTest.color, UColors.textMed);
    });

    test('Test H2 Secondary Header', () {
      final _textStyleUnderTest = UTextStyle.H2_secondaryHeader.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 14.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w600);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
      expect(_textStyleUnderTest.color, UColors.white);
    });

    test('Test H3 Tertiary Header', () {
      final _textStyleUnderTest = UTextStyle.H3_tertiaryHeader.style;

      expect(_textStyleUnderTest.fontFamily, _textSpaceMonoFont);
      expect(_textStyleUnderTest.fontSize, 12.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w700);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
      expect(_textStyleUnderTest.color, UColors.textMed);
    });

    test('Test H4 Fourth Header', () {
      final _textStyleUnderTest = UTextStyle.H4_fourthHeader.style;

      expect(_textStyleUnderTest.fontFamily, _textSpaceMonoFont);
      expect(_textStyleUnderTest.fontSize, 12.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w700);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
      expect(_textStyleUnderTest.color, UColors.white);
    });

    test('Test H5 Fifth Header', () {
      final _textStyleUnderTest = UTextStyle.H5_fifthHeader.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w400);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
      expect(_textStyleUnderTest.color, UColors.textMed);
    });

    test('Test B1 Body', () {
      final _textStyleUnderTest = UTextStyle.B1_body.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w400);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
      expect(_textStyleUnderTest.color, UColors.white);
    });

    test('Test B2 Medium', () {
      final _textStyleUnderTest = UTextStyle.B2_medium.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w500);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
      expect(_textStyleUnderTest.color, UColors.white);
    });
    test('Test B3 Bold', () {
      final _textStyleUnderTest = UTextStyle.B3_bold.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w700);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
      expect(_textStyleUnderTest.color, UColors.white);
    });
    test('Test B4 Italics', () {
      final _textStyleUnderTest = UTextStyle.B4_italics.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w400);
      expect(_textStyleUnderTest.fontStyle, FontStyle.italic);
      expect(_textStyleUnderTest.color, UColors.white);
    });

    test('Test M1 Micro', () {
      final _textStyleUnderTest = UTextStyle.M1_micro.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 9.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w400);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
      expect(_textStyleUnderTest.color, UColors.textDark);
    });

    test('Test BUT1 Primary Button', () {
      final _textStyleUnderTest = UTextStyle.BUT1_primaryButton.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w400);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
      expect(_textStyleUnderTest.color, UColors.white);
    });

    test('Test BUT2 Secondary Button', () {
      final _textStyleUnderTest = UTextStyle.BUT2_secondaryButton.style;

      expect(_textStyleUnderTest.fontFamily, _textPoppinsFont);
      expect(_textStyleUnderTest.fontSize, 10.0);
      expect(_textStyleUnderTest.fontWeight, FontWeight.w500);
      expect(_textStyleUnderTest.fontStyle, FontStyle.normal);
      expect(_textStyleUnderTest.color, UColors.ctaBlue);
    });
  });
}
