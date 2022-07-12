// ignore_for_file: avoid_dynamic_calls

import 'dart:math';

import 'package:ui_library/ui_library_export.dart';

class MockContactsChat {
  MockContactsChat({
    required this.username,
    required this.status,
    required this.uMessage,
    required this.unreadMessages,
    this.imagePath,
  });

  MockContactsChat.fromJson(dynamic json) {
    username = json['user_name'] as String;
    uMessage = UMessage(
      message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
          'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
          'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla '
          'pariatur. Excepteur sint occaecat cupidatat non proident, sunt in '
          'culpa qui officia deserunt mollit anim id est laborum.',
      arrivalMessageTime:
          DateTime.parse(json['last_message_arrival_time'] as String),
    );
    unreadMessages = json['unread_messages'] as int;
    final _random = 1 + Random().nextInt(8);
    imagePath =
        'packages/ui_library/images/placeholders/user_avatar_$_random.png';

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
  }

  late String username;
  late UMessage uMessage;
  late Status status;
  late int unreadMessages;
  String? imagePath;
}
