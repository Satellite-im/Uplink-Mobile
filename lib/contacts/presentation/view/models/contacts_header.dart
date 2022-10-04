import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class ContactsHeader extends StatelessWidget {
  const ContactsHeader({
    Key? key,
    required this.tag,
  }) : super(key: key);

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 21,
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.only(left: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(4),
        ),
        color: UColors.foregroundDark,
      ),
      child: Baseline(
        baseline: 13,
        baselineType: TextBaseline.alphabetic,
        child: UText(
          tag,
          textStyle: UTextStyle.H3_tertiaryHeader,
        ),
      ),
    );
  }
}
