// ignore_for_file: lines_longer_than_80_chars

import 'package:warp_dart/mp_ipfs.dart' as mp_ipfs;
import 'package:warp_dart/multipass.dart' as multipass;
import 'package:warp_dart/warp.dart' as warp;

warp.DID? did;

// TODO(Lucas): Warp is here and the profile pages just for Mock purposes, change these things later
class Warp {
  late multipass.MultiPass? _mpIpfs;

  final store = warp.Tesseract.newStore();

  void createUser({required String username, String messageStatus = ''}) {
    store.unlock('Hello');

    _mpIpfs = mp_ipfs.multipass_ipfs_temporary(store);
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
