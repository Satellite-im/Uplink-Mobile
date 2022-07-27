/// Used to define the sizes of widgets inside ui_library
///
/// Example:
/// ```dart
///  @override
///  Widget build(BuildContext context) {
///    return Icon(
///      icon,
///      size: USizes.iconSize,
///      key: key,
///    );
///  }
/// ```
class USizes {
  // Default size for [UIcon]
  static const double iconSize = 24.0;
  // Icon size for [ULogoutButton]
  static const double iconSizeSmall = 20.0;
  // Icon size for [AddPictureProfileButton]
  static const double iconAddPictureProfileButtonSize = 14.4;
  // Icon size for [URecoverySeedBox]
  static const double iconSizeMicro = 16.0;

  // Button size for [UIconButton]
  static const double buttonSize = 56.0;
  static const double buttonSizeSmall = 40.0;

  // Sizes for [UText]
  static const double textH1TopMenuBarTitleSize = 18.0;
  static const double textH2SecondaryHeaderSize = 14.0;
  static const double textH3TertiaryHeaderSize = 13.0;
  static const double textH4FourthHeaderSize = 13.0;
  static const double textH5FifthHeaderSize = 12.0;
  static const double textB1BodySize = 12.0;
  static const double textB2MediumSize = 12.0;
  static const double textB3BoldSize = 12.0;
  static const double textB4ItalicsSize = 12.0;
  static const double textM1MicroSize = 10.0;
  static const double textBUT1ButtonSize = 12.0;
  static const double textBUT2SecondaryButtonSize = 12.0;

  // Sizes for [Unread Messages Indicator]
  static const double unreadMessagesIndicatorSize = 20.0;

  // Sizes for [UUserProfile]
  static const double userProfileTopMenuBarSize = 30.0;
  static const double userProfileNormalSize = 40.0;
  static const double userProfileLargeSize = 56.0;
  static const double userProfileStatusSmallSize = 8.0;
  static const double userProfileStatusNormalSize = 12.0;
  static const double userProfileNormalMaxUsernameTextSize = 72.0;
  static const double userProfileMessagesUnreadsMaxMessagesSize = 42.0;

  // Sizes for [UAvatarProfile]
  static const double avatarProfileNormalSize = 40.0;
  static const double avatarProfileLargeSize = 56.0;

  // Width sizes for [UnreadMessagesIndicator]
  static const double unreadMessagesLessThanTenWidthSize = 20.0;
  static const double unreadMessagesLessThanHundredWidthSize = 27.0;
  static const double unreadMessagesLessThanThousandWidthSize = 35.0;
  static const double unreadMessagesGreaterThanOrEqualToThousandWidthSize =
      42.0;

  // Sizes for [UnreadMessagesUserProfileCard]
  static const double unreadMessagesUserProfileCardWidthSize = 58.0;

  // Width sizes for [Avatar Cards]
  static const double messageOnUnreadMessagesUserProfileCardWidthSize = 248;
  static const double messageOnUserProfileCardWidthSize = 270;

  // Sizes for [UPin]
  // Button size(width and height) for pinButton
  static const double pinButtonSize = 50.0;
  // Dot size(width and height) for pin dot
  static const double pinDotSize = 16;

  // Sizes for [URecoverySeedBox]
  static const double recoverySeedBoxWidthSize = 160.0;
  static const double recoverySeedBoxHeightSize = 40.0;
  static const double recoverySeedBoxNumberBoxWidthSize = 14.0;
  static const double recoverySeedBoxNumberBoxHeightSize = 15.0;

  // Sizes for [USwitcher]
  static const double switcherTotalHeight = 20.0;
  static const double switcherTotalWidth = 36.0;
  static const double switcherTrackHeight = 16.0;
  // Sizes for [UDropDownMenu]
  static const double dropDownMenuButtonHeight = 40;
  static const double dropDownMenuItemHeight = 48;

  // Sizes for [UBottomSheet]
  static const double barAboveBottomSheetHeightSize = 2.0;
  static const double barAboveBottomSheetWidthSize = 72.0;
  static const double barAboveBottomSheetBorderRadius = 8.0;
  static const double bottomSheetTemplateBorderRadius = 20.0;

  // Sizes for [UUserPictureChange]
  static const double userPictureChangeSize = 100.0;
  static const double userPictureChangeAddButtonSize = 24.0;
  // Sizes for [LoadingIndicator]
  static const double loadingIndicatorHeight = 6.0;

  // Sizes for [UFolderButton]
  static const double folderButtonHeight = 168;
  static const double folderButtonWidth = 160;

  // Sizes for [UImageButton]
  static const double imageButtonHeight = 168;
  static const double imageButtonWidth = 160;
}
