part of '../u_user_profile_status.dart';

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
        return UColors.termRed;
    }
  }
}

/// Used to build the widget that need to receive [Status]
///
/// This calculates the size of the [Status] circle
/// according to the size of the [UserProfileStatus] size
class StatusIndicator extends StatelessWidget {
  const StatusIndicator(
    Status status, {
    required UUserProfileSize userProfileSize,
    Key? key,
  })  : _status = status,
        _size = userProfileSize == UUserProfileSize.topMenuBar
            ? USizes.userProfileStatusSmallSize
            : USizes.userProfileStatusNormalSize,
        super(key: key);

  final double _size;
  final Status _status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _status._color,
        shape: BoxShape.circle,
      ),
    );
  }
}
