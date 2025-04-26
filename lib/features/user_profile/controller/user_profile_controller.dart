import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onefan_app/core/utils/common_functions.dart';
import 'package:onefan_app/features/user_profile/model/request/user_profile_request.dart';
import 'package:onefan_app/features/user_profile/model/response/user_profile_response.dart';
import 'package:onefan_app/features/user_profile/service/user_profile_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_controller.g.dart';

@riverpod
class UserProfileController extends _$UserProfileController {
  @override
  void build() {
    mounted = true;
    ref.onDispose(() => mounted = false);
  }

  bool mounted = true;

  Future<UserProfileResponse?> getUserDetails(String userId) async {
    state = const AsyncLoading();
    try {
      final userProfileService = UserProfileService();
      UserProfileResponse? userDetails = await userProfileService.getUserDetails(userId);
      if (mounted) {
        state = const AsyncData(null);
      }
      return userDetails;
    } catch (e, st) {
      if (mounted) {
        state = AsyncError(e, st);
      }
      rethrow;
    }
  }

  Future<bool> registerUser({required UserProfileRequest userDetails, required BuildContext context}) async {
    state = const AsyncLoading();
    try {
      final userProfileService = UserProfileService();
      await userProfileService.registerUser(userDetails.toJson());
      if (mounted) {
        state = const AsyncData(null);
      }
      return true;
    } catch (e, st) {
      if (mounted) {
        state = AsyncError(e, st);
      }
      CommonFunctions.showToastMessage(context: context, message: e.toString());
      return false;
    }
  }
}
