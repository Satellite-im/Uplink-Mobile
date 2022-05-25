import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UDialog {
  final BuildContext context;

  final String title;

  final Widget? content;

  final List<Widget> actions;

  /// It is a template for dialog
  ///
  /// To not use [actions]
  /// just set it as the example below
  /// ```dart
  /// return UDialog(
  ///    context,
  ///    title: 'Saved!',
  ///    actions: [],
  ///  ...
  /// ```
  UDialog(
    this.context, {
    required this.title,
    this.content,
    required this.actions,
  });

  Future<UDialog?> showUDialog<UDialog>() async {
    return await showDialog(
      context: context,
      builder: (_context) => AlertDialog(
        contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        backgroundColor: UColors.foregroundDark,
        actions: actions.isNotEmpty ? actions : null,
        title: UText(
          title,
          textStyle: UTextStyle.H2_secondaryHeader,
        ),
        content: content,
      ),
    );
  }
}
