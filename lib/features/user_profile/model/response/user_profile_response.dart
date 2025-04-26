import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_response.g.dart';
part 'user_profile_response.freezed.dart';

@freezed
class UserProfileResponse with _$UserProfileResponse {
  const factory UserProfileResponse({
    required String id,
    required String emailId,
    required String phone,
    required String firstName,
    required String lastName,
    required String country,
    required DateTime dob,
  }) = _UserProfileResponse;

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) => _$UserProfileResponseFromJson(json);
}
