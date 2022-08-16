part of 'update_current_user_bloc.dart';

@immutable
abstract class UpdateCurrentUserEvent {
  List<Object> get props => [];
}

class GetUsername extends UpdateCurrentUserEvent {
  @override
  List<Object> get props => [];
}

class GetMessageStatus extends UpdateCurrentUserEvent {
  @override
  List<Object> get props => [];
}

class UpdateUsername extends UpdateCurrentUserEvent {
  UpdateUsername({required this.newUsername});

  final String newUsername;

  @override
  List<Object> get props => [newUsername];
}

class UpdateMessageStatus extends UpdateCurrentUserEvent {
  UpdateMessageStatus({required this.newMessageStatus});

  final String newMessageStatus;
  @override
  List<Object> get props => [newMessageStatus];
}