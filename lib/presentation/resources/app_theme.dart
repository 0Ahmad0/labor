import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labor/presentation/resources/app_styles.dart';

import 'app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData appTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
    ),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: AppColors.black),
        elevation: 0.0,
        color: Colors.transparent,
        centerTitle: true),
    fontFamily: GoogleFonts.quicksand().fontFamily,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: AppColors.lightGreen,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        minimumSize: Size(double.infinity, 60.0),
      ),
    ),
  );
}
