import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/config/colors.dart';

class TextStyles {
  static final TextStyle presentationTitle = GoogleFonts.poppins(
    fontSize: 50,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle name = TextStyle(
    color: AppColors.nameTextColor,
    fontSize: 70,
    fontFamily: "Mova",
    fontWeight: FontWeight.bold,
  );
}
