import '../../../core/core_export.dart';

/// Defines the Avatar Profile Widgets size
///
/// Example:
/// ```dart
///   const UGroupProfile({
///   Key? key,
///   String? imagePath,
/// })  : _imagePath = imagePath,
///       _size = UAvatarProfileSize.normal,
///       super(key: key);
/// ```
enum UAvatarProfileSize {
  /// This size is 40x40 pixels
  normal,

  /// This size is 56x56 pixels
  large
}

extension UAvatarProfileSizeExtension on UAvatarProfileSize {
  double get size {
    switch (this) {
      case UAvatarProfileSize.normal:
        return USizes.avatarProfileNormalSize;
      case UAvatarProfileSize.large:
        return USizes.avatarProfileLargeSize;
      default:
        return USizes.avatarProfileNormalSize;
    }
  }
}
