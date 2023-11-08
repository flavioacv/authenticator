import 'package:authenticator/app/core/services/local_storage/local_storage_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  @override
  Future<String?> getString(String key) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    try {
      sharedPreferences.getString(key);
    } catch (e, stackTrace) {
      throw LocalStorageException(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
    return null;
  }

  @override
  Future<void> remove(String key) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    try {
      await sharedPreferences.remove(key);
    } catch (e, stackTrace) {
      throw LocalStorageException(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> setString(String key, String value) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    try {
      await sharedPreferences.setString(key, value);
    } catch (e, stackTrace) {
      throw LocalStorageException(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
