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

  @override
  Widget build(BuildContext context) {
    switch (_friendRequestState) {
      case _FriendRequestState.requested:
        return Column(
          children: [
            UNotificationCard(
              username: widget.uNotification.username,
              uMessage: UMessage(
                message:
                    ULibraryStrings.uNotificationCard_sentYouAFriendRequest,
                arrivalMessageTime:
                    widget.uNotification.arrivalNotificationTime,
              ),
              uImage: widget.uNotification._uImage,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(52, 8, 0, 0),
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
            )
          ],
        );
      case _FriendRequestState.accepted:
        return Column(
          children: [
            UNotificationCard(
              username: widget.uNotification.username,
              uMessage: UMessage(
                prefixIcon: UIcons.friend_added,
                message: ULibraryStrings.uNotificationCard_youAreNowFriends,
                arrivalMessageTime:
                    widget.uNotification.arrivalNotificationTime,
              ),
              uImage: widget.uNotification._uImage,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(52, 8, 0, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      UButton.filled1(
                        label: ULibraryStrings
                            .uNotificationCard_startAConversation,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      case _FriendRequestState.declined:
        return Column(
          children: [
            UNotificationCard(
              username: widget.uNotification.username,
              uMessage: UMessage(
                prefixIcon: UIcons.remove_friend,
                message:
                    ULibraryStrings.uNotificationCard_youDeclinedAFriendRequest,
                arrivalMessageTime:
                    widget.uNotification.arrivalNotificationTime,
              ),
              uImage: widget.uNotification._uImage,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(52, 8, 0, 0),
              child: Row(
                children: [
                  UButton.filled1(
                    label: ULibraryStrings.uNotificationCard_undo,
                    onPressed: () {
                      setState(() {
                        _friendRequestState = _FriendRequestState.requested;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        );
    }
  }
}
