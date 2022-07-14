import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:uplink/utils/mock/models/models_export.dart';

Future<List<MockNotifications>> loadingNotifications() async {
  const hasFriends = true;
  if (hasFriends == true) {
    final jsonString = await rootBundle
        .loadString('lib/utils/mock/data/mock_notifications_list.json');
    final list = await jsonDecode(jsonString) as List<dynamic>;
    return list.map(MockNotifications.fromJson).toList();
  } else {
    return [];
  }
}
