import 'package:flutter/material.dart';

class GoldenTestWidgetPage extends StatelessWidget {
  const GoldenTestWidgetPage({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: widget),
      ),
    );
  }
}
