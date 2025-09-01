import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    indicatorColor: AppColors.white,
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      titleTextStyle: AppStyles.medium20White,
    ),
    textTheme: TextTheme(
        titleMedium: AppStyles.medium14White,
        titleLarge: AppStyles.bold16White),
  );

  static ThemeData lightTheme = ThemeData(
    indicatorColor: AppColors.black,
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: AppStyles.medium20Black,
    ),
    textTheme: TextTheme(
        titleMedium: AppStyles.medium14black,
        titleLarge: AppStyles.bold16Black),
  );
}
