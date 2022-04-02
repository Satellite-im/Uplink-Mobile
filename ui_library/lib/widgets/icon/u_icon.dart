import 'package:flutter/material.dart';

import '../../core/all.dart';

part 'u_icon_data.dart';

class UIcon extends StatelessWidget {
  const UIcon(
    this.icon, {
    Key? key,
  }) : super(key: key);

  final UIconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 40,
      key: key,
    );
  }
}
