import 'package:uplink/utils/services/warp/warp_service.dart';

class CreateCurrentUserData {
  CreateCurrentUserData(this._warp);
  final Warp _warp;

  Future<String> createCurrentUser({
    required String username,
    required String password,
    String? statusMessage,
  }) async {
    try {
      final _did = await _warp.createUser(
        username: username,
        password: password,
        messageStatus: statusMessage ?? '',
      );
      return _did;
    } catch (error) {
      throw Exception(error);
    }
  }
}
