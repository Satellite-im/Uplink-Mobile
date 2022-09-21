import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/services/warp/warp_multipass.dart';

class FriendData {
  FriendData(this._warp);
  final WarpMultipass _warp;

  Future<User> findUserByDid(String userDid) async {
    try {
      final _userMap = _warp.findUserByDid(userDid);

      return await User.fromMap(_userMap);
    } catch (error) {
      rethrow;
    }
  }

  void sendFriendRequest(String userDid) {
    try {
      _warp.sendFriendRequest(userDid);
    } catch (error) {
      rethrow;
    }
  }

  // List<FriendRequest> listIncomingFriendRequests() {
  //   try {
  //     final _friendRequestList = <FriendRequest>[];
  //     final _friendRequestsMapList = _warp.listIncomingFriendRequests();
  //     for (final element in _friendRequestsMapList) {
  //       final _friendRequest = FriendRequest(User.fromJson(element['user'],));
  //     }
  //   } catch (error) {
  //     rethrow;
  //   }
  // }
}
