import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UDialogStyle extends StatelessWidget {
  final List<Widget>? actions;
  final Widget? title;
  final Widget? content;

  const UDialogStyle({Key? key, this.actions, this.title, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4))),
      backgroundColor: UColors.foregroundDark,
      actions: actions,
      title: title,
      content: content,
    );
  }
}
