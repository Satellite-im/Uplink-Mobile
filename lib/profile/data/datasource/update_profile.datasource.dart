import 'package:uplink/profile/data/repositories/update_profile.repository.dart';
import 'package:uplink/profile/domain/entities/profile.entity.dart';
import 'package:uplink/utils/warp/warp.dart';

class UpdateProfileData implements IUpdateProfileRepository {
  final Warp _warp = Warp();

  void _enableWarp() {
    _warp.store.unlock('Hello');
    _warp._mpIpfs = _warp.mp_ipfs.multipass_ipfs_temporary(store);
  }

  @override
  Future<String> getMessageStatus() {
    try {
      return _mpIpfs!.getOwnIdentity().status_message;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<String> getUsername() {
    // TODO: implement getUsername
    throw UnimplementedError();
  }

  @override
  Future<CurrentUserProfile> modifyMessageStatus(String newMessageStatus) {
    // TODO: implement modifyMessageStatus
    throw UnimplementedError();
  }

  @override
  Future<CurrentUserProfile> modifyUsername(String newUsername) {
    // TODO: implement modifyUsername
    throw UnimplementedError();
  }
}
