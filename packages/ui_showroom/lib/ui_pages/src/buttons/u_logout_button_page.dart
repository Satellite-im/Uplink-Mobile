import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class ULogoutButtonPage extends StatelessWidget {
  const ULogoutButtonPage({Key? key}) : super(key: key);
  static const routeName = '/ULogoutButton';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(child: ULogoutButton(onPressed: () {})),
    );
  }
}
