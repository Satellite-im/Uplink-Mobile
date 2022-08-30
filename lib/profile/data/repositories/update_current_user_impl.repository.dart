import 'package:uplink/profile/data/datasource/update_current_user.remote_datasource.dart';
import 'package:uplink/profile/data/repositories/update_current_user.repository.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';

class UpdateCurrentUserRepositoryImpl implements IUpdateCurrentUserRepository {
  const UpdateCurrentUserRepositoryImpl(this._remoteDatasource);

  final UpdateCurrentUserData _remoteDatasource;

  @override
  Future<CurrentUser> getCurrentUserInfo() {
    try {
      return _remoteDatasource.getCurrentUserInfo();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  String getMessageStatus() {
    try {
      return _remoteDatasource.getMessageStatus();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  String getDid() {
    try {
      return _remoteDatasource.getDid();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  String getUsername() {
    try {
      return _remoteDatasource.getUsername();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  String getProfilePicture() {
    try {
      return _remoteDatasource.getProfilePicture();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  String getBannerPicture() {
    try {
      return _remoteDatasource.getBannerPicture();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  void modifyMessageStatus(String newMessageStatus) {
    try {
      _remoteDatasource.modifyMessageStatus(newMessageStatus);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  void modifyUsername(String newUsername) {
    try {
      _remoteDatasource.modifyUsername(newUsername);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  void modifyProfilePicture(String base64Image) {
    try {
      _remoteDatasource.modifyProfilePicture(base64Image);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  void modifyBannerPicture(String base64Image) {
    try {
      _remoteDatasource.modifyBannerPicture(base64Image);
    } catch (error) {
      throw Exception(error);
    }
  }
}
