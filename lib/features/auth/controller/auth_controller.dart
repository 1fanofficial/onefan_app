import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:onefan_app/core/config/app_preferences.dart';
import 'package:onefan_app/core/utils/common_functions.dart';
import 'package:onefan_app/features/auth/service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {}

  Future<bool> signUp({required String email, required String password, required BuildContext context}) async {
    state = const AsyncLoading();
    try {
      final authService = AuthService();
      final response = await authService.signUpWithEmail(email, password);
      // in response session is null but it has a user object
      if (response.session != null) {
        AppPreferences().saveAuthData(response.session!);
      }
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      AuthApiException exception = e as AuthApiException;
      if (context.mounted) {
        CommonFunctions.showToastMessage(context: context, message: exception.message, messageType: MessageType.error);
      }
      return false;
    }
  }

  Future<bool> signIn({required String email, required String password, required BuildContext context}) async {
    state = const AsyncLoading();
    try {
      final authService = AuthService();
      final response = await authService.sigInWithEmailAndPassword(email, password);

      final session = response.session;
      if (session != null) {
        await AppPreferences().saveAuthData(session);
        return true;
      }

      state = const AsyncData(null);
      return false;
    } catch (e, st) {
      state = AsyncError(e, st);
      AuthApiException exception = e as AuthApiException;
      if (context.mounted) {
        CommonFunctions.showToastMessage(context: context, message: exception.message, messageType: MessageType.error);
      }
      return false;
    }
  }

  Future<bool> verifyEmail({required String email, required String otp, required BuildContext context}) async {
    state = const AsyncLoading();
    try {
      final authService = AuthService();
      final response = await authService.verifyEmail(email, otp);
      // in response we receive access token, refresh token and user object

      final session = response.session;
      if (session != null) {
        await AppPreferences().saveAuthData(session);
      }
      state = const AsyncData(null);
      if (context.mounted) {
        CommonFunctions.showToastMessage(context: context, message: "Email verified!", messageType: MessageType.success);
      }
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      AuthApiException exception = e as AuthApiException;
      if (context.mounted) {
        CommonFunctions.showToastMessage(context: context, message: exception.message, messageType: MessageType.error);
      }
      return false;
    }
  }

  Future<bool> signOut(BuildContext context) async {
    state = const AsyncLoading();

    try {
      final authService = AuthService();
      await authService.signOut();
      await AppPreferences().clearAuthData();
      state = const AsyncData(null);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      AuthApiException exception = e as AuthApiException;
      if (context.mounted) {
        CommonFunctions.showToastMessage(context: context, message: exception.message, messageType: MessageType.error);
      }
      return false;
    }
  }
}
