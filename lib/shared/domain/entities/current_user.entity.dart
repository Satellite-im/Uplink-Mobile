import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

@immutable
class CurrentUser {
  const CurrentUser({
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
        other.username == username &&
        other.statusMessage == statusMessage &&
        other.status == status &&
        other.imageAddress == imageAddress;
  }

  @override
  int get hashCode => username.hashCode ^ statusMessage.hashCode;
}
