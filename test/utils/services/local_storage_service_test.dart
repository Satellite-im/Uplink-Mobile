import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';
import 'package:uplink/utils/services/local_storage_service.dart';

void main() {
  group('ULocalStorageService', () {
    test('return correct boolean value for getBoolValue', () async {
      SharedPreferences.setMockInitialValues({
        ULocalKey.isUserLogged.name: true,
      });

      final uLocalStorageDevice = ULocalStorageService();

      const expectedTrue = true;
      final _isUserLogged = await uLocalStorageDevice.getBoolValue(
        localKey: ULocalKey.isUserLogged,
      );

      expect(_isUserLogged, expectedTrue);
    });
    test('return correct value after saveBoolValue is called to set', () async {
      SharedPreferences.setMockInitialValues({});

      final uLocalStorageDevice = ULocalStorageService();

      const _expectedFalse = false;
      await uLocalStorageDevice.saveBoolValue(
        localKey: ULocalKey.isPinStored,
        value: false,
      );
      final _isPinStored = await uLocalStorageDevice.getBoolValue(
        localKey: ULocalKey.isPinStored,
      );

      expect(_isPinStored, _expectedFalse);
      // Should be true rather than false, because it has been set.
    });
  });
}
