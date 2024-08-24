import 'package:logger/logger.dart';

abstract class LoggerUtils {
  static Logger instance = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: false,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );
}
