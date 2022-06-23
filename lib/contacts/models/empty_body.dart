import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class EmptyBody extends StatelessWidget {
  const EmptyBody({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: UText(
        text,
        textStyle: UTextStyle.B1_body,
        textColor: UColors.white,
      ),
    );
  }
}
