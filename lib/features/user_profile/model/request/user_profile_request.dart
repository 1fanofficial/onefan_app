import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_request.g.dart';
part 'user_profile_request.freezed.dart';

@freezed
class UserProfileRequest with _$UserProfileRequest {
  const factory UserProfileRequest({
    required String id,
    required String emailId,
    required String firstName,
    required String lastName,
    required String phone,
    required String country,
    required DateTime dob,
  }) = _UserProfileRequest;

  factory UserProfileRequest.fromJson(Map<String, dynamic> json) => _$UserProfileRequestFromJson(json);
}
