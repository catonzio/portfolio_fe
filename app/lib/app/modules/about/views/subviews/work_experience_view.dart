import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/app/shared/ui/asd.dart';
import 'package:portfolio/config/colors.dart';

class WorkExperienceView extends StatelessWidget {
  const WorkExperienceView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(color: context.theme.colorScheme.onSurfaceVariant),
      child: Container(
        color: context.theme.colorScheme.surfaceVariant,
        width: context.width,
        height: context.height,
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Stack(
          children: [
            Material(
              color: Colors.transparent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(80),
                bottomRight: Radius.circular(80),
              ),
              elevation: 0,
              child: Container(
                height: context.height * 0.8,
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
            CustomPaint(
              painter: TrianglePainter(color: AppColors.blackOpacity),
            )
          ],
        ),
      ),
    );
  }
}
