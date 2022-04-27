part of '../u_user_profile_unreads_chat_bubble.dart';

/// Creates an indicator of notifications in [UUserProfileNotification]
class MessagesUnreadsIndicator extends StatelessWidget {
  const MessagesUnreadsIndicator({
    Key? key,
    required int messagesUnreads,
  })  : _messagesUnreads = messagesUnreads,
        _size = USizes.userProfileMessagesUnreadsIndicatorSize,
        super(key: key);

  final double _size;

  final int _messagesUnreads;

  double _getMessagesUnreadsIndicatorSize() {
    if (_messagesUnreads < 10) {
      return 20;
    } else if (_messagesUnreads < 100) {
      return 27;
    } else if (_messagesUnreads < 1000) {
      return 35;
    } else if (_messagesUnreads < 10000) {
      return 42;
    } else {
      return 42;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getMessagesUnreadsIndicatorSize(),
      height: _size,
      decoration: const BoxDecoration(
        color: UColors.ctaBlue,
        borderRadius: BorderRadius.all(
          Radius.circular(
            100,
          ),
        ),
      ),
      child: Center(
        child: UText(
          _messagesUnreads > 9999 ? '9999' : '$_messagesUnreads',
          textStyle: UTextStyle.H2_secondaryHeader,
        ),
      ),
    );
  }
}
