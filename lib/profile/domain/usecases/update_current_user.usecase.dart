import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:uplink/profile/data/repositories/update_current_user.repository.dart';

class UpdateCurrentUserUseCase {
  const UpdateCurrentUserUseCase(this._repository);

  final IUpdateCurrentUserRepository _repository;

  String getUsername() {
    final _username = _repository.getUsername();
    return _username;
  }

  String getMessageStatus() {
    final _messageStatus = _repository.getMessageStatus();
    return _messageStatus;
  }

  String modifyMessageStatus({
    required String newMessageStatus,
  }) {
    _repository.modifyMessageStatus(newMessageStatus);
    return getMessageStatus();
  }

  String modifyUsername({
    required String newUsername,
  }) {
    _repository.modifyUsername(newUsername);
    return getUsername();
  }

  Future<File> getProfilePicture() async {
    final _base64Image = _repository.getProfilePicture();
    final _imageBytes = base64.decode(_base64Image);
    final _appTempDir = await path_provider.getTemporaryDirectory();
    final _fileToSaveImage = File(
      '${_appTempDir.path}/profile_picture_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    final _imageFile = await _fileToSaveImage.writeAsBytes(_imageBytes);
    return _imageFile;
  }

  Future<File> modifyProfilePicture({
    required File imageFile,
  }) async {
    if (imageFile.path.isEmpty) {
      _repository.modifyProfilePicture('');
    } else {
      final _imageBytes = await imageFile.readAsBytes();
      final _base64Image = base64Encode(_imageBytes);
      _repository.modifyProfilePicture(_base64Image);
    }

    return getProfilePicture();
  }

  Future<File> getBannerePicture() async {
    final _base64Image = _repository.getBannerPicture();
    final _imageBytes = base64.decode(_base64Image);
    final _appTempDir = await path_provider.getTemporaryDirectory();
    final _fileToSaveImage = File(
      '${_appTempDir.path}/banner_picture_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    final _imageFile = await _fileToSaveImage.writeAsBytes(_imageBytes);
    return _imageFile;
  }

  Future<File> modifyBannerPicture({
    required File imageFile,
  }) async {
    if (imageFile.path.isEmpty) {
      _repository.modifyBannerPicture('');
    } else {
      final _imageBytes = await imageFile.readAsBytes();
      final _base64Image = base64Encode(_imageBytes);
      _repository.modifyBannerPicture(_base64Image);
    }

    return getBannerePicture();
  }
}
