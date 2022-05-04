import 'package:flutter/material.dart';
import 'package:ui_library/core/core_export.dart';

import 'models/u_icon_data.dart';

class UIcon extends StatelessWidget {
  /// Creates an [UIcon].
  ///
  /// The default [size] is 24 px .
  ///
  /// Example:
  /// ```dart
  /// Row(
  ///   children: const <Widget>[
  ///     UIcon(
  ///       UIcons.chatbar_stickers,
  ///     ),
  ///     UIcon(
  ///       UIcons.compose_message_button,
  ///     ),
  ///     UIcon(
  ///       UIcons.about_icon,
  ///     ),
  ///   ],
  /// )
  /// ```
  const UIcon(
    this.icon, {
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  final UIconData icon;
  final Color? color;
  final UIconSize? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size != null ? size!.toDouble() : UIconSize.normal.toDouble(),
      color: color ?? UColors.white,
      key: key,
    );
  }
}

enum UIconSize {
  ///24pt
  normal,

  ///20pt, for ULogoutButton
  small,
}

extension UIconSizeExtension on UIconSize {
  double toDouble() {
    switch (this) {
      case UIconSize.normal:
        return USizes.iconSize;
      case UIconSize.small:
        return USizes.iconSizeSmall;
      default:
        return USizes.iconSize;
    }
  }
}
