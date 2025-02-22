import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/theme/app_fonts.dart';

abstract class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    fontFamily: AppFonts.rubik,
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
  );
}
