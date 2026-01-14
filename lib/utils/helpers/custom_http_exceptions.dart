class CustomHTTPException implements Exception {
  final String message;

  CustomHTTPException(this.message);

  @override
  String toString() {
    return message;
  }
}