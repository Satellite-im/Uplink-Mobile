import 'package:ui_library/widgets/u_icon/u_icon_export.dart';

/// It handles the message and the time when it arrived
class UMessage {
  final String message;
  final DateTime arrivalMessageTime;
  final UIconData? prefixIcon;

  /// It handles the message and the time when it arrived
  UMessage({
    required this.message,
    required this.arrivalMessageTime,
    this.prefixIcon,
  });
}
