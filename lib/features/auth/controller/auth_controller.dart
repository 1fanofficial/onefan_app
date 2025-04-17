import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:onefan_app/core/config/app_preferences.dart';
import 'package:onefan_app/core/utils/common_functions.dart';
import 'package:onefan_app/features/auth/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  static const tokenKey = "bearer";

  @override
  FutureOr<void> build() {}

  Future<bool> signUp({required String email, required String password, required BuildContext context}) async {
    state = const AsyncLoading();
    try {
      final authService = AuthService();
      await authService.signUpWithEmail(email, password);
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      if (context.mounted) {
        CommonFunctions.showToastMessage(context: context, message: e.toString());
      }
      return false;
    }
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    try {
      final authService = AuthService();
      final response = await authService.sigInWithEmailAndPassword(email, password);

      final session = response.session;
      if (session != null) {
        AppPreferences().setString(tokenKey, session.accessToken);
      }

      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<bool> verifySignUp({required String email, required String otp, required BuildContext context}) async {
    state = const AsyncLoading();
    try {
      final authService = AuthService();
      final response = await authService.verifySignUp(email, otp);

      final session = response.session;
      if (session != null) {
        AppPreferences().setString(tokenKey, session.accessToken);
      }
      state = const AsyncData(null);
      if (context.mounted) {
        CommonFunctions.showToastMessage(context: context, message: "Email verified!", messageType: MessageType.success);
      }
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      if (context.mounted) {
        CommonFunctions.showToastMessage(context: context, message: e.toString());
      }
      return false;
    }
  }
}
