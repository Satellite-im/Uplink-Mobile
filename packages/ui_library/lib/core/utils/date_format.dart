import 'package:intl/intl.dart';

class DateFormatUtils {
  static String formatDateTwelveHours(DateTime dateTime) {
    final inputFormat = DateTime(dateTime.year, dateTime.month, dateTime.day,
        dateTime.hour, dateTime.minute);
    return DateFormat('hh:mma').format(inputFormat).toString();
  }
}
