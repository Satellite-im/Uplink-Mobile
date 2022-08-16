import 'package:uplink/auth/data/datasource/create_current_user.remote_datasource.dart';
import 'package:uplink/auth/data/datasource/store_auth_keys.local_datasource.dart';
import 'package:uplink/auth/data/repositories/authentication.repository.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/utils/services/services_export.dart';

class AuthenticationRepositoryImpl implements IAuthenticationRepository {
  const AuthenticationRepositoryImpl(
    this._remoteDatasource,
    this._localDatasource,
  );

  final CreateCurrentUserData _remoteDatasource;
  final StoreAuthKeysData _localDatasource;

  @override
  Future<CurrentUser> createCurrentUser({
    required CurrentUser newUser,
    required String password,
  }) async {
    try {
      final _did = await _remoteDatasource.createCurrentUser(
        username: newUser.username,
        password: password,
        statusMessage: newUser.statusMessage,
      );
      return newUser.copywith(did: _did);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<Map<ULocalKey, dynamic>> getPinValue() async {
    try {
      return await _localDatasource.getPinValue();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<bool> getUserIsLoggedValue() async {
    try {
      return await _localDatasource.getIsUserLoggedValue();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> savePinValue({required String pinValue}) async {
    try {
      await _localDatasource.savePinValue(pinValue: pinValue);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> saveUserIsLoggedValue() async {
    try {
      await _localDatasource.saveIsUserLoggedValue();
    } catch (error) {
      throw Exception(error);
    }
  }
}