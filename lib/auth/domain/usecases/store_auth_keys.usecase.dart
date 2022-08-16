import 'package:uplink/auth/data/repositories/authentication.repository.dart';
import 'package:uplink/utils/services/services_export.dart';

class StoreAuthKeysUseCase {
  const StoreAuthKeysUseCase(this._repository);

  final IAuthenticationRepository _repository;

  Future<void> savePinValue({
    required String pinValue,
  }) async =>
      _repository.savePinValue(
        pinValue: pinValue,
      );

  Future<void> saveIsUserLoggedValue() async =>
      _repository.saveUserIsLoggedValue();

  Future<Map<ULocalKey, dynamic>> getPinValue() async =>
      _repository.getPinValue();

  Future<bool> getIsUserLoggedValue() async =>
      _repository.getUserIsLoggedValue();
}
