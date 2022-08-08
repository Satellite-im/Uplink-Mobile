// ignore_for_file: lines_longer_than_80_chars

import 'package:warp_dart/warp_dart.dart' as warp;

warp.DID? did;

// TODO(Lucas): Warp is here and the profile pages just for Mock purposes, change these things later
class Warp {
  final multipass = warp.multipassIpfsTemporary(warp.newTesseractInstance());

  void createUser({required String username, String messageStatus = ''}) {
    did = multipass.createIdentity(username, 'about about about');
    multipass.modifyStatus(messageStatus);
  }

  String getUsername() {
    return multipass.getUsername(did!);
  }

  String changeUsername(String newUserName) {
    multipass.modifyName(newUserName);
    return getUsername();
  }

  String changeMessageStatus(String newStatus) {
    multipass.modifyStatus(newStatus);
    return getMessageStatus();
  }

  String getMessageStatus() {
    return multipass.getStatus(did!);
  }
}
