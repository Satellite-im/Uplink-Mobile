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
  /// Sizes for [UIcon]
  static const double iconSize = 24.0;

  /// Sizes for [UText]
  static const double textTopMenuBarTitleSize = 18.0;
  static const double textPrimaryHeaderSize = 10.0;
  static const double textSecondaryHeaderSize = 12.0;
  static const double textTertiaryHeaderSize = 12.0;
  static const double textFourthHeaderSize = 14.0;
  static const double textBodySize = 10.0;
  static const double textMediumSize = 10.0;
  static const double textItalicsSize = 10.0;
  static const double textBoldSize = 10.0;
  static const double textMicroSize = 9.0;
  static const double textPrimaryButtonSize = 10.0;
  static const double textSecondaryButtonSize = 10.0;
}
