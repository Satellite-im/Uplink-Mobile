import 'package:flutter/material.dart';
import 'package:ui_library/core/const/u_colors.dart';

//Used in 'Copied' animated label
class FatTriangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = UColors.ctaBlue;

    final path = Path()
      ..lineTo(-16, 0)
      ..lineTo(16, 0)
      ..lineTo(8, -8);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
