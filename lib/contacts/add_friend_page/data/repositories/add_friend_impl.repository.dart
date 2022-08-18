import 'package:uplink/contacts/add_friend_page/data/datasource/add_friend.remote_datasource.dart';
import 'package:uplink/contacts/add_friend_page/data/repositories/add_friend_repository.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class AddFriendRepositoryImpl implements IAddFriendRepository {
  const AddFriendRepositoryImpl(this._remoteDatasource);

  final AddFriendData _remoteDatasource;
  @override
  Future<User> findUserByDid(String userDid) {
    try {
      return _remoteDatasource.findUserByDid(userDid);
    } catch (error) {
      throw Exception(error);
    }
  }
}
