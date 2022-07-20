import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:uplink/utils/mock/models/models_export.dart';

Future<List<MockNotification>> loadingNotifications() async {
  const hasFriends = true;
  if (hasFriends == true) {
    final jsonString = await rootBundle
        .loadString('lib/utils/mock/data/json/mock_notifications_list.json');
    final list = await jsonDecode(jsonString) as List<dynamic>;
    return list.map(MockNotification.fromJson).toList();
  } else {
    return [];
  }
}
