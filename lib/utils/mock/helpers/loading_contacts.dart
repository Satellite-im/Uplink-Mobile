import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:uplink/utils/mock/data/mock_contact.dart';

// TODO(yijing): update loading contacts
Future<List<MockContact>> loadingContacts() async {
  const hasFriends = true;
  if (hasFriends == true) {
    final jsonString = await rootBundle
        .loadString('lib/contacts/models/data/mock_contact_list.json');
    final list = await jsonDecode(jsonString) as List<dynamic>;

    return list.map(MockContact.fromJson).toList();
  } else {
    return [];
  }
}