import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_template.dart';

class UBottomSheetNotifications {
  /// BottomSheet for notifications
  ///
  /// [uNotificationsList]-> The list of uNotifications
  ///
  /// To use, is necessary to call the class and the method [show]
  ///
  /// You need to call an action to show the [UBottomSheetNotifications],
  /// example:
  /// ```dart
  ///   await UBottomSheetNotifications(
  ///            context,
  ///            uNotificationsList: uNotificationListMock,
  ///          )
  ///   .show();
  /// ```
  UBottomSheetNotifications(
    this.context, {
    required this.uNotificationsList,
    required this.onSlideUp,
  });

  final BuildContext context;

  final List<UNotification> uNotificationsList;
  final Function() onSlideUp;

  Future show() {
    final _bottomSheetHalfHeight = MediaQuery.of(context).size.height;
    return UBottomSheet(
      context,
      boxConstraints: BoxConstraints(
        maxHeight: _bottomSheetHalfHeight,
      ),
      child: _UBottomSheetNotificationsBody(
        uNotificationsList: uNotificationsList,
        onSlideUp: (value) {
          onSlideUp();
        },
      ),
    ).show();
  }
}

class _UBottomSheetNotificationsBody extends StatefulWidget {
  const _UBottomSheetNotificationsBody({
    Key? key,
    required this.uNotificationsList,
    required this.onSlideUp,
  }) : super(key: key);

  final List<UNotification> uNotificationsList;
  final Function(double) onSlideUp;

  @override
  State<_UBottomSheetNotificationsBody> createState() =>
      _UBottomSheetNotificationsBodyState();
}

class _UBottomSheetNotificationsBodyState
    extends State<_UBottomSheetNotificationsBody> {
  static const _sentLinkNotificationHeight = 128;
  static const _spaceBetweenNotifications = 24;
  static const _otherNotificationHeight = 40;
  static const _friendRequestHeight = 96;
  static const _whenDateChangeSpace = 31;

  final List<UNotification> _itemsToShow = [];

  @override
  void initState() {
    super.initState();
  }

  void _calculateTheHeightOfUNotifications(double _sizeAvailableInBottomSheet) {
    widget.uNotificationsList.sort((a, b) =>
        b.arrivalNotificationTime.compareTo(a.arrivalNotificationTime));
    double _height = 0;
    final _length = widget.uNotificationsList.length;
    for (int i = 0; i < _length; i++) {
      final uNotification = widget.uNotificationsList[i];
      final _isLink = uNotification.message.contains('http');

      if (uNotification.notificationType == NotificationType.sentYouAMessage &&
          _isLink) {
        _height += _sentLinkNotificationHeight + _spaceBetweenNotifications;
      }

      if (uNotification.notificationType ==
          NotificationType.sentYouAFriendRequest) {
        _height += _friendRequestHeight + _spaceBetweenNotifications;
      }

      if (uNotification.notificationType !=
              NotificationType.sentYouAFriendRequest &&
          !_isLink) {
        _height += _otherNotificationHeight + _spaceBetweenNotifications;
      }

      if (i > 0 &&
          _returnDate(widget.uNotificationsList[i].arrivalNotificationTime)
                  .microsecondsSinceEpoch <
              _returnDate(
                      widget.uNotificationsList[i - 1].arrivalNotificationTime)
                  .microsecondsSinceEpoch) {
        _height += _whenDateChangeSpace;
      }

      if (_height < _sizeAvailableInBottomSheet) {
        _itemsToShow.add(uNotification);
      } else {
        break;
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
  void didChangeDependencies() {
    const _factorToGetAvailableSpaceInBottomSheet = 0.34236;
    _calculateTheHeightOfUNotifications(
      MediaQuery.of(context).size.height *
          _factorToGetAvailableSpaceInBottomSheet,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: (details) {
        // TODO(Lucas): Improve the way to transition
        if (details.delta.dy < 0) {
          widget.onSlideUp.call(MediaQuery.of(context).size.height);
        } else if (details.localPosition.dy > 0) {
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 55, 0, 40),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 26.0),
              child: Row(
                children: const [
                  UIcon(
                    UIcons.menu_bar_notifications,
                  ),
                  SizedBox.square(
                    dimension: 18,
                  ),
                  UText(
                    'Notifications',
                    textStyle: UTextStyle.H1_primaryHeader,
                  ),
                ],
              ),
            ),
            const SizedBox.square(
              dimension: 16,
            ),
            SingleChildScrollView(
              child: UNotificationsList(
                uNotificationList: [
                  for (var i = 0; i < _itemsToShow.length; i++) ...[
                    _itemsToShow[i],
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
