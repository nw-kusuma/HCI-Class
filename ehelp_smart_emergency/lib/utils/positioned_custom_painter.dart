import 'package:flutter/material.dart';

class PositionedCustomPainter 
  extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

  Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
         
    Path path = Path();
    path.moveTo(width * 0.1, 0.0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, height * 0.1);
    path.lineTo(0.0, height * 0.9);
    path.quadraticBezierTo(0.0, height * 1.0, width * 0.1, height * 1.0);
    path.lineTo(width * 0.28, height * 1.0);
    path.quadraticBezierTo(width * 0.3, height * 1.0, width * 0.3, height * 0.98);
    path.quadraticBezierTo(width * 0.3, height * 0.86, width * 0.4, height * 0.86);
    path.lineTo(width * 0.6, height * 0.86);
    path.quadraticBezierTo(width * 0.7, height * 0.86, width * 0.7, height * 0.98);
    path.quadraticBezierTo(width * 0.7, height * 1.0, width * 0.72, height * 1.0);
    path.lineTo(width * 0.9, height * 1.0);
    path.quadraticBezierTo(width * 1.0, height * 1.0, width * 1.0, height * 0.9);
    path.lineTo(width * 1.0, height * 0.1);
    path.quadraticBezierTo(width * 1.0, 0.0, width * 0.9, 0.0);
    path.lineTo(width * 0.1, 0.0);
    path.close();

    canvas.drawShadow(path, Colors.red, 2.5, false);
    canvas.drawPath(path, paint);

    // canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}