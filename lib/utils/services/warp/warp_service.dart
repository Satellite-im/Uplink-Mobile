// ignore_for_file: lines_longer_than_80_chars

import 'package:get_it/get_it.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:warp_dart/multipass.dart' as multipass;

class Warp {
  final _warp = GetIt.I.get<WarpBloc>();

  Future<String> createUser({
    required String username,
    String messageStatus = '',
    required String password,
  }) async {
    try {
      _warp.currentUserDID =
          _warp.multipass?.createIdentity(username, password);

      final _identityUpdated =
          multipass.IdentityUpdate.setStatusMessage(messageStatus);

      _warp.multipass?.updateIdentity(_identityUpdated);
      return _warp.currentUserDID.toString();
    } catch (error) {
      throw Exception(error);
    }
  }

  String getUsername() {
    try {
      return _warp.multipass!.getOwnIdentity().username;
    } catch (error) {
      throw Exception(error);
    }
  }

  String changeUsername(String newUserName) {
    try {
      multipass.IdentityUpdate.setUsername(newUserName);
      final _identityUpdated =
          multipass.IdentityUpdate.setUsername(newUserName);
      _warp.multipass!.updateIdentity(_identityUpdated);
      return _warp.multipass!.getOwnIdentity().username;
    } catch (error) {
      throw Exception(error);
    }
  }

  String changeMessageStatus(String newStatus) {
    try {
      final _identityUpdated =
          multipass.IdentityUpdate.setStatusMessage(newStatus);
      _warp.multipass!.updateIdentity(_identityUpdated);
      return _warp.multipass!.getOwnIdentity().status_message;
    } catch (error) {
      throw Exception(error);
    }
  }

  String getMessageStatus() {
    try {
      return _warp.multipass!.getOwnIdentity().status_message;
    } catch (error) {
      throw Exception(error);
    }
  }
}
