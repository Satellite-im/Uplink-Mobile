import 'package:ui_library/core/utils/date_format.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('DateFormatUtils Class - formatDateForNotificationsList function', () {
    then('Year 2000 DateTime should return correctly', () {
      final mockDateTime = DateTime(2000, 01, 01);
      final result =
          DateFormatUtils.formatDateForNotificationsList(mockDateTime);
      result.should.be('January 1, 2000');
    }, and: {
      'Yesterday\'s DateTime should return correctly': () {
        final mockDateTime = DateTime.now();
        final result =
            DateFormatUtils.formatDateForNotificationsList(mockDateTime);
        result.should.be('Today');
      },
      'Today\'s DateTime should return correctly': () {
        final currentTimeStamp = DateTime.now();
        final mockDateTime = DateTime(currentTimeStamp.year,
            currentTimeStamp.month, currentTimeStamp.day - 1);
        final result =
            DateFormatUtils.formatDateForNotificationsList(mockDateTime);
        result.should.be('Yesterday');
      },
    });
  });
}
