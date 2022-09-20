import 'package:uplink/contacts/add_friend_page/domain/friend_request_status.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class FriendIncomingRequest {
  FriendIncomingRequest(
    this.user, {
    required this.friendRequestStatus,
  });

  final User user;
  final FriendRequestStatus friendRequestStatus;
}
