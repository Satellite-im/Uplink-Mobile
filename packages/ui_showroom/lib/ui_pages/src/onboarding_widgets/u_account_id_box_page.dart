import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UAccountIDBoxPage extends StatelessWidget {
  const UAccountIDBoxPage({Key? key}) : super(key: key);
  static const routeName = '/UAccountIDBox';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UAccountIDBoxPage.routeName.substring(1)),
      ),
      body: Center(
        child: UAccountIDBox(
          id: 'pBr8xM9WKfbGnLK8EJEiKEivBhBos5EDdJv5Wzbib94',
          onTap: () {},
        ),
      ),
    );
  }
}
