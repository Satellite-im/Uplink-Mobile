// TODO(yijing): update loading Online Friends List
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:uplink/utils/mock/models/models_export.dart';

Future<List<MockPhoto>> loadingPhotos() async {
  const hasPhotos = true;
  if (hasPhotos == true) {
    try {
      final jsonString = await rootBundle
          .loadString('lib/utils/mock/data/json/mock_photos_list.json');
      final nameList = await jsonDecode(jsonString) as List<dynamic>;
      return nameList.map(MockPhoto.fromJson).toList();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
  return [];
}
