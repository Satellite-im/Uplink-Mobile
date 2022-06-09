import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class ContactsIndexPage extends StatefulWidget {
  const ContactsIndexPage({Key? key}) : super(key: key);

  @override
  State<ContactsIndexPage> createState() => _ContactsIndexPageState();
}

class _ContactsIndexPageState extends State<ContactsIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.actions(
        actionList: [
          IconButton(
            icon: const UIcon(
              UIcons.search,
              color: UColors.textMed,
            ),
            onPressed: () async {},
          ),
          IconButton(
            icon: const UIcon(
              UIcons.add_contact_member,
              color: UColors.textMed,
            ),
            onPressed: () async {},
          ),
          IconButton(
            icon: const UIcon(
              UIcons.hamburger_menu,
              color: UColors.textMed,
            ),
            onPressed: () async {},
          ),
        ],
        leading: IconButton(
          icon: const UIcon(
            UIcons.lefthand_navigation_drawer,
            color: UColors.textMed,
          ),
          onPressed: () async {},
        ),
        title: UAppStrings.contactsIndexPage_appBarTitle,
      ),
      body: const SafeArea(
        child: Text(''),
      ),
    );
  }
}
