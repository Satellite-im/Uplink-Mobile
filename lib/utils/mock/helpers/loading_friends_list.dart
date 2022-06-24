import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/utils/mock/models/dto_unread_messages_profile_card.dart';

Future<List<UnreadMessagesUserProfileCard>> loadingFriendsList() async {
  const hasFriends = true;
  if (hasFriends == true) {
    final jsonString = await rootBundle
        .loadString('lib/utils/mock/data/mock_friends_list.json');
    final list = await jsonDecode(jsonString) as List<dynamic>;
    return list.map(UnreadMessagesUserProfileCardMock().fromJson).toList();
  } else {
    return [];
  }
}
