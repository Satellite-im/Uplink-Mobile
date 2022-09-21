import 'package:uplink/contacts/add_friend_page/domain/friend_request_status.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class FriendRequest {
  FriendRequest(
    this.user, {
    required this.friendRequestStatus,
  });

  static Future<FriendRequest> fromMap(
    Map<String, dynamic> friendRequest,
  ) async {
    final _user =
        await User.fromMap(friendRequest['user'] as Map<String, dynamic>);
    const friendRequestStatus = FriendRequestStatus.pending;
    return FriendRequest(_user, friendRequestStatus: friendRequestStatus);
  }

  final User user;
  final FriendRequestStatus friendRequestStatus;
}
