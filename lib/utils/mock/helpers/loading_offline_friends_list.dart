import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

// TODO(yijing): update loading Offline Friends List
Future<List<MockContact>> loadingOfflineFriendsList() async {
  const hasFriends = true;
  if (hasFriends == true) {
    final jsonString = await rootBundle
        .loadString('lib/utils/mock/data/json/mock_offline_friends_list.json');
    final list = await jsonDecode(jsonString) as List<dynamic>;

    return list.map(MockContact.fromJson).toList();
  } else {
    return [];
  }
}
