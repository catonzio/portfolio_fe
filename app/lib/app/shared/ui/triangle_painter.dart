import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color color;
  const TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final path = Path();

    path.moveTo(width, 0); // Top right corner
    path.lineTo(width / 3, height);
    path.lineTo(width, height); // Top left corner
    path.close();

    final paint = Paint()..color = color;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}