import 'package:uplink/utils/services/warp/warp_service.dart';

class UpdateCurrentUserData {
  UpdateCurrentUserData(this._warp);
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

  String getProfilePicture() {
    try {
      return _warp.getProfilePicture();
    } catch (error) {
      throw Exception(error);
    }
  }

  String getBannerPicture() {
    try {
      return _warp.getBannerPicture();
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

  void modifyProfilePicture(String base64Image) {
    try {
      _warp.changeProfilePicture(base64Image);
    } catch (error) {
      throw Exception(error);
    }
  }

  void modifyBannerPicture(String base64Image) {
    try {
      _warp.changeBannerPicture(base64Image);
    } catch (error) {
      throw Exception(error);
    }
  }
}
