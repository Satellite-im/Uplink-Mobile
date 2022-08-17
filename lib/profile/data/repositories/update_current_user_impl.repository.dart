import 'package:uplink/profile/data/datasource/update_current_user.remote_datasource.dart';
import 'package:uplink/profile/data/repositories/update_current_user.repository.dart';

class UpdateCurrentUserRepositoryImpl implements IUpdateCurrentUserRepository {
  const UpdateCurrentUserRepositoryImpl(this._remoteDatasource);

  final UpdateCurrentUserData _remoteDatasource;

  @override
  String getMessageStatus() {
    try {
      return _remoteDatasource.getMessageStatus();
    } catch (error) {
      throw UnimplementedError();
    }
  }

  @override
  String getUsername() {
    try {
      return _remoteDatasource.getUsername();
    } catch (error) {
      throw UnimplementedError();
    }
  }

  @override
  String getProfilePicture() {
    try {
      return _remoteDatasource.getProfilePicture();
    } catch (error) {
      throw UnimplementedError();
    }
  }

  @override
  void modifyMessageStatus(String newMessageStatus) {
    try {
      _remoteDatasource.modifyMessageStatus(newMessageStatus);
    } catch (error) {
      throw UnimplementedError();
    }
  }

  @override
  void modifyUsername(String newUsername) {
    try {
      _remoteDatasource.modifyUsername(newUsername);
    } catch (error) {
      throw UnimplementedError();
    }
  }

  @override
  void modifyProfilePicture(String base64Image) {
    try {
      _remoteDatasource.modifyProfilePicture(base64Image);
    } catch (error) {
      throw UnimplementedError();
    }
  }
}
