import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

@immutable
class CurrentUser {
  const CurrentUser({
    required this.did,
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

  const CurrentUser.newUser({
    required this.username,
    this.imageAddress,
    this.statusMessage,
  })  : did = null,
        bannerImageAddress = null,
        status = Status.online,
        badgesNum = null,
        location = null,
        friendNum = null,
        about = null;

  final String? did;
  final String username;
  final String? statusMessage;
  final Status status;
  final String? imageAddress;
  final String? bannerImageAddress;
  final int? badgesNum;
  final String? location;
  final int? friendNum;
  final String? about;

  CurrentUser copywith({
    String? did,
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
      CurrentUser(
        did: did ?? this.did,
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrentUser &&
        other.did == did &&
        other.username == username;
  }

  @override
  int get hashCode => did.hashCode ^ username.hashCode;
}
