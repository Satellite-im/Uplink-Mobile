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

  // Button size for [UIconButton]
  static const double buttonSize = 56.0;
  static const double buttonSizeSmall = 40.0;

  // Sizes for [UText]
  static const double textH1TopMenuBarTitleSize = 18.0;
  static const double textH2SecondaryHeaderSize = 14.0;
  static const double textH3TertiaryHeaderSize = 12.0;
  static const double textH4FourthHeaderSize = 12.0;
  static const double textH5FifthHeaderSize = 10.0;
  static const double textB1BodySize = 10.0;
  static const double textB2MediumSize = 10.0;
  static const double textB3ItalicsSize = 10.0;
  static const double textB4BoldSize = 10.0;
  static const double textM1MicroSize = 9.0;
  static const double textBUT1ButtonSize = 10.0;
  static const double textBUT2SecondaryButtonSize = 10.0;

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

  // Sizes for [UPin]
  // Button size(width and height) for pinButton
  static const double pinButtonSize = 60.0;
  // Dot size(width and height) for pin dot
  static const double pinDotSize = 16;

  // Sizes for [URecoverySeedBox]
  static const double recoverySeedBoxWidthSize = 160.0;
  static const double recoverySeedBoxHeightSize = 40.0;
  static const double recoverySeedBoxNumberBoxWidthSize = 14.0;
  static const double recoverySeedBoxNumberBoxHeightSize = 15.0;

  // Sizes for [UDropDownMenu]
  static const double dropDownMenuButtonHeight = 40;
  static const double dropDownMenuItemHeight = 48;
}
