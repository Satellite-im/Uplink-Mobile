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
    try {
      final _user =
          await User.fromMap(friendRequest['user'] as Map<String, dynamic>);
      final _friendRequestStatus = FriendRequestStatus.values
          .firstWhere((element) => element.name == friendRequest['status']);

      return FriendRequest(
        _user,
        friendRequestStatus: _friendRequestStatus,
      );
    } on Exception catch (error) {
      throw Exception(['FriendRequest_fromMap', error]);
    }
  }

  final User user;
  final FriendRequestStatus friendRequestStatus;
}
