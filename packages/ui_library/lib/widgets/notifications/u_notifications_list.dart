import 'package:flutter/material.dart';
import 'package:ui_library/core/utils/date_format.dart';

import '../../ui_library_export.dart';

class UNotificationsList extends StatefulWidget {
  /// This displays multiple [UNotification]
  /// in order from newest notification to oldest
  ///
  /// Example:
  /// ```dart
  /// ...
  /// child: UNotificationsList(
  ///  uNotificationList: [
  ///    UNotification(
  ///      username: 'Jack',
  ///      notificationType: NotificationType.reactedYourComment,
  ///      arrivalNotificationTime: DateTime(2022, 06, 29, 21),
  ///    ),
  ///    UNotification(
  ///      username: 'Urma',
  ///      notificationType: NotificationType.sentYouALink,
  ///      arrivalNotificationTime: DateTime(2022, 06, 29, 10),
  ///      linkUrl: 'https://www.youastube.com/watch?v=HJv4LQxbVEA',
  ///    ),
  /// ...
  /// ```
  const UNotificationsList({
    Key? key,
    required this.uNotificationList,
    this.isFromBottomSheet = true,
  }) : super(key: key);

  final List<UNotification> uNotificationList;

  final bool isFromBottomSheet;

  @override
  State<UNotificationsList> createState() => _UNotificationsListState();
}

class _UNotificationsListState extends State<UNotificationsList> {
  final List<List<UNotification>> _listOfNotificationsList = [];
  final List<UNotification> _notificationsListPerDay = [];

  @override
  void initState() {
    _prepareNotificationsList();
    super.initState();
  }

  void _prepareNotificationsList() {
    widget.uNotificationList.sort((a, b) =>
        b.arrivalNotificationTime.compareTo(a.arrivalNotificationTime));

    final length = widget.uNotificationList.length;
    for (int i = 0; i < length; i++) {
      _notificationsListPerDay.add(widget.uNotificationList[i]);

      if (i != length - 1) {
        final _itemDateTime =
            widget.uNotificationList[i].arrivalNotificationTime;
        final _itemDate = _returnDate(_itemDateTime);
        final _nextItemDateTime =
            widget.uNotificationList[i + 1].arrivalNotificationTime;
        final _nextItemDate = _returnDate(_nextItemDateTime);

        if (_nextItemDate != _itemDate) {
          _listOfNotificationsList.add(List.from(_notificationsListPerDay));
          _notificationsListPerDay.clear();
        }
      } else {
        _listOfNotificationsList.add(List.from(_notificationsListPerDay));
        _notificationsListPerDay.clear();
      }
    }
  }

  DateTime _returnDate(DateTime dateTimeItem) {
    return DateTime(
      dateTimeItem.year,
      dateTimeItem.month,
      dateTimeItem.day,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: _listOfNotificationsList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final _listPerDay = _listOfNotificationsList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UText(
                DateFormatUtils.formatDateForNotificationsList(
                  _listPerDay.first.arrivalNotificationTime,
                ),
                textStyle: UTextStyle.H5_fifthHeader,
                textAlign: TextAlign.left,
                textColor: widget.isFromBottomSheet
                    ? UColors.textMed
                    : UColors.textDark,
              ),
              const SizedBox.square(
                dimension: 16,
              ),
              for (final notification in _listPerDay) ...[
                notification,
                const SizedBox.square(
                  dimension: 24,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
