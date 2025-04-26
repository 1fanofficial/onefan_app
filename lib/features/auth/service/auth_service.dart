import 'dart:convert';
import 'dart:developer';

import 'package:onefan_app/core/config/app_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabaseClient = Supabase.instance.client;
  static const accessTokenKey = "accessToken";
  static const refreshTokenKey = "refreshTokenKey";

  Future<AuthResponse> signUpWithEmail(String email, String password) async {
    final response = await _supabaseClient.auth.signUp(
      email: email,
      password: password,
    );
    return response;
  }

  Future<AuthResponse> sigInWithEmailAndPassword(String email, String password) async {
    final response = await _supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  Future<AuthResponse> verifyEmail(String email, String otp) async {
    final response = await _supabaseClient.auth.verifyOTP(
      type: OtpType.signup,
      token: otp,
      email: email,
    );
    return response;
  }

  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  static Future<bool> isSessionInvalid() async {
    final client = Supabase.instance.client;
    final prefs = AppPreferences();

    String? accessToken = prefs.getString(accessTokenKey);
    String? refreshToken = prefs.getString(refreshTokenKey);

    if (accessToken != null && accessToken.isNotEmpty) {
      try {
        final parts = accessToken.split('.');
        if (parts.length != 3) return true;

        final payloadMap = json.decode(
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
        );

        final exp = (payloadMap['exp'] as int) * 1000;
        final now = DateTime.now().millisecondsSinceEpoch;

        if (now >= exp) {
          // Try refreshing
          if (refreshToken != null && refreshToken.isNotEmpty) {
            final response = await client.auth.refreshSession(refreshToken);
            final session = response.session;

            if (session != null) {
              prefs.saveAuthData(session);
              log('🔄 Token refreshed!');
              return false; // session now valid
            }
          }

          // If refresh failed
          log("⚠️ Token expired and refresh failed");
          await prefs.clearAuthData();
          await client.auth.signOut();
          return true; // session is invalid
        }

        return false;
      } catch (e) {
        log("⚠️ Token expired and refresh failed");
        await prefs.clearAuthData();
        await client.auth.signOut();
        return true;
      }
    } else {
      // No token means session is invalid
      return true;
    }
  }
}
