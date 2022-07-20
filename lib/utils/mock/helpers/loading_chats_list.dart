import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:uplink/utils/mock/models/mock_contacts_chat.dart';

Future<List<MockContactsChat>> loadingChatsList() async {
  const hasFriends = true;
  if (hasFriends == true) {
    final jsonString = await rootBundle
        .loadString('lib/utils/mock/data/json/mock_chats_list.json');
    final list = await jsonDecode(jsonString) as List<dynamic>;
    return list.map(MockContactsChat.fromJson).toList();
  } else {
    return [];
  }
}
