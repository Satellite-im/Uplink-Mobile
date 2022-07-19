import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

import 'u_notification_card.dart';

part 'models/u_friend_request_notification.dart';
part 'models/u_sent_link_notification.dart';

/// For each type of notification,
/// the [UNotificationCard] will be different
enum NotificationType {
  repliedComment,
  message,
  reactedComment,
  friendRequest,
  serverMessage,
}

class UNotification extends StatefulWidget {
  /// Show diffenrent notifications depending on the type
  ///
  /// The return of this class is a [UNotificationCard] for each type of
  /// notification the card is different
  ///
  /// This class is used inside UNotificationList to build
  /// a list of [UNotification]
  ///
  /// Example:
  /// ```dart
  ///  UNotification(
  ///      username: 'Bob',
  ///      notificationType: NotificationType.sentYouALink,
  ///      arrivalNotificationTime: DateTime(2022, 07, 01, 09),
  ///      linkUrl: 'https://www.youtube.com/watch?v=sy4IhE-KAEg',
  ///  ),
  /// ```
  const UNotification({
    Key? key,
    required this.username,
    required this.arrivalNotificationTime,
    this.uImage = const UImage(),
    required this.isUnread,

    /// Just pass a value when [notificationType] is [NotificationType.sentYouALink]
    this.message = '',
    required this.notificationType,
  }) : super(key: key);

  final String username;

  final DateTime arrivalNotificationTime;

  final NotificationType notificationType;

  final String message;

  final UImage uImage;

  final bool isUnread;

  @override
  State<UNotification> createState() => _UNotificationState();
}

class _UNotificationState extends State<UNotification> {
  @override
  Widget build(BuildContext context) {
    switch (widget.notificationType) {
      case NotificationType.reactedComment:
        return UNotificationCard(
          uNotification: widget,
        );
      case NotificationType.message:
        return _USentMessageNotification(
          uNotification: widget,
        );
      case NotificationType.repliedComment:
        return UNotificationCard(
          uNotification: widget,
        );
      case NotificationType.friendRequest:
        return _UFriendRequestNotification(
          uNotification: widget,
        );
      case NotificationType.serverMessage:
        return UNotificationCard(
          uNotification: widget,
        );
    }
  }
}
