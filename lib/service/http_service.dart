import 'package:contty_app/service/error_handler.dart';
import 'package:contty_app/singelton/shared_user.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpService {
  final _dio = Dio();
  final baseUrl = "https://contty.com:3002/api/";

  Future<String?> getToken() async {
    final shared = await SharedPreferences.getInstance();
    final token = shared.getString("token");
    return token;
  }

  Future<Response?> get(String path) async {
    final token = await getToken();
    final url = baseUrl + path;
    try {
      Response res = await _dio.get(url,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return res;
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<Response?> post(String path, Map<String, dynamic> body) async {
    final url = baseUrl + path;
    final token = await getToken();
    final Options? options = token == null
        ? null
        : Options(headers: {"Authorization": "Bearer $token"});
    try {
      // Sending POST request with the provided path and body
      Response res = await _dio.post(url, data: body, options: options);
      return res;
    } catch (e) {
      if (e is DioException) {
        final errorMessage = ErrorHandler.handleDioError(e);
        throw CustomException(errorMessage, statusCode: e.response?.statusCode);
      }
      print("Error during POST request: $e");
    }
    return null;
  }

  Future<Response?> put(String path, Map<String, dynamic> body) async {
    final token = await getToken();
    final url = baseUrl + path;
    try {
      // Sending POST request with the provided path and body
      Response res = await _dio.put(url,
          data: body,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return res;
    } catch (e) {
      if (e is DioException) {
        final errorMessage = ErrorHandler.handleDioError(e);
        throw CustomException(errorMessage, statusCode: e.response?.statusCode);
      }
      print("Error during POST request: $e");
    }
    return null;
  }
}
