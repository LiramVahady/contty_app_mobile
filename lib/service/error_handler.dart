import 'package:dio/dio.dart';

class CustomException implements Exception {
  final String message;
  final int? statusCode;
  CustomException(this.message, {this.statusCode});

  @override
  String toString() {
    return "CustomException: $message";
  }
}

class ErrorHandler {
  static String handleDioError(DioException error) {
    // Network issues or invalid responses
    if (error.type == DioExceptionType.unknown ||
        error.type == DioExceptionType.cancel) {
      return "Network error or request was cancelled. Please try again.";
    }

    // Response errors from the server
    if (error.response != null) {
      if (error.response!.data != null) {
        // Check if there is a message in the response
        final errorData = error.response!.data;
        if (errorData is Map<String, dynamic>) {
          return errorData['message'] ??
              'Something went wrong. Please try again.';
        }
        return errorData.toString();
      } else {
        return "Server returned an empty response";
      }
    }

    // If no response, fallback error message
    return "Something went wrong. Please try again.";
  }
}
