import 'dart:io';

import 'package:ui_library/ui_library_export.dart';

enum Relationship {
  none,
  friend,
  block,
}

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
}
