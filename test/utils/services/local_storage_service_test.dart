import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';
import 'package:uplink/utils/services/local_storage_service.dart';

void main() {
  group('ULocalStorageService', () {
    group('getBoolValue', () {
      test('return default value for getBoolValue', () async {
        SharedPreferences.setMockInitialValues({});

        final sharedPreferences = await SharedPreferences.getInstance();

        final uLocalStorageDevice = ULocalStorageService();

        const expectedCounter = false;
        final actualCounter = await uLocalStorageDevice.getBoolValue(
          localKey: ULocalKey.isUserLogged,
        );

        expect(actualCounter, expectedCounter);
        await sharedPreferences.clear();
      });
    });
    group('saveBoolValue', () {
      test('return newly set value with saveBoolValue', () async {
        SharedPreferences.setMockInitialValues({});

        final sharedPreferences = await SharedPreferences.getInstance();

        final uLocalStorageDevice = ULocalStorageService();

        const expectedCounter = true;
        await uLocalStorageDevice.saveBoolValue(
          localKey: ULocalKey.isUserLogged,
          value: true,
        );
        final actualCounter = await uLocalStorageDevice.getBoolValue(
          localKey: ULocalKey.isUserLogged,
        );

        expect(actualCounter, expectedCounter);
        // Should be true rather than false, because it has been set.
        await sharedPreferences.clear();
      });
    });
  });
}
