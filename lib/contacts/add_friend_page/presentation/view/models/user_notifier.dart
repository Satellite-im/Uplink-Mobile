import 'package:flutter/material.dart';
import 'package:uplink/utils/mock/data/data_export.dart';
import 'package:uplink/utils/mock/models/models_export.dart';

class UserNotifier extends ChangeNotifier {
  UserNotifier(this.user);
  MockContact user;

  void sentFriendRequest() {
    user = userWithFriendRequest;
    notifyListeners();
  }

  void undoFriendRequest() {
    user = userWithoutFriendRequest;
    notifyListeners();
  }

  void removeFriend() {
    user = userWithoutFriendRequest;
    notifyListeners();
  }

  void unblockFriend() {
    user.relationship = Relationship.none;
    notifyListeners();
  }

  void blockFriend() {
    user.relationship = Relationship.block;
    notifyListeners();
  }
}
