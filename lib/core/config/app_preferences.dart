import 'dart:convert';
import 'dart:developer';

import 'package:onefan_app/features/auth/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  Future<void> saveAuthData(Session session) async {
    try {
      if (!isInitialized) await init();
      await _preferences!.setString(AuthService.accessTokenKey, session.accessToken);
      if (session.refreshToken != null) {
        await _preferences!.setString(AuthService.refreshTokenKey, session.refreshToken!);
      }
      final userJson = jsonEncode(session.user.toJson());
      await _preferences!.setString('user', userJson);
    } catch (e) {
      log("Failed to save auth data $e");
    }
  }

  Future<void> clearAuthData() async {
    try {
      if (!isInitialized) return;
      await _preferences!.clear();
    } catch (e) {
      log("Failed to clear auth data $e");
    }
  }
}
