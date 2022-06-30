import 'package:intl/intl.dart';

class DateFormatUtils {
  static String formatDateTwelveHours(DateTime dateTime) {
    final inputFormat = DateTime(dateTime.year, dateTime.month, dateTime.day,
        dateTime.hour, dateTime.minute);
    return DateFormat('hh:mma').format(inputFormat).toString();
  }

  static String formatDateForNotificationsList(DateTime dateTime) {
    final _now = DateTime.now();
    final _dateTimeToday = DateTime(_now.year, _now.month, _now.day);
    final _dateTimeYesterday = DateTime(_now.year, _now.month, _now.day - 1);

    final _inputFormat = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
    );

    if (_inputFormat == _dateTimeToday) {
      return 'Today';
    } else if (_inputFormat == _dateTimeYesterday) {
      return 'Yesterday';
    } else {
      final _month = DateFormat('MMMM').format(DateTime(0, _inputFormat.month));
      return '$_month ${_inputFormat.day}, ${_inputFormat.year}';
    }
  }
}
