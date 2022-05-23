import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UTertiaryButtonPage extends StatelessWidget {
  const UTertiaryButtonPage({Key? key}) : super(key: key);
  static const routeName = '/UTertiaryButton';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: UTertiaryButton(
          label: 'Pin Options',
          onPressed: () {},
        ),
      ),
    );
  }
}
