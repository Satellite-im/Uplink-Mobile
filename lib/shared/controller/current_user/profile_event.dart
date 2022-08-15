part of 'profile_bloc.dart';

@immutable
abstract class CurrentUserEvent {
  List<Object> get props => [];
}

class GetUsername extends CurrentUserEvent {
  GetUsername({required this.currentUserProfile});

  final CurrentUserProfile currentUserProfile;

  @override
  List<Object> get props => [];
}

class GetMessageStatus extends CurrentUserEvent {
  GetMessageStatus({required this.currentUserProfile});

  final CurrentUserProfile currentUserProfile;

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
