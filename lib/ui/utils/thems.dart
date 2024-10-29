import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData myTheme = ThemeData(
      primaryColor: AppColors.primaryColor,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
          color: AppColors.kLightAccentColor,
        ),
        titleMedium: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor,
        ),
        titleSmall: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
      ));
}
