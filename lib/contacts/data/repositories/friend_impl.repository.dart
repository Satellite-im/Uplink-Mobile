import 'package:uplink/contacts/data/datasource/friend.remote_datasource.dart';
import 'package:uplink/contacts/data/repositories/friend_repository.dart';
import 'package:uplink/contacts/domain/friend_request.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class FriendRepositoryImpl implements IFriendRepository {
  const FriendRepositoryImpl(this._remoteDatasource);

  final FriendData _remoteDatasource;
  @override
  Future<User> findUserByDid(String userDid) async =>
      _remoteDatasource.findUserByDid(userDid);

  @override
  void sendFriendRequest(String userDid) =>
      _remoteDatasource.sendFriendRequest(userDid);

  @override
  Future<List<FriendRequest>> listIncomingFriendRequests() async =>
      _remoteDatasource.listIncomingFriendRequests();

  @override
  Future<List<FriendRequest>> listOutgoingFriendRequests() async =>
      _remoteDatasource.listOutgoingFriendRequests();

  @override
  Future<List<User>> listFriends() async => _remoteDatasource.listFriends();

  @override
  Future<List<User>> listBlockedUsers() async =>
      _remoteDatasource.listBlockedUsers();

  @override
  Stream<String> watchUserStatus(String userDid) =>
      _remoteDatasource.watchUserStatus(userDid);

  @override
  void closeWatchUserStatusStream() =>
      _remoteDatasource.closeWatchUserStatusStream();

  @override
  void acceptFriendRequest(String userDID) {
    _remoteDatasource.acceptFriendRequest(userDID);
  }

  @override
  void denyFriendRequest(String userDID) {
    _remoteDatasource.denyFriendRequest(userDID);
  }

  @override
  void cancelFriendRequestSent(String userDID) {
    _remoteDatasource.cancelFriendRequestSent(userDID);
  }

  @override
  void blockUser(String userDID) {
    _remoteDatasource.blockUser(userDID);
  }

  @override
  void unblockUser(String userDID) {
    _remoteDatasource.unblockUser(userDID);
  }

  @override
  void removeFriend(String userDID) {
    _remoteDatasource.removeFriend(userDID);
  }
}
