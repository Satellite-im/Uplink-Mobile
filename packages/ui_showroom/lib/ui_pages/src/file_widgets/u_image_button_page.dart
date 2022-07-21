import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UImageButtonPage extends StatelessWidget {
  const UImageButtonPage({Key? key}) : super(key: key);
  static const routeName = '/UImageButton';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [],
      )),
    );
  }
}
