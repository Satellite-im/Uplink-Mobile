import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:uplink/utils/mock/models/mock_current_user.dart';

Future<MockCurrentUser?> loadingCurrentUser() async {
  const hasFriends = true;
  if (hasFriends == true) {
    final jsonString = await rootBundle
        .loadString('lib/utils/mock/data/json/mock_current_user.json');
    final currentUser = await jsonDecode(jsonString) as Map<String, dynamic>;
    return MockCurrentUser.fromJson(currentUser);
  } else {
    return null;
  }
}
