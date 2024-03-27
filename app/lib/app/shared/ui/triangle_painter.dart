import 'package:flutter/material.dart';

class HomeTrianglePainter extends CustomPainter {
  final Color color;
  const HomeTrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final path = Path();

    path.moveTo(width, -height / 3); // Top right corner
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

class WorkExperiencePainter extends CustomPainter {
  final Color color;
  const WorkExperiencePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final path = Path();

    path.moveTo(width, 0); // Top right corner
    path.lineTo(width - width / 5, 0);
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
