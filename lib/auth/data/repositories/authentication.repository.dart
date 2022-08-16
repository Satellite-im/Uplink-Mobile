import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/utils/services/services_export.dart';

abstract class IAuthenticationRepository {
  Future<CurrentUser> createCurrentUser({
    required CurrentUser newUser,
    required String password,
  });

  Future<void> savePinValue({required String pinValue});

  Future<void> saveUserIsLoggedValue();

  Future<Map<ULocalKey, dynamic>> getPinValue();

  Future<bool> getUserIsLoggedValue();
}
