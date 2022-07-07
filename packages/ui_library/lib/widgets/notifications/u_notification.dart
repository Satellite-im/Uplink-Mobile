import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

import 'u_notification_card.dart';

part 'models/u_friend_request_notification.dart';
part 'models/u_sent_link_notification.dart';

/// For each type of notification,
/// the [UNotificationCard] will be different
enum NotificationType {
  repliedYourComment,
  sentYouAMessage,
  reactedYourComment,
  sentYouAFriendRequest,
  serverUpdate,
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
    UImage? uImage,
    this.unreadNotification = true,

    /// Just pass a value when [notificationType] is [NotificationType.sentYouALink]
    this.message = '',
    required this.notificationType,
  })  : _uImage = uImage ?? const UImage(),
        super(key: key);

  final String username;

  final DateTime arrivalNotificationTime;

  final NotificationType notificationType;

  /// Just pass a value when [notificationType] is [NotificationType.sentYouALink]
  final String message;

  final UImage _uImage;

  final bool? unreadNotification;

  @override
  State<UNotification> createState() => _UNotificationState();
}

class _UNotificationState extends State<UNotification> {
  @override
  Widget build(BuildContext context) {
    switch (widget.notificationType) {
      case NotificationType.reactedYourComment:
        return UNotificationCard(
          username: widget.username,
          uMessage: UMessage(
            message: ULibraryStrings.uNotification_reactedToYOurComment,
            arrivalMessageTime: widget.arrivalNotificationTime,
          ),
          hasUnreadNotifications: false,
          uImage: widget._uImage,
        );
      case NotificationType.sentYouAMessage:
        return _USentMessagekNotification(
          uNotification: widget,
          message: widget.message,
        );
      case NotificationType.repliedYourComment:
        return UNotificationCard(
          username: widget.username,
          uMessage: UMessage(
            message: ULibraryStrings.uNotification_repliedToYourComment,
            arrivalMessageTime: widget.arrivalNotificationTime,
          ),
          uImage: widget._uImage,
        );
      case NotificationType.sentYouAFriendRequest:
        return _UFriendRequestNotification(
          uNotification: widget,
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
