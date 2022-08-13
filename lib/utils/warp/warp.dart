// ignore_for_file: lines_longer_than_80_chars

import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:warp_dart/mp_ipfs.dart' as mp_ipfs;
import 'package:warp_dart/multipass.dart' as multipass;
import 'package:warp_dart/warp.dart' as warp;

warp.DID? did;

// TODO(Lucas): Warp is here and the profile pages just for Mock purposes, change these things later
class Warp {
  late multipass.MultiPass? _mpIpfs;

  warp.Tesseract? tesseract;

  String? tesseractPath;

  void _pathToSaveTesseract() => path_provider
      .getApplicationSupportDirectory()
      .then((value) => tesseractPath = value.path);

  // Create a new store of Tesseractå
  // Unlock Tesseract using pin as passphrase
  // Save a file for Tesseract
  // Set auto save
  void setNewTesseract(int pin) async {
    tesseract = warp.Tesseract.newStore();
    tesseract!.unlock('$pin');
    _pathToSaveTesseract();
    tesseract!.setFile(tesseractPath!);
    tesseract!.setAutosave();
  }

  void verifyIfThereIsATesseract() {
    _pathToSaveTesseract();
    final _tesseract = warp.Tesseract.fromFile(tesseractPath!);
  }

  void createUser({required String username, String messageStatus = ''}) {
    _mpIpfs = mp_ipfs.multipass_ipfs_temporary(tesseract!);
    mp_ipfs.multipass_ipfs_persistent(tesseract!, tesseractPath!);
    did = _mpIpfs!.createIdentity(username, 'secured_phrase');
    final _identityUpdated =
        multipass.IdentityUpdate.setStatusMessage(messageStatus);
    _mpIpfs!.updateIdentity(_identityUpdated);
  }

  String getUsername() {
    return _mpIpfs!.getOwnIdentity().username;
  }

  String changeUsername(String newUserName) {
    multipass.IdentityUpdate.setUsername(newUserName);
    final _identityUpdated = multipass.IdentityUpdate.setUsername(newUserName);
    _mpIpfs!.updateIdentity(_identityUpdated);
    return _mpIpfs!.getOwnIdentity().username;
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
