import 'package:uplink/contacts/domain/friend_request.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

abstract class IFriendRepository {
  Future<User> findUserByDid(String userDid);

  void sendFriendRequest(String userDid);

  Future<List<FriendRequest>> listIncomingFriendRequests();

  Future<List<FriendRequest>> listOutgoingFriendRequests();

  Future<List<User>> listFriends();

  Future<List<User>> listBlockedUsers();

  Stream<String> watchUserStatus(String userDid);

  void closeWatchUserStatusStream();

  void acceptFriendRequest(String userDID);

  void denyFriendRequest(String userDID);

  void cancelFriendRequestSent(String userDID);

  void blockUser(String userDID);

  void unblockUser(String userDID);

  void removeFriend(String userDID);
}
