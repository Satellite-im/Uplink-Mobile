// ignore_for_file: avoid_dynamic_calls

import 'dart:math';

import 'package:ui_library/ui_library_export.dart';

class MockNotifications {
  MockNotifications({
    required this.username,
    required this.message,
    required this.isUnread,
    required this.notificationType,
    required this.arrivalNotificationTime,
    this.imagePath,
  });

  MockNotifications.fromJson(dynamic json) {
    username = json['user_name'] as String;

    isUnread = json['is_unread'] as bool;
    arrivalNotificationTime =
        DateTime.parse(json['notification_arrival_time'] as String);

    final _random = 1 + Random().nextInt(8);

    switch (json['notification_type']) {
      case 'server_message':
        notificationType = NotificationType.serverMessage;
        message = json['message'] != null ? json['message'] as String : '';
        break;
      case 'message':
        notificationType = NotificationType.message;
        message = json['message'] != null ? json['message'] as String : '';
        break;
      case 'friend_request':
        notificationType = NotificationType.friendRequest;
        message = ULibraryStrings.uNotificationCard_sentYouAFriendRequest;
        break;
      case 'replied_comment':
        notificationType = NotificationType.repliedComment;
        message = ULibraryStrings.uNotification_repliedToYourComment;
        break;
      case 'reacted_comment':
        notificationType = NotificationType.reactedComment;
        message = ULibraryStrings.uNotification_reactedToYourComment;
        break;
    }

    imagePath = json['notification_type'] == 'server_message'
        ? 'packages/ui_library/images/placeholders/uplink_logo.png'
        : 'packages/ui_library/images/placeholders/user_avatar_$_random.png';
  }

  late String username;
  late String? message;
  late DateTime arrivalNotificationTime;
  late bool isUnread;
  late NotificationType notificationType;
  String? imagePath;
}
