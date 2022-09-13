part of 'current_user_bloc.dart';

@immutable
abstract class CurrentUserEvent {
  List<Object> get props => [];
}

class GetDid extends CurrentUserEvent {
  @override
  List<Object> get props => [];
}

class GetUsername extends CurrentUserEvent {
  @override
  List<Object> get props => [];
}

class GetMessageStatus extends CurrentUserEvent {
  @override
  List<Object> get props => [];
}

class UpdateUsername extends CurrentUserEvent {
  UpdateUsername({required this.newUsername});

  final String newUsername;

  @override
  List<Object> get props => [newUsername];
}

class UpdateMessageStatus extends CurrentUserEvent {
  UpdateMessageStatus({required this.newMessageStatus});

  final String newMessageStatus;
  @override
  List<Object> get props => [newMessageStatus];
}

class UpdateProfilePicture extends CurrentUserEvent {
  UpdateProfilePicture({required this.profilePicture});

  final File profilePicture;
  @override
  List<Object> get props => [profilePicture];
}

class GetProfilePicture extends CurrentUserEvent {
  @override
  List<Object> get props => [];
}

class UpdateBannerPicture extends CurrentUserEvent {
  UpdateBannerPicture({required this.bannerPicture});

  final File bannerPicture;
  @override
  List<Object> get props => [bannerPicture];
}

class GetBannerPicture extends CurrentUserEvent {
  @override
  List<Object> get props => [];
}

class GetCurrentUserInfo extends CurrentUserEvent {
  GetCurrentUserInfo({this.currentUser});

  final CurrentUser? currentUser;

  @override
  List<Object> get props => [];
}
