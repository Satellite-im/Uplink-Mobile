import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(
        title: 'Notifications',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: UNotificationsList(
            uNotificationList: [
              UNotification(
                username: 'Jack',
                // uImage: ,
                notificationType: NotificationType.reactedYourComment,
                arrivalNotificationTime: DateTime(2022, 06, 29, 21),
              ),
              UNotification(
                username: 'Urma',
                // uImage: ,
                notificationType: NotificationType.repliedYourComment,
                arrivalNotificationTime: DateTime(2022, 06, 29, 10),
              ),
              UNotification(
                username: 'Armstrong',
                // uImage: ,
                notificationType: NotificationType.repliedYourComment,
                arrivalNotificationTime: DateTime(2022, 06, 29, 11),
              ),
              UNotification(
                username: 'Marta',
                // uImage: ,
                notificationType: NotificationType.sentYouAMessage,
                arrivalNotificationTime: DateTime(2022, 06, 28, 09),
              ),
              UNotification(
                username: 'John',
                // uImage: ,
                notificationType: NotificationType.sentYouAMessage,
                arrivalNotificationTime: DateTime(2022, 06, 28, 13),
              ),
              UNotification(
                username: 'Gabriel',
                // uImage: ,
                notificationType: NotificationType.sentYouAMessage,
                arrivalNotificationTime: DateTime(2022, 04, 28, 19),
              ),
              UNotification(
                username: 'Felipe',
                // uImage: ,
                notificationType: NotificationType.sentYouAMessage,
                arrivalNotificationTime: DateTime(2022, 04, 28, 16),
              ),
              UNotification(
                username: 'Jorge',
                // uImage: ,
                notificationType: NotificationType.sentYouAMessage,
                arrivalNotificationTime: DateTime(2021, 12, 27, 22),
              ),
              UNotification(
                username: 'Teodoro',
                // uImage: ,
                notificationType: NotificationType.sentYouALink,
                arrivalNotificationTime: DateTime(2021, 12, 27, 21),
              ),
              UNotification(
                username: 'Bob',
                // uImage: ,
                notificationType: NotificationType.sentYouAFriendRequest,
                arrivalNotificationTime: DateTime(2021, 12, 27, 23),
              ),
              UNotification(
                username: 'Sheyla',
                // uImage: ,
                notificationType: NotificationType.sentYouALink,
                arrivalNotificationTime: DateTime(2021, 12, 27, 07),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
