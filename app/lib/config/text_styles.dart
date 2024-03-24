import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/colors.dart';

class TextStyles {
  static final TextStyle presentationTitle = GoogleFonts.poppins(
    fontSize: 50,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle sectionTitle = GoogleFonts.poppins(
    fontSize: 65,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle name = TextStyle(
    color: AppColors.nameTextColor,
    fontSize: 70,
    fontFamily: "Mova",
    fontWeight: FontWeight.bold,
  );

  static const workExperienceBoxTitle = TextStyle(
      color: AppColors.darkBackground,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: "Beckman");

  static const workExperienceBoxSubtitle = TextStyle(
      color: Colors.grey,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: "Beckman");
}
