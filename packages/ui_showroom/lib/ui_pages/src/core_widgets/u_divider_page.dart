import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UDividerPage extends StatelessWidget {
  const UDividerPage({Key? key}) : super(key: key);

  static const routeName = '/UDivider';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 0, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                UDivider(),
                SizedBox.square(
                  dimension: 16,
                ),
                UDivider(),
                SizedBox.square(
                  dimension: 16,
                ),
                UDivider(),
                SizedBox.square(
                  dimension: 16,
                ),
                UDivider(),
                SizedBox.square(
                  dimension: 16,
                ),
                UDivider(),
                SizedBox.square(
                  dimension: 16,
                ),
                UDivider(),
                SizedBox.square(
                  dimension: 16,
                ),
                UDivider(),
                SizedBox.square(
                  dimension: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
