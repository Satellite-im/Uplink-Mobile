// ignore_for_file: avoid_dynamic_calls

import 'package:ui_library/ui_library_export.dart';

class MockCurrentUser {
  MockCurrentUser({
    required this.username,
    required this.status,
    this.statusMessage,
    this.imageAddress,
    this.bannerImageAddress,
    this.badgesNum,
    this.location,
    this.friendNum,
    this.about,
  });

  MockCurrentUser.fromJson(Map<String, dynamic> json) {
    username = json['user_name'] as String;

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

    badgesNum = json['badgesNum'] as int;

    friendNum = json['friendNum'] as int;

    location = json['location'] as String;

    about = json['about'] as String;

    bannerImageAddress = json['banner_image_address'] as String;

    statusMessage = json['status_message'] as String?;

    imageAddress = json['image_address'] as String;
  }

  MockCurrentUser copywith({
    String? username,
    String? statusMessage,
    Status? status,
    String? imageAddress,
    String? bannerImageAddress,
    bool? friendRequestSent,
    int? badgesNum,
    String? location,
    int? friendNum,
    String? about,
    bool? isBlocked,
  }) =>
      MockCurrentUser(
        username: username ?? this.username,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
        imageAddress: imageAddress ?? this.imageAddress,
        bannerImageAddress: bannerImageAddress ?? this.bannerImageAddress,
        badgesNum: badgesNum ?? this.badgesNum,
        location: location ?? this.location,
        friendNum: friendNum ?? this.friendNum,
        about: about ?? this.about,
      );

  late String username;
  String? statusMessage;
  late Status status;
  String? imageAddress;
  String? bannerImageAddress;
  int? badgesNum;
  String? location;
  int? friendNum;
  String? about;
}
