import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/const_export.dart';

void main() {
  group('Test the values on USizes class |', () {
    test('UIcon Size Values', () {
      const _iconSize = 24.0;
      expect(USizes.iconSize, _iconSize);
    });

    test('UText Size Values', () {
      const _textH5TopMenuBarTitleSize = 18.0;
      const _textH1PrimaryHeaderSize = 10.0;
      const _textH2SecondaryHeaderSize = 12.0;
      const _textH3TertiaryHeaderSize = 12.0;
      const _textH4FourthHeaderSize = 14.0;
      const _textB1BodySize = 10.0;
      const _textB2MediumSize = 10.0;
      const _textB3ItalicsSize = 10.0;
      const _textB4BoldSize = 10.0;
      const _textM1MicroSize = 9.0;
      const _textBUT1ButtonSize = 10.0;
      const _textBUT2SecondaryButtonSize = 10.0;
      expect(USizes.textH5TopMenuBarTitleSize, _textH5TopMenuBarTitleSize);
      expect(USizes.textH1PrimaryHeaderSize, _textH1PrimaryHeaderSize);
      expect(USizes.textH2SecondaryHeaderSize, _textH2SecondaryHeaderSize);
      expect(USizes.textH3TertiaryHeaderSize, _textH3TertiaryHeaderSize);
      expect(USizes.textH4FourthHeaderSize, _textH4FourthHeaderSize);
      expect(USizes.textB1BodySize, _textB1BodySize);
      expect(USizes.textB2MediumSize, _textB2MediumSize);
      expect(USizes.textB3ItalicsSize, _textB3ItalicsSize);
      expect(USizes.textB4BoldSize, _textB4BoldSize);
      expect(USizes.textM1MicroSize, _textM1MicroSize);
      expect(USizes.textBUT1ButtonSize, _textBUT1ButtonSize);
      expect(USizes.textBUT2SecondaryButtonSize, _textBUT2SecondaryButtonSize);
    });

    test('UUserProfile Size Values', () {
      const _userProfileTopMenuBarSize = 30.0;
      const _userProfileNormalSize = 40.0;
      const _userProfileLargeSize = 56.0;
      const _userProfileStatusSmallSize = 8.0;
      const _userProfileStatusNormalSize = 12.0;
      expect(USizes.userProfileTopMenuBarSize, _userProfileTopMenuBarSize);
      expect(USizes.userProfileNormalSize, _userProfileNormalSize);
      expect(USizes.userProfileLargeSize, _userProfileLargeSize);
      expect(USizes.userProfileStatusSmallSize, _userProfileStatusSmallSize);
      expect(USizes.userProfileStatusNormalSize, _userProfileStatusNormalSize);
    });
  });
}
