part of 'friend_bloc.dart';

@immutable
abstract class FriendEvent {
  List<Object> get props => [];
}

class ResetFriendDataStarted extends FriendEvent {
  ResetFriendDataStarted();

  @override
  List<Object> get props => [];
}

class SearchUserStarted extends FriendEvent {
  SearchUserStarted({required this.userDid});

  final String userDid;

  @override
  List<Object> get props => [userDid];
}

class SendFriendRequestStarted extends FriendEvent {
  SendFriendRequestStarted();

  @override
  List<Object> get props => [];
}

class ListIncomingFriendRequestsStarted extends FriendEvent {
  ListIncomingFriendRequestsStarted();

  @override
  List<Object> get props => [];
}

class ListOutgoingFriendRequestsStarted extends FriendEvent {
  ListOutgoingFriendRequestsStarted();

  @override
  List<Object> get props => [];
}

class FriendRequestAcceptanceStarted extends FriendEvent {
  FriendRequestAcceptanceStarted(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class FriendRequestDenialStarted extends FriendEvent {
  FriendRequestDenialStarted(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class CancelFriendRequestSent extends FriendEvent {
  CancelFriendRequestSent(this.user);

  final User user;

  @override
  List<Object> get props => [];
}

class ListFriendsStarted extends FriendEvent {
  ListFriendsStarted();

  @override
  List<Object> get props => [];
}
