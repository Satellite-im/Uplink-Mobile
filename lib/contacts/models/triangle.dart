import 'package:flutter/material.dart';
import 'package:ui_library/core/const/u_colors.dart';

class Triangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = UColors.ctaBlue;

    final path = Path()
      ..lineTo(0, -8)
      ..lineTo(8, 0)
      ..lineTo(0, 8);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
