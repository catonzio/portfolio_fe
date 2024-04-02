import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/colors.dart';

class TextStylesMobile {
  static final TextStyle presentationTitle = GoogleFonts.poppins(
    fontSize: 35,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle sectionTitle = GoogleFonts.poppins(
    fontSize: 40,
    // color: Colors.red,
    fontWeight: FontWeight.w900,
  );

  static final TextStyle negativeSectionTitle = GoogleFonts.poppins(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    color: AppColors.darkWhite,
  );

  static const TextStyle appBarSection = TextStyle(
    color: AppColors.darkBackground,
    fontSize: 25,
    fontFamily: "Mova",
    fontWeight: FontWeight.normal,
  );

  static const TextStyle name = TextStyle(
    color: AppColors.nameTextColor,
    fontSize: 50,
    fontFamily: "Mova",
    fontWeight: FontWeight.bold,
  );

  static const workExperienceBoxTitle = TextStyle(
      color: AppColors.darkBackground,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      fontFamily: "Beckman");

  static const workExperienceBoxSubtitle = TextStyle(
      color: AppColors.lightGrey,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: "Beckman");

  static const workExperienceDuration = TextStyle(
      color: AppColors.lightGrey,
      fontSize: 10,
      fontWeight: FontWeight.bold,
      fontFamily: "Beckman");
}
