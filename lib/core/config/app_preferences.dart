import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  AppPreferences._internal();

  static final AppPreferences _instance = AppPreferences._internal();

  factory AppPreferences() {
    return _instance;
  }

  SharedPreferences? _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  bool get isInitialized => _preferences != null;

  Future<bool> setString(String key, String value) async {
    if (!isInitialized) await init();
    return _preferences!.setString(key, value);
  }

  String? getString(String key) {
    if (!isInitialized) return null;
    return _preferences!.getString(key);
  }

  Future<bool> remove(String key) async {
    if (!isInitialized) await init();
    return await _preferences!.remove(key);
  }

  Future<bool> clear() async {
    if (!isInitialized) await init();
    return await _preferences!.clear();
  }

  bool containsKey(String key) {
    if (!isInitialized) return false;
    return _preferences!.containsKey(key);
  }
}
