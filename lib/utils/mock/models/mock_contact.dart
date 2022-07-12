// ignore_for_file: avoid_dynamic_calls

import 'dart:math';
import 'package:ui_library/ui_library_export.dart';

// for different scenarios in add friends pages
enum Relationship {
  none,
  friend,
  block,
}

///Default relationship = Relationship.none
///Default friendRequestSent = false
class MockContact {
  MockContact({
    required this.name,
    required this.status,
    this.statusMessage,
    this.imageAddress,
    this.bannerImageAddress,
    this.badgesNum,
    this.location,
    this.friendNum,
    this.about,
    Relationship? relationship,
    bool? friendRequestSent,
    bool? isBlocked,
  })  : relationship = relationship ?? Relationship.none,
        friendRequestSent = friendRequestSent ?? false,
        isBlocked = isBlocked ?? false;

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

  MockContact copywith({
    String? name,
    String? statusMessage,
    Status? status,
    String? imageAddress,
    String? bannerImageAddress,
    Relationship? relationship,
    bool? friendRequestSent,
    int? badgesNum,
    String? location,
    int? friendNum,
    String? about,
    bool? isBlocked,
  }) =>
      MockContact(
        name: name ?? this.name,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
        imageAddress: imageAddress ?? this.imageAddress,
        bannerImageAddress: bannerImageAddress ?? this.bannerImageAddress,
        relationship: relationship ?? this.relationship,
        friendRequestSent: friendRequestSent ?? this.friendRequestSent,
        badgesNum: badgesNum ?? this.badgesNum,
        location: location ?? this.location,
        friendNum: friendNum ?? this.friendNum,
        about: about ?? this.about,
        isBlocked: isBlocked ?? this.isBlocked,
      );

  late String name;
  String? statusMessage;
  late Status status;
  String? imageAddress;
  Relationship? relationship;
  bool? friendRequestSent;
  String? bannerImageAddress;
  int? badgesNum;
  String? location;
  int? friendNum;
  String? about;
  bool? isBlocked;
}
