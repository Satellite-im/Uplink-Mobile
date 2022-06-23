import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:uplink/utils/mock/data/mock_contact.dart';

// TODO(yijing): update loading friend requests
Future<List<MockContact>> loadingFriendRequests() async {
  const hasFriends = true;
  if (hasFriends == true) {
    final jsonString = await rootBundle
        .loadString('lib/contacts/models/data/mock_friend_requests.json');
    final list = await jsonDecode(jsonString) as List<dynamic>;

    return list.map(MockContact.fromJson).toList();
  } else {
    return [];
  }
}
