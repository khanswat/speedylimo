import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _storage = FlutterSecureStorage();
  IOSOptions _getIOSOptions() =>
      IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  Future<void> setField(String key, value) async {
    await _storage.write(
        key: key, value: value, aOptions: _getAndroidOptions());
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<String?> getField(String key) async {
    var readData =
        await _storage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  Future deletefield() async {
    return await _storage.deleteAll();
  }
}
