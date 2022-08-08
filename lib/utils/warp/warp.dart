import 'package:warp_dart/warp_dart.dart' as warp;

warp.DID? did;

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
