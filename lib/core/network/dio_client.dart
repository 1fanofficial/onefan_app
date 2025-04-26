import 'package:dio/dio.dart';
import 'package:onefan_app/core/config/app_preferences.dart';
import 'package:onefan_app/core/config/env.dart';
import 'package:onefan_app/core/routing/app_router.dart';
import 'package:onefan_app/core/routing/route_name.dart';
import 'package:onefan_app/features/auth/service/auth_service.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.baseUrl = Env.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          bool isSessionInvalid = await AuthService.isSessionInvalid();
          if (isSessionInvalid) {
            AppRouter.rootNavigtorKey.currentState?.pushNamedAndRemoveUntil(RouteName.signin, (route) => false);
            return;
          }
          final accessToken = AppPreferences().getString(AuthService.accessTokenKey);
          options.headers['Authorization'] = 'Bearer $accessToken';
          return handler.next(options);
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  Future<Response> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response;
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  Future<Response> post({required String path, required Map<String, dynamic> payload}) async {
    try {
      final response = await _dio.post(path, data: payload);
      return response;
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  Future<Response> put({required String path, required Map<String, dynamic> payload}) async {
    try {
      final response = await _dio.put(path, data: payload);
      return response;
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  Future<Response> delete({required String path, required Map<String, dynamic> payload}) async {
    try {
      final response = await _dio.delete(path, data: payload);
      return response;
    } on DioException catch (e) {
      _handleDioException(e);
      rethrow;
    }
  }

  void _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw Exception("Connection Timeout");
      case DioExceptionType.receiveTimeout:
        throw Exception("Receive Timeout");
      case DioExceptionType.badResponse:
        final message = e.response?.data['message'] ?? 'Unknown Error';
        throw Exception(message);
      default:
        throw Exception("Network Error: ${e.message}");
    }
  }
}
