import 'package:uplink/shared/domain/entities/user.entity.dart';

abstract class IAddFriendRepository {
  Future<User> findUserByDid(String userDid);
}
