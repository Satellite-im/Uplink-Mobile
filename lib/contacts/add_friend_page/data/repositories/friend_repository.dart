import 'package:uplink/contacts/add_friend_page/domain/friend_request.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

abstract class IFriendRepository {
  Future<User> findUserByDid(String userDid);

  void sendFriendRequest(String userDid);

  Future<List<FriendRequest>> listIncomingFriendRequests();
}
