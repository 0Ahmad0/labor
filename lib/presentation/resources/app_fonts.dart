import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontManager {
  const FontManager._();
  static String fontAr = 'dinNextLtW23';
  static String? fontEn = GoogleFonts.quicksand().fontFamily;
}

class FontWeightManager {
  const FontWeightManager._();
  static const bold = FontWeight.w700;
  static const semiBold = FontWeight.w600;
  static const medium = FontWeight.w500;
  static const regular = FontWeight.w400;
  static const light = FontWeight.w300;
}

class FontSize {
  const FontSize._();
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s17 = 17.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s24 = 24.0;
}
