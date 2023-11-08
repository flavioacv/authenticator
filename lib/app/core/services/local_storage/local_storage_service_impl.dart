import 'package:authenticator/app/core/services/local_storage/local_storage_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  final SharedPreferences sharedPreferences;

  const LocalStorageServiceImpl({
    required this.sharedPreferences,
  });

  @override
  Future<String?> getString(String key) async {
    try {
      return sharedPreferences.getString(key);
    } catch (e, stackTrace) {
      throw LocalStorageException(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> remove(String key) async {
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
  Future<void> setString(String key, String value) {
    try {
      return sharedPreferences.setString(key, value);
    } catch (e, stackTrace) {
      throw LocalStorageException(
        message: e.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
