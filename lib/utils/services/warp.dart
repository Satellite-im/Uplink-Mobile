// ignore_for_file: lines_longer_than_80_chars

import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:uplink/shared/controller/warp/warp_bloc.dart';
import 'package:warp_dart/mp_ipfs.dart' as mp_ipfs;
import 'package:warp_dart/multipass.dart' as multipass;
import 'package:warp_dart/warp.dart' as warp;

warp.DID? did;

// TODO(Lucas): Warp is here and the profile pages just for Mock purposes, change these things later
class Warp {
  final _warp = GetIt.I.get<WarpBloc>();

  warp.Tesseract? tesseract;

  String? tesseractPath;

  String? multipassPath;

  late multipass.MultiPass? _mpIpfs;

  Future<void> _pathToSaveTesseract() async {
    final _directory = await path_provider.getApplicationSupportDirectory();
    multipassPath = _directory.path;
    tesseractPath = '${_directory.path}/tesseractUplinkFile';
  }

  // Create a new store of Tesseractå
  // Unlock Tesseract using pin as passphrase
  // Save a file for Tesseract
  // Set auto save
  Future<void> setNewTesseract(int pin) async {
    tesseract = warp.Tesseract.newStore();
    tesseract!.unlock('$pin');
    tesseract!.setFile(tesseractPath!);
    tesseract!.setAutosave();
  }

  Future<bool> verifyIfThereIsATesseract(int pin) async {
    try {
      // TODO(warp): just to do tests and build the arch
      await _pathToSaveTesseract();
      // tesseract = warp.Tesseract.fromFile(tesseractPath!);
      await setNewTesseract(pin);
      // tesseract?.unlock('$pin');
      // tesseract?.setFile(tesseractPath!);
      // tesseract?.setAutosave();
      return false;
    } catch (error) {
      await setNewTesseract(pin);
      return false;
    }
  }

  Future<void> createUser({
    required String username,
    String messageStatus = '',
  }) async {
    try {
      final _isThereATesseract = await verifyIfThereIsATesseract(1234);
      // TODO(warp): just to do tests and build the arch
      // _mpIpfs ??= mp_ipfs.multipass_ipfs_persistent(tesseract!, multipassPath!);
      _mpIpfs = mp_ipfs.multipass_ipfs_temporary(tesseract!);

      if (!_isThereATesseract) {
        did = _warp.multipass.createIdentity(username, 'secured_phrase');
        final _identityUpdated =
            multipass.IdentityUpdate.setStatusMessage(messageStatus);
        _mpIpfs!.updateIdentity(_identityUpdated);
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  String getUsername() {
    try {
      return _mpIpfs!.getOwnIdentity().username;
    } catch (error) {
      throw Exception(error);
    }
  }

  String changeUsername(String newUserName) {
    try {
      multipass.IdentityUpdate.setUsername(newUserName);
      final _identityUpdated =
          multipass.IdentityUpdate.setUsername(newUserName);
      _mpIpfs!.updateIdentity(_identityUpdated);
      return _mpIpfs!.getOwnIdentity().username;
    } catch (error) {
      throw Exception(error);
    }
  }

  String changeMessageStatus(String newStatus) {
    final _identityUpdated =
        multipass.IdentityUpdate.setStatusMessage(newStatus);
    _mpIpfs!.updateIdentity(_identityUpdated);
    return _mpIpfs!.getOwnIdentity().status_message;
  }

  String getMessageStatus() {
    return _mpIpfs!.getOwnIdentity().status_message;
  }
}
