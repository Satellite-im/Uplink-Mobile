import '../../../core/core_export.dart';

enum UUserProfileSize { topMenuBar, normal, large }

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
