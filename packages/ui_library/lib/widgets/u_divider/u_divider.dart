import 'package:flutter/material.dart';

import '../../core/const/const_export.dart';

class UDivider extends StatelessWidget {
  /// Creates a Divider with presets
  const UDivider({
    Key? key,
    this.thickness,
    this.height,
    this.color,
    this.intent,
    this.endIntent,
  }) : super(key: key);

  final double? thickness;
  final double? height;
  final Color? color;
  final double? intent;
  final double? endIntent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height ?? 0,
      thickness: thickness ?? 1,
      indent: intent,
      endIndent: endIntent,
      color: color ?? UColors.foregroundDark,
    );
  }
}
