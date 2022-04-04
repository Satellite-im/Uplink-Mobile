part of 'u_icon.dart';

/// Class used to create standard UIcons.
///
/// See [UIcons] for a number of predefined icons available for
/// ui library applications.
class UIconData extends IconData {
  /// Creates UIcon data.
  ///
  /// Not to be used directly. Instead, consider using one of the predefined icons
  /// like the [UIcons] collection.
  ///
  /// All the parameters are defined in [UIcons]
  const UIconData(
    this.uCodePoint, {
    this.uFontFamily,
    this.uFontPackage,
    this.uMatchTextDirection = false,
  }) : super(
          uCodePoint,
          fontFamily: uFontFamily,
          fontPackage: uFontPackage,
          matchTextDirection: uMatchTextDirection,
        );

  final int uCodePoint;
  final String? uFontFamily;
  final String? uFontPackage;
  final bool uMatchTextDirection;
}
