part of 'friend_bloc.dart';

@immutable
abstract class FriendEvent {
  List<Object> get props => [];
}

class SearchUserStarted extends FriendEvent {
  SearchUserStarted({required this.userDid});

  final String userDid;

  @override
  List<Object> get props => [userDid];
}
