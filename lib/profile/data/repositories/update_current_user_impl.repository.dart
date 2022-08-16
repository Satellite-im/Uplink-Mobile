import 'package:uplink/profile/data/datasource/update_current_user.datasource.dart';
import 'package:uplink/profile/data/repositories/update_current_user.repository.dart';

class UpdateCurrentUserRepositoryImpl implements IUpdateCurrentUserRepository {
  const UpdateCurrentUserRepositoryImpl(this._warpDatasource);

  final UpdateCurrentUserDataWarp _warpDatasource;

  @override
  String getMessageStatus() {
    try {
      return _warpDatasource.getMessageStatus();
    } catch (error) {
      throw UnimplementedError();
    }
  }

  @override
  String getUsername() {
    try {
      return _warpDatasource.getUsername();
    } catch (error) {
      throw UnimplementedError();
    }
  }

  @override
  void modifyMessageStatus(String newMessageStatus) {
    try {
      _warpDatasource.modifyMessageStatus(newMessageStatus);
    } catch (error) {
      throw UnimplementedError();
    }
  }

  @override
  void modifyUsername(String newUsername) {
    try {
      _warpDatasource.modifyUsername(newUsername);
    } catch (error) {
      throw UnimplementedError();
    }
  }
}
