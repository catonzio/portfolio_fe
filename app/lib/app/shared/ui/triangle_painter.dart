import 'package:flutter/material.dart';

class HomeTrianglePainter extends CustomPainter {
  final Color color;
  final bool isDesktop;

  const HomeTrianglePainter({required this.color, required this.isDesktop});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final path = Path();

    path.moveTo(
        width, isDesktop ? -height / 3 : -height / 10); // Top right corner
    path.lineTo(isDesktop ? width / 3 : width / 3, height);
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
  final bool isDesktop;

  const WorkExperiencePainter({required this.color, required this.isDesktop});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    final path = Path();

    path.moveTo(width, 0); // Top right corner
    path.lineTo(width - (isDesktop ? width / 5 : width / 10), 0);
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
