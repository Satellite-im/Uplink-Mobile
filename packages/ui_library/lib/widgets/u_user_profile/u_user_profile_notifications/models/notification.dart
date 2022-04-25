part of '../u_user_profile_notification.dart';

/// Creates an indicator of notifications in [UUserProfileNotification]
class NotificationIndicator extends StatelessWidget {
  const NotificationIndicator({
    Key? key,
  })  : _size = USizes.userProfileStatusSmallSize,
        super(key: key);

  final double _size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: const BoxDecoration(
        color: UColors.ctaBlue,
        shape: BoxShape.circle,
      ),
    );
  }
}
