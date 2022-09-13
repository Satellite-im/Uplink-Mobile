import 'package:flutter/material.dart';

class ScaffoldCenterPage extends StatelessWidget {
  const ScaffoldCenterPage({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: child,
      ),
    );
  }
}
