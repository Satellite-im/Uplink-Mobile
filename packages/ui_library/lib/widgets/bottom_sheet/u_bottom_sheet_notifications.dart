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
    return UBottomSheet(
      context,
      child: _UBottomSheetNotificationsBody(
        uNotificationsList: uNotificationsList,
        onSlideUp: onSlideUp,
      ),
    ).show();
  }
}

class _UBottomSheetNotificationsBody extends StatelessWidget {
  const _UBottomSheetNotificationsBody({
    Key? key,
    required this.uNotificationsList,
    required this.onSlideUp,
  }) : super(key: key);

  final List<UNotification> uNotificationsList;
  final Function() onSlideUp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: (details) {
        // TODO(Lucas): Improve the way to transition
        if (details.delta.dy < 0) {
          onSlideUp.call();
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
                  for (var i = 0; i < 6; i++) ...[
                    uNotificationsList[i],
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
