part of 'add_friend_bloc.dart';

@immutable
abstract class AddFriendEvent {
  List<Object> get props => [];
}

class SearchUser extends AddFriendEvent {
  SearchUser({required this.userDid});

  final String userDid;

  @override
  List<Object> get props => [userDid];
}
