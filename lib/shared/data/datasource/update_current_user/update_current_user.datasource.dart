import 'package:uplink/utils/services/warp.dart';

class UpdateCurrentUserDataWarp {
  UpdateCurrentUserDataWarp(this._warp);
  final Warp _warp;

  String getMessageStatus() {
    try {
      return _warp.getMessageStatus();
    } catch (error) {
      throw Exception(error);
    }
  }

  String getUsername() {
    try {
      return _warp.getUsername();
    } catch (error) {
      throw Exception(error);
    }
  }

  void modifyMessageStatus(String newMessageStatus) {
    try {
      _warp.changeMessageStatus(newMessageStatus);
    } catch (error) {
      throw Exception(error);
    }
  }

  void modifyUsername(String newUsername) {
    try {
      _warp.changeUsername(newUsername);
    } catch (error) {
      throw Exception(error);
    }
  }
}
