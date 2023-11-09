import '../../../../core/exception/app_exception.dart';

class InformationCaptureException implements AppException {
  @override
  final String message;

  @override
  final StackTrace? stackTrace;

  const InformationCaptureException({
    required this.message,
    required this.stackTrace,
  });
}
