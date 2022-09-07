import 'dart:convert';

import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/utils/services/warp/warp_multipass.dart';

class WarpCurrentUserData {
  WarpCurrentUserData(this._warp);
  final WarpMultipass _warp;

  Future<CurrentUser> createCurrentUser({
    required CurrentUser newUser,
    required String password,
  }) async {
    try {
      String? _imageFileConvertedToBase64;
      if (newUser.profilePicture == null ||
          newUser.profilePicture!.path.isEmpty) {
        _imageFileConvertedToBase64 = '';
      } else {
        final _imageBytes = await newUser.profilePicture!.readAsBytes();
        final _base64Image = base64Encode(_imageBytes);
        _imageFileConvertedToBase64 = _base64Image;
      }

      final _did = await _warp.createUser(
        username: newUser.username,
        password: password,
        messageStatus: newUser.statusMessage ?? '',
        base64Image: _imageFileConvertedToBase64,
      );
      return newUser.copywith(did: _did);
    } catch (error) {
      throw Exception(error);
    }
  }
}
