import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

enum Relationship {
  none,
  friend,
  block,
}

@immutable
class User {
  const User({
    this.did,
    required this.username,
    this.status,
    this.statusMessage,
    this.relationship,
    this.profilePicture,
    this.bannerPicture,
    this.badgesNum,
    this.location,
    this.friendRequestSent = false,
    this.isBlocked = false,
    this.friendNum,
    this.about,
  });

  final String? did;
  final String username;
  final String? statusMessage;
  final Relationship? relationship;
  final Status? status;
  final File? profilePicture;
  final File? bannerPicture;
  final int? badgesNum;
  final String? location;
  final bool friendRequestSent;
  final bool isBlocked;
  final int? friendNum;
  final String? about;

  User copywith({
    String? did,
    String? username,
    String? statusMessage,
    Relationship? relationship,
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
      User(
        did: did ?? this.did,
        username: username ?? this.username,
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
        profilePicture: profilePicture ?? this.profilePicture,
        bannerPicture: bannerPicture ?? this.bannerPicture,
        badgesNum: badgesNum ?? this.badgesNum,
        location: location ?? this.location,
        relationship: relationship ?? this.relationship,
        friendNum: friendNum ?? this.friendNum,
        isBlocked: isBlocked ?? this.isBlocked,
        friendRequestSent: friendRequestSent ?? this.friendRequestSent,
        about: about ?? this.about,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.did == did && other.username == username;
  }

  @override
  int get hashCode => did.hashCode ^ username.hashCode;
}
