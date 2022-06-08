import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const ULoadingIndicator(
                padding: EdgeInsets.zero,
              ),
              UText(
                title,
                textStyle: UTextStyle.H1_primaryHeader,
              ),
              const SizedBox.square(
                dimension: 20,
              ),
              UText(
                body,
                textStyle: UTextStyle.B1_body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
