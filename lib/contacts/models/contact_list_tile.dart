import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile({
    Key? key,
    required this.name,
    this.statusMessage,
    required this.status,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final String? statusMessage;
  final Status status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      leading: UUserProfileWithStatus(
        userProfileSize: UUserProfileSize.normal,
        status: status,
      ),
      horizontalTitleGap: 12,
      title: UText(
        name,
        textStyle: UTextStyle.H4_fourthHeader,
      ),
      subtitle: UText(
        statusMessage ?? '',
        textStyle: UTextStyle.B1_body,
        textColor: UColors.textMed,
      ),
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: onTap,
    );
  }
}
