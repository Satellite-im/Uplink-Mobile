// ignore_for_file: avoid_dynamic_calls

import 'dart:math';

import 'package:ui_library/ui_library_export.dart';

class MockContact {
  MockContact({
    required this.name,
    required this.status,
    this.statusMessage,
    this.imageAddress,
  });

  MockContact.fromJson(dynamic json) {
    name = json['user_name'] as String;

    switch (json['status']) {
      case 'online':
        status = Status.online;
        break;
      case 'idle':
        status = Status.idle;
        break;
      case 'offline':
        status = Status.offline;
        break;
      default:
        status = Status.offline;
    }

    statusMessage = json['status_message'] as String?;

    //get a random local image path
    final _random = 1 + Random().nextInt(8);
    imageAddress =
        'packages/ui_library/images/placeholders/user_avatar_$_random.png';
  }

  late String name;
  String? statusMessage;
  late Status status;
  String? imageAddress;
}
