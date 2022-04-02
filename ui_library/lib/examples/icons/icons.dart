import 'package:flutter/material.dart';
import 'package:ui_library/core/icons/icons.dart';

import '../../widgets/icon/icon.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      home: const IconShowRoom(),
    );
  }
}

class IconShowRoom extends StatelessWidget {
  const IconShowRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Row(
          children: const [
            UIcon(UIcons.about_icon),
            UIcon(UIcons.add_button),
            UIcon(UIcons.add_contact_member_icon),
            UIcon(UIcons.add_folder_icon),
          ],
        ),
      ]),
    );
  }
}
