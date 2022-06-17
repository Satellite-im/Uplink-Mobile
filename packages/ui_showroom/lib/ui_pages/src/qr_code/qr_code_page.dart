import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UQRCodePage extends StatelessWidget {
  const UQRCodePage({Key? key}) : super(key: key);

  static const routeName = '/UQRCode';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox.square(
                  dimension: 200,
                  child: UQRCode(
                    qrCodeData: 'example1',
                  ),
                ),
                SizedBox.square(
                  dimension: 24,
                ),
                SizedBox.square(
                  dimension: 200,
                  child: UQRCode(
                    qrCodeData: 'test2',
                  ),
                ),
                SizedBox.square(
                  dimension: 24,
                ),
                SizedBox.square(
                  dimension: 200,
                  child: UQRCode(
                    qrCodeData:
                        'test test example long line, long text, huge data',
                  ),
                ),
                SizedBox.square(
                  dimension: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
