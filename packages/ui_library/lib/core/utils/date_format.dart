import 'package:intl/intl.dart';

class DateFormatUtils {
  static String formatDateTwelveHours(DateTime dateTime) {
    final inputFormat = DateTime(dateTime.year, dateTime.month, dateTime.day,
        dateTime.hour, dateTime.minute);
    return DateFormat('hh:mma').format(inputFormat).toString();
  }

  static String formatDateForMessageArrived(DateTime dateTime) {
    final _now = DateTime.now();
    final _dateTimeToday = DateTime(_now.year, _now.month, _now.day);
    final _dateTimeYesterday = DateTime(_now.year, _now.month, _now.day - 1);
    final _dateTime2DayBefore = DateTime(_now.year, _now.month, _now.day - 2);

    final inputFormatDay =
        DateTime(dateTime.year, dateTime.month, dateTime.day);
    final inputFormatTime = DateTime(dateTime.year, dateTime.month,
        dateTime.day, dateTime.hour, dateTime.minute, dateTime.second);

    if (_now.millisecondsSinceEpoch - inputFormatTime.millisecondsSinceEpoch <=
        30000) {
      return 'Just Now';
    }

    if (inputFormatDay == _dateTimeToday) {
      final _dateFormatForDay =
          DateFormat('hh:mma').format(inputFormatTime).toString();
      return _dateFormatForDay[0] == '0'
          ? _dateFormatForDay.substring(1).toLowerCase()
          : _dateFormatForDay.toLowerCase();
    }

    if (inputFormatDay == _dateTimeYesterday) {
      return 'Yesterday';
    }

    if (inputFormatDay == _dateTime2DayBefore) {
      return '2d';
    }

    inputFormatDay.day;
    final _dayFormat = inputFormatDay.day < 10
        ? '0${inputFormatDay.day}'
        : '${inputFormatDay.day}';
    final _monthFormat = inputFormatDay.month < 10
        ? '0${inputFormatDay.month}'
        : '${inputFormatDay.month}';
    return '$_monthFormat/$_dayFormat/${inputFormatDay.year}';
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
