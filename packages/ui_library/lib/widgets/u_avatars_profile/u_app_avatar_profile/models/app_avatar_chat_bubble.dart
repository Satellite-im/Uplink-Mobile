part of '../u_app_avatar_profile.dart';

class _AppAvatarChatBubble extends StatelessWidget {
  const _AppAvatarChatBubble({
    Key? key,
    required int unreadMessages,
    required UAvatarProfileSize size,
  })  : _unreadMessages = unreadMessages,
        _appAvatarSize = size,
        super(key: key);

  final int _unreadMessages;

  final UAvatarProfileSize _appAvatarSize;

  @override
  Widget build(BuildContext context) {
    final _uClipper = UClipper();
    final _messagesUnreadsIndicator = UnreadMessagesIndicator(
      unreadMessages: _unreadMessages,
    );
    final _correctPositionNotification =
        _appAvatarSize.size - (USizes.unreadMessagesIndicatorSize);
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: ClipPath(
            clipper: _unreadMessages != 0
                ? _uClipper.clipForUnreadMessagesChatBubble(_unreadMessages)
                : null,
            child: SizedBox(
              height: _appAvatarSize.size,
              width: _appAvatarSize.size,
              child: Image.asset(
                'packages/ui_library/images/placeholders/app_avatar.png',
              ),
            ),
          ),
        ),
        if (_unreadMessages > 0)
          Positioned(
            top: _correctPositionNotification,
            right: 0,
            child: _messagesUnreadsIndicator,
          ),
      ],
    );
  }
}
