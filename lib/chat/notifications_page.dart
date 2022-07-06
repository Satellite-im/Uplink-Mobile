import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

import 'chat_index_page/mock_notifications.dart';

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
            uNotificationList: uNotificationListMock,
          ),
        ),
      ),
    );
  }
}
