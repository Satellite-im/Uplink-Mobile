import 'package:uplink/contacts/add_friend_page/data/datasource/friend.remote_datasource.dart';
import 'package:uplink/contacts/add_friend_page/data/repositories/friend_repository.dart';
import 'package:uplink/contacts/add_friend_page/domain/friend_request.dart';
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
}
