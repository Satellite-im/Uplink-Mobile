import 'package:flutter/material.dart';
import 'package:ui_library/core/const/const_export.dart';
import 'package:ui_library/widgets/u_user_profile/models/u_user_profile_sizes.dart';

/// Defines the status of the [UserProfileStatus]
enum Status {
  online,
  idle,
  offline,
}

extension StatusColors on Status {
  Color get _color {
    switch (this) {
      case Status.online:
        return UColors.onlineGreen;
      case Status.idle:
        return UColors.idleYellow;
      case Status.offline:
        return UColors.defGrey;
    }
  }
}

/// Used to build the widget that need to receive [Status]
///
/// This calculates the size of the [Status] circle
/// according to the size of the [UserProfileStatus] size
class UStatusIndicator extends StatelessWidget {
  const UStatusIndicator(
    Status status, {
    required UUserProfileSize userProfileSize,
    Key? key,
  })  : _status = status,
        size = userProfileSize == UUserProfileSize.topMenuBar
            ? USizes.userProfileStatusSmallSize
            : USizes.userProfileStatusNormalSize,
        super(key: key);

  final double size;
  final Status _status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _status._color,
        shape: BoxShape.circle,
      ),
    );
  }
}
