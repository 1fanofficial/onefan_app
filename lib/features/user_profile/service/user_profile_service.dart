import 'package:dio/dio.dart';
import 'package:onefan_app/core/network/dio_client.dart';
import 'package:onefan_app/features/user_profile/model/response/user_profile_response.dart';
import 'package:onefan_app/features/user_profile/user_profile_endpoints.dart';

class UserProfileService {
  final _dioClient = DioClient();

  Future<UserProfileResponse?> getUserDetails(String userId) async {
    Response response = await _dioClient.get(UserProfileEndpoints.getUser.replaceAll("{ID}", userId));
    return UserProfileResponse.fromJson(response.data);
  }

  Future<UserProfileResponse?> registerUser(Map<String, dynamic> payload) async {
    Response response = await _dioClient.put(path: UserProfileEndpoints.registerUser, payload: payload);
    return UserProfileResponse.fromJson(response.data);
  }
}
