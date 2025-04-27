import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onefan_app/core/config/app_preferences.dart';
import 'package:onefan_app/core/utils/common_functions.dart';
import 'package:onefan_app/features/user_profile/model/request/user_profile_request.dart';
import 'package:onefan_app/features/user_profile/model/response/user_profile_response.dart';
import 'package:onefan_app/features/user_profile/service/user_profile_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_profile_controller.g.dart';

@Riverpod(keepAlive: true)
class UserProfileController extends _$UserProfileController {
  final _userProfileService = UserProfileService();
  String? _cachedUserId;
  UserProfileResponse? _cachedUserProfile;

  @override
  FutureOr<UserProfileResponse?> build() async {
    return null;
  }

  String? _getUserId() {
    if (_cachedUserId != null) return _cachedUserId;
    String? userJson = AppPreferences().getString('user');
    if (userJson != null) {
      User? user = User.fromJson(jsonDecode(userJson));
      _cachedUserId = user?.id;
    }
    return _cachedUserId;
  }

  Future<UserProfileResponse?> _getUserProfile() async {
    if (_cachedUserProfile != null) return _cachedUserProfile;
    final userId = _getUserId();
    if (userId == null) {
      return null;
    }
    _cachedUserProfile = await _userProfileService.getUserDetails(userId);
    return _cachedUserProfile;
  }

  Future<bool> registerUser({required UserProfileRequest userDetails, required BuildContext context}) async {
    state = const AsyncLoading();
    try {
      final response = await _userProfileService.registerUser(userDetails.toJson());
      state = AsyncData(response);
      return true;
    } catch (e, st) {
      state = AsyncError(e, st);
      CommonFunctions.showToastMessage(context: context, message: e.toString());
      return false;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _getUserProfile());
  }

  void clearCache() {
    _cachedUserId = null;
    _cachedUserProfile = null;
  }
}
