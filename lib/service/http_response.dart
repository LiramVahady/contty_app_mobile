class HttpResult {
  final String? errorMessage;
  final dynamic data;
  final bool isSuccess;

  HttpResult(
      {required this.errorMessage,
      required this.data,
      required this.isSuccess});
}
