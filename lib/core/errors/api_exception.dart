import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic error;

  ApiException({
    required this.message,
    this.statusCode,
    this.error,
  });

  factory ApiException.fromDioException(DioException exception) {
    String message = 'An error occurred';
    int? statusCode;

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout';
        break;
      case DioExceptionType.badResponse:
        statusCode = exception.response?.statusCode;
        message = _handleError(
          statusCode,
          exception.response?.data,
        );
        break;
      case DioExceptionType.cancel:
        message = 'Request cancelled';
        break;
      case DioExceptionType.connectionError:
        message = 'No internet connection';
        break;
      case DioExceptionType.badCertificate:
        message = 'Bad certificate';
        break;
      case DioExceptionType.unknown:
        message = 'Unexpected error occurred';
        break;
    }

    return ApiException(
      message: message,
      statusCode: statusCode,
      error: exception.error,
    );
  }

  static String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error?['message'] ?? 'Bad request';
      case 401:
        return error?['message'] ?? 'Unauthorized';
      case 403:
        return error?['message'] ?? 'Forbidden';
      case 404:
        return error?['message'] ?? 'Not found';
      case 500:
        return error?['message'] ?? 'Internal server error';
      case 503:
        return error?['message'] ?? 'Service unavailable';
      default:
        return error?['message'] ?? 'An error occurred';
    }
  }

  @override
  String toString() => message;
}
