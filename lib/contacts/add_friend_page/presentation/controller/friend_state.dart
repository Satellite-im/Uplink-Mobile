part of 'friend_bloc.dart';

@immutable
abstract class FriendState {
  List<Object> get props => [];
}

class FriendInitial extends FriendState {}

class FriendLoadInProgress extends FriendState {}

class FriendLoadSuccess extends FriendState {
  FriendLoadSuccess(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class FriendLoadFailure extends FriendState {}
