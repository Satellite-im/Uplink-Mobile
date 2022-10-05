import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/utils/helpers/base_64.dart';

enum Relationship {
  none,
  friend,
  block,
  sentFriendRequest,
  receivedFriendRequest,
}

extension _RelationShipX on Relationship {
  static Relationship fromMap(Map<String, bool> relationshipMap) {
    final _relationshipKey = relationshipMap.keys.firstWhere(
      (key) => relationshipMap[key] == true,
      orElse: () => 'none',
    );
    switch (_relationshipKey) {
      case 'blocked':
        return Relationship.block;
      case 'friends':
        return Relationship.friend;
      case 'receivedFriendRequest':
        return Relationship.receivedFriendRequest;
      case 'sentFriendRequest':
        return Relationship.sentFriendRequest;
      default:
        return Relationship.none;
    }
  }
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
    this.friendNum,
    this.about,
  });

  static Future<User> fromMap(Map<String, dynamic> _userMap) async {
    try {
      final _profilePictureFile =
          await Base64Convert().transformBase64ImageIntoFileImage(
        _userMap['profile_picture'] as String,
        'profile_picture',
      );
      final _bannerPictureFile =
          await Base64Convert().transformBase64ImageIntoFileImage(
        _userMap['banner_picture'] as String,
        'banner_picture',
      );
      final _relationship = _RelationShipX.fromMap(
        _userMap['relationship'] as Map<String, bool>,
      );

      return User(
        did: _userMap['did'] as String,
        username: _userMap['username'] as String,
        statusMessage: _userMap['status_message'] != null
            ? _userMap['status_message'] as String
            : null,
        profilePicture: _profilePictureFile,
        bannerPicture: _bannerPictureFile,
        relationship: _relationship,
      );
    } on Exception catch (error) {
      throw Exception(['User_from_map', error]);
    }
  }

  final String? did;
  final String username;
  final String? statusMessage;
  final Relationship? relationship;
  final Status? status;
  final File? profilePicture;
  final File? bannerPicture;
  final int? badgesNum;
  final String? location;
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
