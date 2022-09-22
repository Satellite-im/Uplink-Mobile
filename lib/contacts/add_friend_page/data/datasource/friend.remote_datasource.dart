import 'package:uplink/contacts/add_friend_page/domain/friend_request.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/services/warp/warp_multipass.dart';

class FriendData {
  FriendData(this._warp);
  final WarpMultipass _warp;

  Future<User> findUserByDid(String userDid) async {
    try {
      final _userMap = _warp.findUserByDid(userDid);

      if (_userMap == null) {
        throw Exception('Identity not found');
      }

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

  Future<List<FriendRequest>> listIncomingFriendRequests() async {
    try {
      final _friendRequestList = <FriendRequest>[];
      final _friendRequestsMapList = _warp.listIncomingFriendRequests();
      for (final element in _friendRequestsMapList) {
        final _friendRequest = await FriendRequest.fromMap(element);
        _friendRequestList.add(_friendRequest);
      }
      return _friendRequestList;
    } catch (error) {
      throw Exception(
        ['list_incoming_friend_requests_remote_datasource', error],
      );
    }
  }

  Future<List<FriendRequest>> listOutgoingFriendRequests() async {
    try {
      final _outgoingFriendRequestList = <FriendRequest>[];
      final _outgoingFriendRequestsMapList = _warp.listOutgoingFriendRequests();
      for (final element in _outgoingFriendRequestsMapList) {
        final _friendRequest = await FriendRequest.fromMap(element);
        _outgoingFriendRequestList.add(_friendRequest);
      }
      return _outgoingFriendRequestList;
    } catch (error) {
      throw Exception(
        ['list_outgoing_friend_requests_remote_datasource', error],
      );
    }
  }

  Future<List<User>> listFriends() async {
    try {
      final _friendsUserList = <User>[];
      final _friendsMapList = _warp.listFriends();

      for (final friendMap in _friendsMapList) {
        final _friendUser = await User.fromMap(friendMap);
        _friendsUserList.add(_friendUser);
      }

      return _friendsUserList;
    } catch (error) {
      rethrow;
    }
  }

  void acceptFriendRequest(String userDID) {
    _warp.acceptFriendRequest(userDID);
  }

  void denyFriendRequest(String userDID) {
    _warp.denyFriendRequest(userDID);
  }
}
