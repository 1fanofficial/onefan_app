import 'package:dio/dio.dart';
import 'package:onefan_app/core/config/env.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.options.baseUrl = Env.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer my_token';
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

  Future<Response> post(String path, Map<String, dynamic> payload) async {
    try {
      final response = await _dio.post(path, data: payload);
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
        final statusCode = e.response?.statusCode ?? 0;
        final message = e.response?.data['message'] ?? 'Unknown Error';
        throw Exception('[$statusCode] $message');
      default:
        throw Exception("Network Error: ${e.message}");
    }
  }
}
