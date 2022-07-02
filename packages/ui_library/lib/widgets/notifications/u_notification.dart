import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

import 'u_notification_card.dart';

part 'models/u_friend_request_notification.dart';
part 'models/u_sent_link_notification.dart';

enum NotificationType {
  repliedYourComment,
  sentYouAMessage,
  reactedYourComment,
  sentYouAFriendRequest,
  sentYouALink,
  serverUpdate,
}

class UNotification extends StatefulWidget {
  const UNotification({
    Key? key,
    required this.username,
    required this.arrivalNotificationTime,
    UImage? uImage,

    /// Just pass a value when [notificationType] is [NotificationType.sentYouALink]
    String? linkUrl,
    required NotificationType notificationType,
  })  : _notificationType = notificationType,
        _linkUrl = linkUrl ?? '',
        _uImage = uImage ?? const UImage(),
        super(key: key);

  final String username;

  final DateTime arrivalNotificationTime;

  final NotificationType _notificationType;

  /// Just pass a value when [notificationType] is [NotificationType.sentYouALink]
  final String _linkUrl;

  final UImage _uImage;

  @override
  State<UNotification> createState() => _UNotificationState();
}

class _UNotificationState extends State<UNotification> {
  @override
  Widget build(BuildContext context) {
    switch (widget._notificationType) {
      case NotificationType.reactedYourComment:
        return UNotificationCard(
          username: widget.username,
          uMessage: UMessage(
            message: 'Reacted to your comment',
            arrivalMessageTime: widget.arrivalNotificationTime,
          ),
          hasUnreadNotifications: false,
          uImage: widget._uImage,
        );
      case NotificationType.sentYouAMessage:
        return UNotificationCard(
          username: widget.username,
          hasUnreadNotifications: false,
          uMessage: UMessage(
            message: 'Sent you a message',
            arrivalMessageTime: widget.arrivalNotificationTime,
          ),
          uImage: widget._uImage,
        );
      case NotificationType.repliedYourComment:
        return UNotificationCard(
          username: widget.username,
          uMessage: UMessage(
            message: 'Reacted to your comment',
            arrivalMessageTime: widget.arrivalNotificationTime,
          ),
          uImage: widget._uImage,
        );
      case NotificationType.sentYouAFriendRequest:
        return _UFriendRequestNotification(
          uNotification: widget,
        );
      case NotificationType.sentYouALink:
        return _USentLinkNotification(
          uNotification: widget,
          linkUrl: widget._linkUrl,
        );
      case NotificationType.serverUpdate:
        return UNotificationCard(
          username: widget.username,
          uMessage: UMessage(
            message: 'Update Message',
            arrivalMessageTime: widget.arrivalNotificationTime,
          ),
          uImage: widget._uImage,
        );
    }
  }
}
