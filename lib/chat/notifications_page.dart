import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({
    Key? key,
    required this.uNotificationsList,
  }) : super(key: key);

  final List<UNotification> uNotificationsList;

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(
        title: UAppStrings.notifications_appBarTitle,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: UNotificationsList(
            uNotificationList: [
              for (final notification in widget.uNotificationsList)
                UNotification(
                  isUnread: notification.isUnread,
                  username: notification.username,
                  arrivalNotificationTime: notification.arrivalNotificationTime,
                  notificationType: notification.notificationType,
                  message: notification.message,
                  uImage: UImage(
                    imagePath: notification.uImage.imagePath,
                    imageSource: notification.uImage.imageSource,
                    boxDecoration: notification.notificationType ==
                            NotificationType.serverMessage
                        ? const BoxDecoration(
                            color: UColors.foregroundDark,
                          )
                        : null,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
