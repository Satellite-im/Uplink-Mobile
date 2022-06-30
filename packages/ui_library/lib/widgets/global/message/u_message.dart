import 'package:ui_library/widgets/u_icon/u_icon_export.dart';

class UMessage {
  final String message;
  final DateTime arrivalMessageTime;
  final UIconData? prefixIcon;

  UMessage({
    required this.message,
    required this.arrivalMessageTime,
    this.prefixIcon,
  });
}
