import 'package:flutter/material.dart';

/// Container with a default border redius 4
class URectContainer extends StatelessWidget {
  const URectContainer({
    Key? key,
    this.height,
    this.width,
    this.bordRadius,
    this.margin,
  }) : super(key: key);

  final double? height;
  final double? width;
  final BorderRadiusGeometry? bordRadius;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: bordRadius ?? BorderRadius.circular(4),
        color: Colors.white,
      ),
    );
  }
}
