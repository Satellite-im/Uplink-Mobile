part of '../u_user_profile_unreads.dart';

/// Creates an indicator of notifications in [UUserProfileNotification]
class MessagesUnreadsIndicator extends StatelessWidget {
  const MessagesUnreadsIndicator({
    Key? key,
    required int messagesUnreads,
  })  : _messagesUnreads = messagesUnreads,
        _size = USizes.userProfileMessagesUnreadsIndicator,
        super(key: key);

  final double _size;

  final int _messagesUnreads;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      decoration: const BoxDecoration(
        color: UColors.ctaBlue,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: UText(
          '$_messagesUnreads',
          textStyle: UTextStyle.H2_secondaryHeader,
        ),
      ),
    );
  }
}
