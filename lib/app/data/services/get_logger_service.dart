import 'dart:developer';

class GetLoggerService {
  static GetLoggerService? _instance;
  // Avoid self isntance
  GetLoggerService._();
  static GetLoggerService get instance {
    _instance ??= GetLoggerService._();
    return _instance!;
  }

  void logWriter(String text, {bool isError = false}) {
    Future.microtask(() => log('$text. | isError: [$isError]'));
  }
}
