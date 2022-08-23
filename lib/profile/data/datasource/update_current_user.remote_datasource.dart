import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/utils/services/warp/warp_service.dart';

class UpdateCurrentUserData {
  UpdateCurrentUserData(this._warp);
  final Warp _warp;

  Future<CurrentUser> getCurrentUserInfo() async {
    try {
      final _currentUserInfoMap = _warp.getCurrentUserInfo();
      final _profilePictureFile = await _transformBase64ImageIntoFileImage(
        _currentUserInfoMap['profile_picture'] as String,
        'profile_picture',
      );
      final _bannerPictureFile = await _transformBase64ImageIntoFileImage(
        _currentUserInfoMap['banner_picture'] as String,
        'banner_picture',
      );
      final _currentUser = CurrentUser(
        did: _currentUserInfoMap['did'] as String,
        username: _currentUserInfoMap['username'] as String,
        statusMessage: _currentUserInfoMap['status_message'] as String,
        profilePicture: _profilePictureFile,
        bannerPicture: _bannerPictureFile,
      );
      return _currentUser;
    } catch (error) {
      throw Exception(error);
    }
  }

  String getMessageStatus() {
    try {
      return _warp.getMessageStatus();
    } catch (error) {
      throw Exception(error);
    }
  }

  String getDid() {
    try {
      return _warp.getDid();
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

Future<File> _transformBase64ImageIntoFileImage(
  String _base64Image,
  String _fileName,
) async {
  try {
    if (_base64Image.isEmpty) {
      return File('');
    } else {
      final _imageBytes = base64.decode(_base64Image);
      final _appTempDir = await path_provider.getTemporaryDirectory();
      final _fileToSaveImage = File(
        '${_appTempDir.path}/${_fileName}_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
      return await _fileToSaveImage.writeAsBytes(_imageBytes);
    }
  } catch (error) {
    return File('');
  }
}
