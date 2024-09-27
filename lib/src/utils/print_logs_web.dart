import 'package:logger/web.dart' hide LogEvent,Level;
import 'package:matrix_api_lite/matrix_api_lite.dart';

extension PrintLogs on LogEvent {
  static final logger = Logger(
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  );

  void printOut() {
    var logsStr = '[Matrix] $title';
    if (exception != null) {
      logsStr += ' - ${exception.toString()}';
    }
    if (stackTrace != null) {
      logsStr += '\n${stackTrace.toString()}';
    }
    switch (level) {
      case Level.wtf:
        logger.w('!!!CRITICAL!!! $logsStr');
        break;
      case Level.error:
        logger.e(logsStr);
        break;
      case Level.warning:
        logger.w(logsStr);
        break;
      case Level.info:
        logger.i(logsStr);
        break;
      case Level.debug:
        logger.d(logsStr);
        break;
      case Level.verbose:
        logger.i(logsStr);
        break;
    }
  }
}
