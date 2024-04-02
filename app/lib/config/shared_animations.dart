import 'dart:ui';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/config/colors.dart';

class GlobalAnimations {
  static final titleAppearence = <Effect>[
    FadeEffect(delay: 500.ms, duration: 1000.ms),
    FlipEffect(duration: 250.ms),
    MoveEffect(
        delay: 500.ms,
        begin: const Offset(0, -200),
        end: const Offset(0, 0),
        duration: 250.ms),
  ];

  static final titleShimmer = <Effect>[
    ShimmerEffect(
      delay: 1500.ms,
      color: AppColors.lightGrey,
      duration: 2000.ms,
    ),
  ];
}
