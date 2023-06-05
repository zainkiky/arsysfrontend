import 'package:flutter/material.dart';
import 'package:arsysfrontend/theme.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = redColor3
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.2580000);
    path0.quadraticBezierTo(size.width * 0.1012500, size.height * 0.2387400,
        size.width * 0.3700000, size.height * 0.2380000);
    path0.cubicTo(
        size.width * 0.5404500,
        size.height * 0.2458400,
        size.width * 0.5157000,
        size.height * 0.2444800,
        size.width * 0.6400000,
        size.height * 0.2580000);
    path0.quadraticBezierTo(size.width * 0.8269000, size.height * 0.2867400,
        size.width, size.height * 0.2778200);
    path0.lineTo(size.width, 0);
    path0.lineTo(0, 0);
    path0.lineTo(0, size.height * 0.2580000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
