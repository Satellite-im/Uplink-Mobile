part of '../u_notification.dart';

enum _FriendRequestState { requested, accepted, declined }

class _UFriendRequestNotification extends StatefulWidget {
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
                message: 'Sent you a friend request',
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
                    label: 'Decline',
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
                    label: 'Accept',
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
                message:
                    'You are now friends with ${widget.uNotification.username}! '
                    '\nSay hi 👋',
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
                    label: 'Start a conversation',
                    onPressed: () {},
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
                    'You declined a friend request from ${widget.uNotification.username}',
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
                    label: 'Undo',
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
