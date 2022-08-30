// ignore_for_file: lines_longer_than_80_chars

import 'package:get_it/get_it.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:warp_dart/multipass.dart' as multipass;
import 'package:warp_dart/warp.dart';

class Warp {
  final _warp = GetIt.I.get<WarpBloc>();

  Future<String> createUser({
    required String username,
    required String messageStatus,
    required String password,
    required String base64Image,
  }) async {
    try {
      _warp.currentUserDID =
          _warp.multipass?.createIdentity(username.trim(), password);
      changeMessageStatus(messageStatus);
      changeProfilePicture(base64Image);
      return _warp.currentUserDID.toString().replaceAll('did:key:', '');
    } catch (error) {
      throw Exception(error);
    }
  }

  Map<String, dynamic> getCurrentUserInfo() {
    try {
      final _currentUserIdentity = _warp.multipass!.getOwnIdentity();
      final _currentUserMap = {
        'did':
            _currentUserIdentity.did_key.toString().replaceAll('did:key:', ''),
        'username': _currentUserIdentity.username,
        'status_message': _currentUserIdentity.status_message,
        'profile_picture': _currentUserIdentity.graphics.profile_picture,
        'banner_picture': _currentUserIdentity.graphics.profile_banner,
      };
      return _currentUserMap;
    } catch (error) {
      throw Exception(error);
    }
  }

  String getDid() {
    try {
      final _did = _warp.multipass!.getOwnIdentity().did_key.toString();
      return _did.replaceAll('did:key:', '');
    } catch (error) {
      throw Exception(error);
    }
  }

  String getUsername() {
    try {
      final _username = _warp.multipass!.getOwnIdentity().username;
      return _username;
    } catch (error) {
      throw Exception(error);
    }
  }

  String getMessageStatus() {
    try {
      return _warp.multipass!.getOwnIdentity().status_message!;
    } catch (error) {
      throw Exception(error);
    }
  }

  String changeUsername(String newUserName) {
    try {
      final _identityUpdated =
          multipass.IdentityUpdate.setUsername(newUserName.trim());
      _warp.multipass!.updateIdentity(_identityUpdated);
      return getUsername();
    } catch (error) {
      throw Exception(error);
    }
  }

  String changeMessageStatus(String newStatus) {
    try {
      final _identityUpdated =
          multipass.IdentityUpdate.setStatusMessage(newStatus.trim());

      _warp.multipass!.updateIdentity(_identityUpdated);
      return getMessageStatus();
    } catch (error) {
      throw Exception(error);
    }
  }

  String getProfilePicture() {
    try {
      final _profilePictureBase64String =
          _warp.multipass!.getOwnIdentity().graphics.profile_picture;
      return _profilePictureBase64String;
    } catch (error) {
      throw Exception(error);
    }
  }

  String changeProfilePicture(String _base64Image) {
    try {
      final _identityUpdated =
          multipass.IdentityUpdate.setPicture(_base64Image);
      _warp.multipass!.updateIdentity(_identityUpdated);
      return getProfilePicture();
    } catch (error) {
      throw Exception(error);
    }
  }

  String getBannerPicture() {
    try {
      final _bannerPictureBase64String =
          _warp.multipass!.getOwnIdentity().graphics.profile_banner;
      return _bannerPictureBase64String;
    } on WarpException {
      throw Exception(['WARP_EXCEPTION', 'get_banner_picture']);
    } catch (error) {
      throw Exception(error);
    }
  }

  String changeBannerPicture(String _base64Image) {
    try {
      final _identityUpdated = multipass.IdentityUpdate.setBanner(_base64Image);
      _warp.multipass!.updateIdentity(_identityUpdated);
      return getBannerPicture();
    } on WarpException {
      throw Exception(['WARP_EXCEPTION', 'update_banner_picture']);
    } catch (error) {
      throw Exception(error);
    }
  }

  Map<String, dynamic> findUserByDid(String _userDid) {
    try {
      final _userIdentity = _warp.multipass!.getIdentityByDID(
        'did:key:$_userDid',
      );
      final _userMap = {
        'did': _userIdentity.did_key.toString().replaceAll('did:key:', ''),
        'username': _userIdentity.username,
        'status_message': _userIdentity.status_message,
        'profile_picture': _userIdentity.graphics.profile_picture,
        'banner_picture': _userIdentity.graphics.profile_banner,
      };
      return _userMap;
    } on WarpException catch (error) {
      throw Exception([
        'WARP_EXCEPTION',
        'find_user_by_did',
        error.error_type,
        error.error_message
      ]);
    } catch (error) {
      throw Exception(['find_user_by_did', error]);
    }
  }
}
