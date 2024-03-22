import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/colors.dart';
import 'package:portfolio/config/text_styles.dart';

class HomeDesktopView extends StatelessWidget {
  const HomeDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset("assets/images/home_background.png"),
        CustomPaint(
          painter: InvertedTrianglePainter(color: AppColors.blackOpacity),
        ),
        Positioned(
            top: context.height * (0.4 - 0.3 / 2),
            left: context.width * 0.1,
            height: context.height * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("HI, I'M", style: TextStyles.presentationTitle),
                const Text("DANILO CATONE", style: TextStyles.name),
                Text("I'm a Flutter Developer",
                    style: context.textTheme.headlineLarge),
              ],
            ))
      ],
    );
  }
}

class InvertedTrianglePainter extends CustomPainter {
  final Color color;
  const InvertedTrianglePainter({required this.color});

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
