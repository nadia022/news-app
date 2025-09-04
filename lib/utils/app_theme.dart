import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    indicatorColor: AppColors.white,
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.white),
      backgroundColor: AppColors.black,
      titleTextStyle: AppStyles.medium20White,
    ),
    textTheme: TextTheme(
        headlineMedium: AppStyles.medium24White,
        titleMedium: AppStyles.medium14White,
        titleLarge: AppStyles.bold16White),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.white,
      suffixIconColor: AppColors.white,
      hintStyle: AppStyles.medium20White,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.white, width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.white, width: 1)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.white, width: 1)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.white, width: 1)),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    indicatorColor: AppColors.black,
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.black),
      backgroundColor: AppColors.white,
      titleTextStyle: AppStyles.medium20Black,
    ),
    textTheme: TextTheme(
        headlineMedium: AppStyles.medium24Black,
        titleMedium: AppStyles.medium14black,
        titleLarge: AppStyles.bold16Black),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColors.black,
      suffixIconColor: AppColors.black,
      hintStyle: AppStyles.medium20Black,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.black, width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.black, width: 1)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.black, width: 1)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.black, width: 1)),
    ),
  );
}
