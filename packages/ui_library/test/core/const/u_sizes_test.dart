import 'package:ui_library/core/const/const_export.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('USizes Class - Size\'s value', () {
    const _iconSize = 24.0;
    const _textH1TopMenuBarTitleSize = 18.0;
    const _textH2SecondaryHeaderSize = 14.0;
    const _textH3TertiaryHeaderSize = 12.0;
    const _textH4FourthHeaderSize = 12.0;
    const _textH5FifthHeaderSize = 10.0;
    const _textB1BodySize = 10.0;
    const _textB2MediumSize = 10.0;
    const _textB3ItalicsSize = 10.0;
    const _textB4BoldSize = 10.0;
    const _textM1MicroSize = 9.0;
    const _textBUT1ButtonSize = 10.0;
    const _textBUT2SecondaryButtonSize = 10.0;
    const _userProfileTopMenuBarSize = 30.0;
    const _userProfileNormalSize = 40.0;
    const _userProfileLargeSize = 56.0;
    const _userProfileStatusSmallSize = 8.0;
    const _userProfileStatusNormalSize = 12.0;
    const _userProfileNormalMaxUsernameTextSize = 72.0;
    const _userProfileMessagesUnreadsMaxMessagesSize = 42.0;
    const _unreadMessagesIndicatorSize = 20.0;
    const _avatarProfileNormalSize = 40.0;
    const _avatarProfileLargeSize = 56.0;
    const _unreadMessagesLessThanTenWidthSize = 20.0;
    const _unreadMessagesLessThanHundredWidthSize = 27.0;
    const _unreadMessagesLessThanThousandWidthSize = 35.0;
    const _unreadMessagesGreaterThanOrEqualToThousandWidthSize = 42.0;
    const _buttonSize = 56.0;
    const _buttonSizeSmall = 40.0;
    const _recoverySeedBoxWidthSize = 160.0;
    const _recoverySeedBoxHeightSize = 40.0;
    const _recoverySeedBoxNumberBoxWidthSize = 14.0;
    const _recoverySeedBoxNumberBoxHeightSize = 15.0;
    const _switcherTotalHeight = 20.0;
    const _switcherTotalWidth = 36.0;
    const _switcherTrackHeight = 16.0;
    const _dropDownMenuButtonHeight = 40;
    const _dropDownMenuItemHeight = 48;
    const _barAboveBottomSheetHeightSize = 2.0;
    const _barAboveBottomSheetWidthSize = 72.0;
    const _barAboveBottomSheetBorderRadius = 8.0;
    const _bottomSheetTemplateBorderRadius = 20.0;

    then('iconSize should return correct value',
        () => USizes.iconSize.should.be(_iconSize),
        and: {
          'uBottomSheetPinOptions should return correct value': () => USizes
              .textH1TopMenuBarTitleSize.should
              .be(_textH1TopMenuBarTitleSize),
          'textH2SecondaryHeaderSize should return correct value': () => USizes
              .textH2SecondaryHeaderSize.should
              .be(_textH2SecondaryHeaderSize),
          'textH3TertiaryHeaderSize should return correct value': () => USizes
              .textH3TertiaryHeaderSize.should
              .be(_textH3TertiaryHeaderSize),
          'textH4FourthHeaderSize should return correct value': () =>
              USizes.textH4FourthHeaderSize.should.be(_textH4FourthHeaderSize),
          'textH5FifthHeaderSize should return correct value': () =>
              USizes.textH5FifthHeaderSize.should.be(_textH5FifthHeaderSize),
          'textB1BodySize should return correct value': () =>
              USizes.textB1BodySize.should.be(_textB1BodySize),
          'textB2MediumSize should return correct value': () =>
              USizes.textB2MediumSize.should.be(_textB2MediumSize),
          'textB3ItalicsSize should return correct value': () =>
              USizes.textB3ItalicsSize.should.be(_textB3ItalicsSize),
          'textB4BoldSize should return correct value': () =>
              USizes.textB4BoldSize.should.be(_textB4BoldSize),
          'textM1MicroSize should return correct value': () =>
              USizes.textM1MicroSize.should.be(_textM1MicroSize),
          'textBUT1ButtonSize should return correct value': () =>
              USizes.textBUT1ButtonSize.should.be(_textBUT1ButtonSize),
          'textBUT2SecondaryButtonSize should return correct value': () =>
              USizes.textBUT2SecondaryButtonSize.should
                  .be(_textBUT2SecondaryButtonSize),
          'userProfileTopMenuBarSize should return correct value': () => USizes
              .userProfileTopMenuBarSize.should
              .be(_userProfileTopMenuBarSize),
          'userProfileNormalSize should return correct value': () =>
              USizes.userProfileNormalSize.should.be(_userProfileNormalSize),
          'userProfileLargeSize should return correct value': () =>
              USizes.userProfileLargeSize.should.be(_userProfileLargeSize),
          'userProfileStatusSmallSize should return correct value': () => USizes
              .userProfileStatusSmallSize.should
              .be(_userProfileStatusSmallSize),
          'userProfileStatusNormalSize should return correct value': () =>
              USizes.userProfileStatusNormalSize.should
                  .be(_userProfileStatusNormalSize),
          'userProfileNormalMaxUsernameTextSize should return correct value':
              () => USizes.userProfileNormalMaxUsernameTextSize.should
                  .be(_userProfileNormalMaxUsernameTextSize),
          'userProfileMessagesUnreadsMaxMessagesSize should return correct value':
              () => USizes.userProfileMessagesUnreadsMaxMessagesSize.should
                  .be(_userProfileMessagesUnreadsMaxMessagesSize),
          'unreadMessagesIndicatorSize should return correct value': () =>
              USizes.unreadMessagesIndicatorSize.should
                  .be(_unreadMessagesIndicatorSize),
          'avatarProfileNormalSize should return correct value': () => USizes
              .avatarProfileNormalSize.should
              .be(_avatarProfileNormalSize),
          'avatarProfileLargeSize should return correct value': () =>
              USizes.avatarProfileLargeSize.should.be(_avatarProfileLargeSize),
          'unreadMessagesLessThanTenWidthSize should return correct value':
              () => USizes.unreadMessagesLessThanTenWidthSize.should
                  .be(_unreadMessagesLessThanTenWidthSize),
          'unreadMessagesLessThanHundredWidthSize should return correct value':
              () => USizes.unreadMessagesLessThanHundredWidthSize.should
                  .be(_unreadMessagesLessThanHundredWidthSize),
          'unreadMessagesLessThanThousandWidthSize should return correct value':
              () => USizes.unreadMessagesLessThanThousandWidthSize.should
                  .be(_unreadMessagesLessThanThousandWidthSize),
          'unreadMessagesGreaterThanOrEqualToThousandWidthSize should return correct value':
              () => USizes
                  .unreadMessagesGreaterThanOrEqualToThousandWidthSize.should
                  .be(_unreadMessagesGreaterThanOrEqualToThousandWidthSize),
          'buttonSize should return correct value': () =>
              USizes.buttonSize.should.be(_buttonSize),
          'buttonSizeSmall should return correct value': () =>
              USizes.buttonSizeSmall.should.be(_buttonSizeSmall),
          'recoverySeedBoxWidthSize should return correct value': () => USizes
              .recoverySeedBoxWidthSize.should
              .be(_recoverySeedBoxWidthSize),
          'recoverySeedBoxHeightSize should return correct value': () => USizes
              .recoverySeedBoxHeightSize.should
              .be(_recoverySeedBoxHeightSize),
          'recoverySeedBoxNumberBoxWidthSize should return correct value': () =>
              USizes.recoverySeedBoxNumberBoxWidthSize.should
                  .be(_recoverySeedBoxNumberBoxWidthSize),
          'recoverySeedBoxNumberBoxHeightSize should return correct value':
              () => USizes.recoverySeedBoxNumberBoxHeightSize.should
                  .be(_recoverySeedBoxNumberBoxHeightSize),
          'switcherTotalHeight should return correct value': () =>
              USizes.switcherTotalHeight.should.be(_switcherTotalHeight),
          'switcherTotalWidth should return correct value': () =>
              USizes.switcherTotalWidth.should.be(_switcherTotalWidth),
          'switcherTrackHeight should return correct value': () =>
              USizes.switcherTrackHeight.should.be(_switcherTrackHeight),
          'dropDownMenuButtonHeight should return correct value': () => USizes
              .dropDownMenuButtonHeight.should
              .be(_dropDownMenuButtonHeight),
          'dropDownMenuItemHeight should return correct value': () =>
              USizes.dropDownMenuItemHeight.should.be(_dropDownMenuItemHeight),
          'barAboveBottomSheetHeightSize should return correct value': () =>
              USizes.barAboveBottomSheetHeightSize.should
                  .be(_barAboveBottomSheetHeightSize),
          'barAboveBottomSheetWidthSize should return correct value': () =>
              USizes.barAboveBottomSheetWidthSize.should
                  .be(_barAboveBottomSheetWidthSize),
          'barAboveBottomSheetBorderRadius should return correct value': () =>
              USizes.barAboveBottomSheetBorderRadius.should
                  .be(_barAboveBottomSheetBorderRadius),
          'bottomSheetTemplateBorderRadius should return correct value': () =>
              USizes.bottomSheetTemplateBorderRadius.should
                  .be(_bottomSheetTemplateBorderRadius),
        });
  });
}
