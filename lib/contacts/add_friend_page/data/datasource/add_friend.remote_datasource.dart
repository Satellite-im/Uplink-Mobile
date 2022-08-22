import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/services/warp/warp_service.dart';

class AddFriendData {
  AddFriendData(this._warp);
  final Warp _warp;

  Future<User> findUserByDid(String userDid) async {
    try {
      final _userMap = _warp.findUserByDid(userDid);
      final _profilePictureFile = await _transformBase64ImageIntoFileImage(
        _userMap['profile_picture'] as String,
        'profile_picture',
      );
      final _bannerPictureFile = await _transformBase64ImageIntoFileImage(
        _userMap['banner_picture'] as String,
        'banner_picture',
      );
      return User(
        did: _userMap['did'] as String,
        username: _userMap['username'] as String,
        statusMessage: _userMap['status_message'] as String,
        profilePicture: _profilePictureFile,
        bannerPicture: _bannerPictureFile,
      );
    } catch (error) {
      rethrow;
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
}
