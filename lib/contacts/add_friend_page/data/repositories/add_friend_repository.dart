// ignore_for_file: one_member_abstracts

import 'package:uplink/shared/domain/entities/user.entity.dart';

abstract class IAddFriendRepository {
  Future<User> findUserByDid(String userDid);
}
