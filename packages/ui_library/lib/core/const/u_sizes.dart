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
  static const double textH5TopMenuBarTitleSize = 18.0;
  static const double textH1PrimaryHeaderSize = 10.0;
  static const double textH2SecondaryHeaderSize = 12.0;
  static const double textH3TertiaryHeaderSize = 12.0;
  static const double textH4FourthHeaderSize = 14.0;
  static const double textB1BodySize = 10.0;
  static const double textB2MediumSize = 10.0;
  static const double textB3ItalicsSize = 10.0;
  static const double textB4BoldSize = 10.0;
  static const double textM1MicroSize = 9.0;
  static const double textBUT1ButtonSize = 10.0;
  static const double textBUT2SecondaryButtonSize = 10.0;

  // Sizes for [UUserProfile]
  static const double userProfileTopMenuBarSize = 30.0;
  static const double userProfileNormalSize = 40.0;
  static const double userProfileLargeSize = 56.0;
  static const double userProfileStatusSmallSize = 8.0;
  static const double userProfileStatusNormalSize = 12.0;
  static const double userProfileNormalMaxUsernameTextSize = 72.0;
}
