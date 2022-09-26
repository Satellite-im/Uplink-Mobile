part of 'friend_bloc.dart';

@immutable
abstract class FriendState {
  List<Object> get props => [];
}

class FriendInitial extends FriendState {}

class FriendLoadInProgress extends FriendState {}

class FriendLoadSuccess extends FriendState {
  FriendLoadSuccess([this.user]);

  final User? user;

  @override
  List<Object> get props => [];
}

class FriendLoadFailure extends FriendState {
  FriendLoadFailure([this.frienLoadFailureTypes]);

  final FriendLoadFailureTypes? frienLoadFailureTypes;

  @override
  List<Object> get props => [];
}

enum FriendLoadFailureTypes {
  yourselfSentFriendRequest(
    'Error: You cannot send yourself a friend request.',
  ),
  userAlreadyExistAsAFriend('Error: User already exist as a friend.'),
  friendRequestAlreadyExist('Error: Friend request already exist.'),
  noAccountFound('Error: No account found.');

  const FriendLoadFailureTypes(this.errorMessage);
  final String errorMessage;
}

extension FriendLoadFailureTypesX on FriendLoadFailureTypes {
  static FriendLoadFailureTypes fromString(String errorString) {
    if (errorString.contains('You cannot send yourself a friend request')) {
      return FriendLoadFailureTypes.yourselfSentFriendRequest;
    } else if (errorString.contains('User already exist as a friend')) {
      return FriendLoadFailureTypes.userAlreadyExistAsAFriend;
    } else if (errorString.contains('Friend request already exist')) {
      return FriendLoadFailureTypes.friendRequestAlreadyExist;
    }
    return FriendLoadFailureTypes.noAccountFound;
  }
}
