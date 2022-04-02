part of 'u_icon.dart';

class UIconData extends IconData {
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
