import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

@immutable
class CurrentUser {
  const CurrentUser({
    required this.did,
    required this.username,
    this.status = Status.offline,
    this.statusMessage,
    this.profilePicture,
    this.bannerPicture,
    this.badgesNum,
    this.location,
    this.friendNum,
    this.about,
  });

  const CurrentUser.newUser({
    required this.username,
    this.profilePicture,
    this.statusMessage,
  })  : did = null,
        bannerPicture = null,
        status = Status.online,
        badgesNum = null,
        location = null,
        friendNum = null,
        about = null;

  final String? did;
  final String username;
  final String? statusMessage;
  final Status status;
  final File? profilePicture;
  final File? bannerPicture;
  final int? badgesNum;
  final String? location;
  final int? friendNum;
  final String? about;

  CurrentUser copywith({
    String? did,
    String? username,
    String? statusMessage,
    Status? status,
    File? profilePicture,
    File? bannerPicture,
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
        profilePicture: profilePicture ?? this.profilePicture,
        bannerPicture: bannerPicture ?? this.bannerPicture,
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
