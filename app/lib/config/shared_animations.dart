import 'dart:ui';

import 'package:flutter/material.dart';
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

  static final darkTitleShimmer = <Effect>[
    ShimmerEffect(
      delay: 1500.ms,
      // color: Colors.black,
      colors: [AppColors.darkWhite, AppColors.lightGrey, AppColors.darkWhite],
      duration: 2000.ms,
    ),
  ];

  static final lightTitleShimmer = <Effect>[
    ShimmerEffect(
      delay: 1500.ms,
      // color: Colors.black,
      colors: [AppColors.darkBackground, AppColors.lightGrey, AppColors.darkBackground],
      duration: 2000.ms,
    ),
  ];
}
