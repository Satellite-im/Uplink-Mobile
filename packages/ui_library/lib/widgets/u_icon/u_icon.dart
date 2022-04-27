import 'package:flutter/material.dart';
import 'package:ui_library/core/core_export.dart';

import 'models/u_icon_data.dart';

class UIcon extends StatelessWidget {
  /// Creates an [UIcon].
  ///
  /// The [size] is 24 px .
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
  }) : super(key: key);

  final UIconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: USizes.iconSize,
      key: key,
    );
  }
}
