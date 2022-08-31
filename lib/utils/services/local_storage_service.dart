import 'package:shared_preferences/shared_preferences.dart';

enum ULocalKey { isUserLogged, isPinStored, pinValue }

//TODO(yijing): update with HydratedBloc
class ULocalStorageService {
  Future<void> saveStringValue({
    required ULocalKey localKey,
    required String value,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(localKey.name, value);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<void> saveBoolValue({
    required ULocalKey localKey,
    required bool value,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(localKey.name, value);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<bool> getBoolValue({
    required ULocalKey localKey,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(localKey.name) ?? false;
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<Map<ULocalKey, dynamic>> getMultipleValues({
    required List<ULocalKey> localKeyList,
  }) async {
    try {
      final _mapValues = <ULocalKey, dynamic>{};

      final prefs = await SharedPreferences.getInstance();
      for (final localKey in localKeyList) {
        final newEntry = {localKey: prefs.get(localKey.name)};
        _mapValues.addEntries(newEntry.entries);
      }

      return _mapValues;
    } catch (error) {
      throw Exception(error);
    }
  }
}
