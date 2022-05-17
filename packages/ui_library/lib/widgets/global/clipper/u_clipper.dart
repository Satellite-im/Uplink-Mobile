import 'package:flutter/material.dart';
import 'package:ui_library/core/const/u_sizes.dart';

part 'unread_messages_chat_bubble_clipper.part.dart';
part 'unread_messages_clipper.part.dart';
part 'user_profile_status_clipper.part.dart';
part 'user_profile_notification_clipper.part.dart';

class UClipper {
  /// This class is used to cut off widgets in spefic format
  ///
  /// Depending on the parameter, it will calculate and cut off the part necessary
  ///
  /// Pass this class as parameter to [ClipPath] clipper property
  ///
  /// Example:
  /// ```dart
  /// ClipPath(
  ///  clipper: UClipper().clipForUnreadMessagesChatBubble(_unreadMessages),
  ///   child: SizedBox(
  ///    height: _size,
  ///    width: _size,
  /// ...
  /// ```
  UClipper();

  _ChatBubbleClipper clipForUnreadMessagesChatBubble(int unreadMessages) =>
      _ChatBubbleClipper(unreadMessages);

  _UnreadMessagesClipper clipForUnreadMessages(int unreadMessages) =>
      _UnreadMessagesClipper(unreadMessages);

  _UserProfileStatusClipper clipForUserProfileWithStatus() =>
      _UserProfileStatusClipper();

  _UserProfileNotificationClipper clipForUserProfileWithNotification() =>
      _UserProfileNotificationClipper();
}
