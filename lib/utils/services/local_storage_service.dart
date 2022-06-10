import 'package:shared_preferences/shared_preferences.dart';

enum ULocalKey { isUserLogged, isPinStored }

class ULocalStorageService {
  Future<void> saveBoolValue({
    required ULocalKey localKey,
    required bool value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(localKey.name, value);
  }

  Future<bool> getBoolValue({
    required ULocalKey localKey,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(localKey.name) ?? false;
  }

  Future<Map<ULocalKey, dynamic>> getMultipleValues({
    required List<ULocalKey> localKeyList,
  }) async {
    final _mapValues = <ULocalKey, dynamic>{};

    final prefs = await SharedPreferences.getInstance();
    for (final localKey in localKeyList) {
      final newEntry = {localKey: prefs.get(localKey.name)};
      _mapValues.addEntries(newEntry.entries);
    }

    return _mapValues;
  }
}
