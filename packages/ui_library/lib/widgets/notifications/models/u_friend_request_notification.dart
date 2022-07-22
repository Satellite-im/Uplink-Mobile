part of '../u_notification.dart';

enum _FriendRequestState { requested, accepted, declined }

class _UFriendRequestNotification extends StatefulWidget {
  /// Specific notification when a friend request arrive
  const _UFriendRequestNotification({
    Key? key,
    required this.uNotification,
  }) : super(key: key);

  final UNotification uNotification;

  @override
  State<_UFriendRequestNotification> createState() =>
      _UFriendRequestNotificationState();
}

class _UFriendRequestNotificationState
    extends State<_UFriendRequestNotification> {
  _FriendRequestState _friendRequestState = _FriendRequestState.requested;

  UNotification _uNotificationForDifferentState(
      _FriendRequestState _friendRequestState) {
    return UNotification(
      isUnread: widget.uNotification.isUnread,
      username: widget.uNotification.username,
      arrivalNotificationTime: widget.uNotification.arrivalNotificationTime,
      notificationType: widget.uNotification.notificationType,
      message: _friendRequestState == _FriendRequestState.requested
          ? ULibraryStrings.uNotificationCard_receivedAFriendRequest
          : _friendRequestState == _FriendRequestState.accepted
              ? ULibraryStrings.uNotificationCard_youAreNowFriends
              : ULibraryStrings.uNotificationCard_youDeclinedAFriendRequest,
      uImage: widget.uNotification.uImage,
    );
  }

  static const _spaceBetweenUpsideAndBottomSide = 8.0;

  @override
  Widget build(BuildContext context) {
    switch (_friendRequestState) {
      case _FriendRequestState.requested:
        return Column(
          children: [
            UNotificationCard(
              uNotification: _uNotificationForDifferentState(
                _FriendRequestState.requested,
              ),
              messagePrefixIcon: UIcons.add_contact_member,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  52, _spaceBetweenUpsideAndBottomSide, 0, 0),
              child: SizedBox(
                height: USizes.uNotificationFriendRequesBottomSideHeightSize -
                    _spaceBetweenUpsideAndBottomSide,
                child: Row(
                  children: [
                    UButton.filled1(
                      label: ULibraryStrings.uNotificationCard_decline,
                      onPressed: () {
                        setState(() {
                          _friendRequestState = _FriendRequestState.declined;
                        });
                      },
                      color: UColors.ctaDark,
                    ),
                    const SizedBox.square(
                      dimension: 8,
                    ),
                    UButton.filled1(
                      label: ULibraryStrings.uNotificationCard_accept,
                      onPressed: () {
                        setState(() {
                          _friendRequestState = _FriendRequestState.accepted;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      case _FriendRequestState.accepted:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UNotificationCard(
              uNotification:
                  _uNotificationForDifferentState(_FriendRequestState.accepted),
              messagePrefixIcon: UIcons.friend_added,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  52, _spaceBetweenUpsideAndBottomSide, 0, 0),
              child: SizedBox(
                height: USizes.uNotificationFriendRequesBottomSideHeightSize -
                    _spaceBetweenUpsideAndBottomSide,
                child: UButton.filled1(
                  label: ULibraryStrings.uNotificationCard_startAConversation,
                  onPressed: () {},
                ),
              ),
            )
          ],
        );
      case _FriendRequestState.declined:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UNotificationCard(
              uNotification:
                  _uNotificationForDifferentState(_FriendRequestState.declined),
              messagePrefixIcon: UIcons.remove_friend,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  52, _spaceBetweenUpsideAndBottomSide, 0, 0),
              child: SizedBox(
                height: USizes.uNotificationFriendRequesBottomSideHeightSize -
                    _spaceBetweenUpsideAndBottomSide,
                child: UButton.filled1(
                  label: ULibraryStrings.uNotificationCard_undo,
                  onPressed: () {
                    setState(() {
                      _friendRequestState = _FriendRequestState.requested;
                    });
                  },
                ),
              ),
            ),
          ],
        );
    }
  }
}
