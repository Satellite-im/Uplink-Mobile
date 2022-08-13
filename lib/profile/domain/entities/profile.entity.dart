import 'package:ui_library/ui_library_export.dart';

class CurrentUserProfile {
  CurrentUserProfile({
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
  String username;
  String? statusMessage;
  Status status;
  String? imageAddress;
  String? bannerImageAddress;
  int? badgesNum;
  String? location;
  int? friendNum;
  String? about;

  CurrentUserProfile copywith({
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
      CurrentUserProfile(
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
}
