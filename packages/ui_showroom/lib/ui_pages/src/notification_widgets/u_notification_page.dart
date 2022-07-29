import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

List<Widget> uFolderButtonList2 = const [];

class UNotificationsPage extends StatelessWidget {
  const UNotificationsPage({Key? key}) : super(key: key);
  static const routeName = '/UNotifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UColors.backgroundDark,
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: UNotificationsList(
            uNotificationList: [
              UNotification(
                isUnread: true,
                username: 'Brucie',
                arrivalNotificationTime: DateTime.now(),
                notificationType: NotificationType.message,
                message: 'Hey Mate',
                uImage: const UImage(
                  imagePath:
                      'packages/ui_library/images/placeholders/user_avatar_1.png',
                  imageSource: ImageSource.local,
                  boxDecoration: null,
                ),
              ),
              UNotification(
                isUnread: true,
                username: 'Server',
                arrivalNotificationTime: DateTime.now().subtract(
                  const Duration(seconds: 50),
                ),
                notificationType: NotificationType.serverMessage,
                message: 'New update available',
                uImage: const UImage(
                  imagePath:
                      'packages/ui_library/images/placeholders/satellite_logo_notification.png',
                  imageSource: ImageSource.local,
                  boxDecoration: BoxDecoration(
                    color: UColors.foregroundDark,
                  ),
                ),
              ),
              UNotification(
                isUnread: true,
                username: 'John',
                arrivalNotificationTime: DateTime.now().subtract(
                  const Duration(days: 1),
                ),
                notificationType: NotificationType.friendRequest,
                uImage: const UImage(
                  imagePath:
                      'packages/ui_library/images/placeholders/user_avatar_2.png',
                  imageSource: ImageSource.local,
                  boxDecoration: null,
                ),
              ),
              UNotification(
                isUnread: true,
                username: 'Jorge',
                arrivalNotificationTime: DateTime.now().subtract(
                  const Duration(days: 2),
                ),
                notificationType: NotificationType.reactedComment,
                uImage: const UImage(
                  imagePath:
                      'packages/ui_library/images/placeholders/user_avatar_3.png',
                  imageSource: ImageSource.local,
                  boxDecoration: null,
                ),
              ),
              UNotification(
                isUnread: true,
                username: 'Jessica',
                arrivalNotificationTime: DateTime.now().subtract(
                  const Duration(days: 2),
                ),
                notificationType: NotificationType.repliedComment,
                uImage: const UImage(
                  imagePath:
                      'packages/ui_library/images/placeholders/user_avatar_4.png',
                  imageSource: ImageSource.local,
                  boxDecoration: null,
                ),
              ),
              UNotification(
                isUnread: true,
                username: 'Barbara',
                arrivalNotificationTime: DateTime.now().subtract(
                  const Duration(days: 3),
                ),
                notificationType: NotificationType.link,
                message: 'https://exercism.org/',
                uImage: const UImage(
                  imagePath:
                      'packages/ui_library/images/placeholders/user_avatar_5.png',
                  imageSource: ImageSource.local,
                  boxDecoration: null,
                ),
              ),
              UNotification(
                isUnread: true,
                username: 'Gabriel',
                arrivalNotificationTime: DateTime.now().subtract(
                  const Duration(days: 4),
                ),
                notificationType: NotificationType.link,
                message: 'https://www.youtube.com/watch?v=AGtfOacKL1c',
                uImage: const UImage(
                  imagePath:
                      'packages/ui_library/images/placeholders/user_avatar_6.png',
                  imageSource: ImageSource.local,
                  boxDecoration: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
