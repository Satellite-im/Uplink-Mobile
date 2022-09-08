import 'package:uplink/contacts/add_friend_page/data/datasource/friend.remote_datasource.dart';
import 'package:uplink/contacts/add_friend_page/data/repositories/friend_repository.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class FriendRepositoryImpl implements IFriendRepository {
  const FriendRepositoryImpl(this._remoteDatasource);

  final FriendData _remoteDatasource;
  @override
  Future<User> findUserByDid(String userDid) {
    try {
      return _remoteDatasource.findUserByDid(userDid);
    } catch (error) {
      rethrow;
    }
  }
}
