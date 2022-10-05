import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class OptionListTile extends StatelessWidget {
  const OptionListTile({
    super.key,
    required this.uIconData,
    required this.color,
    required this.title,
    required this.onTap,
  });

  final UIconData uIconData;
  final Color color;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 8,
      minLeadingWidth: 24,
      leading: UIcon(
        uIconData,
        color: color,
      ),
      title: UText(
        title,
        textStyle: UTextStyle.H5_fifthHeader,
        textColor: color,
      ),
      onTap: onTap,
    );
  }
}
