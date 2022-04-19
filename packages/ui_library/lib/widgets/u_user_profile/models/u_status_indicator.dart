part of '../u_user_profile_status.dart';

/// Defines the status of the [UserProfileStatus]
enum Status {
  online,
  busy,
  offline,
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
    Map<Status, Color> _statusMap = {
      Status.online: const Color.fromRGBO(0, 184, 148, 1),
      Status.busy: const Color.fromRGBO(0, 184, 148, 1),
      Status.offline: const Color.fromRGBO(0, 184, 148, 1),
    };
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _statusMap[_status],
        shape: BoxShape.circle,
      ),
    );
  }
}
