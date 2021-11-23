class ErrorException implements Exception{
  final bool succeeded;
  final String message;
  final List<String> errors;
  final int errorCode;

  ErrorException({
    required this.succeeded,
    required this.errorCode,
    required this.message,
    required this.errors
  });
}