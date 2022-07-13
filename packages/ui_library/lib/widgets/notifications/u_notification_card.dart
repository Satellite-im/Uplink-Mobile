import 'package:flutter/material.dart';
import 'package:ui_library/core/utils/date_format.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/global/username/username.dart';

class UNotificationCard extends StatelessWidget {
  /// Creates a card with notification with user image and username,
  /// and the type of notification
  ///
  /// It is not usually used alone,
  /// but rather as the return of [UNotification]
  const UNotificationCard({
    Key? key,
    required this.username,
    required UMessage uMessage,
    this.hasUnreadNotifications = true,
    UImage? uImage,
  })  : _uImage = uImage ?? const UImage(),
        _uMessage = uMessage,
        super(key: key);

  final String username;

  final UMessage _uMessage;

  final UImage? _uImage;

  final bool hasUnreadNotifications;

  static const _firstSizedBoxSize = 12.0;
  static const _lastSizedBoxSize = 8.0;
  static const _userProfileSize = UUserProfileSize.normal;

  @override
  Widget build(BuildContext context) {
    final _lastMessageArrivalTime = DateFormatUtils.formatDateForMessageArrived(
        _uMessage.arrivalMessageTime);

    final _pictureAndSizedBoxWidth = _userProfileSize.size + _firstSizedBoxSize;

    return LayoutBuilder(builder: (context, constraints) {
      final _widgetWidth = constraints.maxWidth;

      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasUnreadNotifications)
            UUserProfileNotification(
              uImage: _uImage,
            )
          else
            UUserProfile(
              userProfileSize: _userProfileSize,
              uImage: _uImage,
            ),
          const SizedBox.square(
            dimension: _firstSizedBoxSize,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: _widgetWidth - _pictureAndSizedBoxWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Username(
                        username: username,
                        textStyle: UTextStyle.H4_fourthHeader,
                      ),
                    ),
                    UText(
                      _lastMessageArrivalTime,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.textDark,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const SizedBox.square(
                dimension: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (_uMessage.prefixIcon != null) ...[
                    UIcon(_uMessage.prefixIcon!),
                    const SizedBox.square(
                      dimension: _lastSizedBoxSize,
                    ),
                  ],
                  SizedBox(
                    child: UText(
                      _uMessage.message,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.textMed,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (_uMessage.message.contains(
                          ULibraryStrings.uNotificationCard_youAreNowFriends) ||
                      _uMessage.message.contains(ULibraryStrings
                          .uNotificationCard_youDeclinedAFriendRequest))
                    UText(
                      ' $username !',
                      maxLines: 1,
                      textFontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.ellipsis,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.white,
                      textAlign: TextAlign.left,
                    ),
                ],
              ),
              if (_uMessage.message
                  .contains(ULibraryStrings.uNotificationCard_youAreNowFriends))
                Row(
                  children: const [
                    SizedBox(
                      width: _lastSizedBoxSize + 24,
                    ),
                    UText(
                      ULibraryStrings.uNotificationCard_sayHi,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.textMed,
                      textAlign: TextAlign.left,
                    ),
                    UText(
                      ULibraryStrings.uNotificationCard_handWave,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textStyle: UTextStyle.H1_primaryHeader,
                      textColor: UColors.textMed,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
            ],
          ),
        ],
      );
    });
  }
}
