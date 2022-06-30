import 'package:flutter/material.dart';
import 'package:ui_library/core/utils/date_format.dart';
import 'package:ui_library/widgets/u_text/u_text.dart';

import 'u_notification.dart';

class UNotificationsList extends StatefulWidget {
  const UNotificationsList({
    Key? key,
    required this.uNotificationList,
  }) : super(key: key);

  final List<UNotification> uNotificationList;

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

    var length = widget.uNotificationList.length;
    for (var i = 0; i < length; i++) {
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
