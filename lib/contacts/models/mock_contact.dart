import 'package:ui_library/ui_library_export.dart';

class MockContact {
  MockContact({
    required this.name,
    required this.status,
    this.statusMessage,
  });

  MockContact.fromJson(Map<String, dynamic> json) {
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
  }

  late String name;
  String? statusMessage;
  late Status status;
}
