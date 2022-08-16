import 'package:uplink/utils/services/services_export.dart';

class StoreAuthKeysData {
  StoreAuthKeysData(this._localStorageService);
  final ULocalStorageService _localStorageService;

  Future<void> savePinValue({required String pinValue}) async {
    try {
      await _localStorageService.saveStringValue(
        localKey: ULocalKey.pinValue,
        value: pinValue,
      );
      await _localStorageService.saveBoolValue(
        localKey: ULocalKey.isPinStored,
        value: true,
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Map<ULocalKey, dynamic>> getPinValue() async {
    try {
      return await _localStorageService.getMultipleValues(
        localKeyList: [
          ULocalKey.pinValue,
          ULocalKey.isPinStored,
        ],
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> saveIsUserLoggedValue() async {
    try {
      await _localStorageService.saveBoolValue(
        localKey: ULocalKey.isUserLogged,
        value: true,
      );
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<bool> getIsUserLoggedValue() async {
    try {
      return await _localStorageService.getBoolValue(
        localKey: ULocalKey.isUserLogged,
      );
    } catch (error) {
      throw Exception(error);
    }
  }
}
