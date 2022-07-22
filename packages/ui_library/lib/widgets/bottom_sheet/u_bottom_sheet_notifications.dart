import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_template.dart';

const _kScreenPercentageAvailavleForBottomSheet = 0.75;

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
    this.animationController,
  });

  final BuildContext context;

  final List<UNotification> uNotificationsList;

  final void Function() onSlideUp;

  final AnimationController? animationController;

  Future show() {
    final _bottomSheetMaxHeight = MediaQuery.of(context).size.height *
        _kScreenPercentageAvailavleForBottomSheet;
    return UBottomSheet(
      context,
      animationController: animationController,
      boxConstraints: BoxConstraints(
        maxHeight: _bottomSheetMaxHeight,
      ),
      child: _UBottomSheetNotificationsBody(
        uNotificationsList: uNotificationsList,
        onSlideUp: () {
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
  final void Function() onSlideUp;

  @override
  State<_UBottomSheetNotificationsBody> createState() =>
      _UBottomSheetNotificationsBodyState();
}

class _UBottomSheetNotificationsBodyState
    extends State<_UBottomSheetNotificationsBody> {
  static const _sentLinkNotificationHeight = 128;

  static const _spaceBetweenNotifications = 24;

  static const _otherNotificationHeight =
      USizes.uNotificationStandardHeightSize;

  static const _serverNotificationHeight =
      USizes.uNotificationServerMessageHeightSize;

  static const _friendRequestHeight =
      USizes.uNotificationFriendRequestUpsideHeightSize +
          USizes.uNotificationFriendRequesBottomSideHeightSize;

  static const _whenDateChangeSpace = 31;

  double _height = 0;
  double _widgetsHeigth = 0;

  final List<UNotification> _itemsToShow = [];

  void _calculateTheHeightOfUNotifications(double _sizeAvailableInBottomSheet) {
    widget.uNotificationsList.sort((a, b) =>
        b.arrivalNotificationTime.compareTo(a.arrivalNotificationTime));

    final _uNotificationsList = List.from(widget.uNotificationsList);

    if (_uNotificationsList.first.isUnread == true) {
      _uNotificationsList.removeWhere((element) => element.isUnread == false);
    }

    final _length = _uNotificationsList.length;
    for (int i = 0; i < _length; i++) {
      final uNotification = _uNotificationsList[i];
      final _isLink = uNotification.message.contains('http');

      if (uNotification.notificationType == NotificationType.message &&
          _isLink) {
        _height += _sentLinkNotificationHeight + _spaceBetweenNotifications;
      }

      if (uNotification.notificationType == NotificationType.friendRequest) {
        _height += _friendRequestHeight + _spaceBetweenNotifications;
      }

      if (uNotification.notificationType == NotificationType.serverMessage) {
        _height += _serverNotificationHeight + _spaceBetweenNotifications;
      }

      if (uNotification.notificationType != NotificationType.friendRequest &&
          !_isLink &&
          uNotification.notificationType != NotificationType.serverMessage) {
        _height += _otherNotificationHeight + _spaceBetweenNotifications;
      }

      if (i > 0 &&
          _returnDate(widget.uNotificationsList[i].arrivalNotificationTime)
                  .microsecondsSinceEpoch <
              _returnDate(_uNotificationsList[i - 1].arrivalNotificationTime)
                  .microsecondsSinceEpoch) {
        _height += _whenDateChangeSpace;
      }

      if (_height < _sizeAvailableInBottomSheet) {
        _itemsToShow.add(uNotification);
        _widgetsHeigth = _height;
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
    final _factorToGetAvailableSpaceInBottomSheet =
        (MediaQuery.of(context).size.height *
                _kScreenPercentageAvailavleForBottomSheet -
            113);
    _calculateTheHeightOfUNotifications(
      _factorToGetAvailableSpaceInBottomSheet,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _widgetsHeigth + 123,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onVerticalDragUpdate: (details) {
          // TODO(Lucas): Improve the way to transition
          if (details.delta.dy < 0) {
            Navigator.of(
              context,
            ).pop();

            widget.onSlideUp.call();
          } else if (details.localPosition.dy > 0) {
            Navigator.of(context, rootNavigator: true).pop();
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 30, 0, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              UNotificationsList(
                uNotificationList: [
                  for (int i = 0; i < _itemsToShow.length; i++) ...[
                    _itemsToShow[i],
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
