import '../../../core/core_export.dart';

/// Defines the User Profile Widgets size
///
/// Example:
/// ```dart
/// UserProfileWithStatus(
///   status: Status.online,
///   userProfileSize: UUserProfileSize.large,
/// ),
/// ```
enum UUserProfileSize {
  /// This size is 30x30 pixels
  topMenuBar,

  /// This size is 40x40 pixels
  normal,

  /// This size is 56x56 pixels
  large
}

extension UUserProfileSizeExtension on UUserProfileSize {
  double get size {
    switch (this) {
      case UUserProfileSize.normal:
        return USizes.userProfileNormalSize;
      case UUserProfileSize.large:
        return USizes.userProfileLargeSize;
      case UUserProfileSize.topMenuBar:
        return USizes.userProfileTopMenuBarSize;
      default:
        return USizes.userProfileStatusNormalSize;
    }
  }
}
