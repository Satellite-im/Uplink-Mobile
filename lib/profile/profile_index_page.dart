import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class ProfileIndexPage extends StatefulWidget {
  const ProfileIndexPage({Key? key}) : super(key: key);

  @override
  State<ProfileIndexPage> createState() => _ProfileIndexPageState();
}

class _ProfileIndexPageState extends State<ProfileIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.actions(
        actionList: [
          IconButton(
            icon: const UIcon(
              UIcons.qr_code,
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
        title: '',
        leading: const SizedBox(),
      ),
      body: const SafeArea(
        child: Text(''),
      ),
    );
  }
}
