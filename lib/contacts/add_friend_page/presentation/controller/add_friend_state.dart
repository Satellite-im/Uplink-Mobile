part of 'add_friend_bloc.dart';

@immutable
abstract class AddFriendState {
  List<Object> get props => [];
}

class AddFriendInitial extends AddFriendState {}

class AddFriendLoading extends AddFriendState {}

class AddFriendSuccess extends AddFriendState {
  AddFriendSuccess(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class AddFriendError extends AddFriendState {}
