import '../../exception/app_exception.dart';

class HttpException implements AppException {
  @override
  final String message;

  const HttpException(
    this.message, {
    this.stackTrace,
  });

  @override
  final StackTrace? stackTrace;
}
