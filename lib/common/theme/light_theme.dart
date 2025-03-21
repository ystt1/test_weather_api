
import 'package:demo_golden_owl/common/constant/color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.backgroundColor,
      primaryColor: AppColors.primaryColor,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        displayMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        displaySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        headlineLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        titleSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        bodyLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        bodyMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        bodySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        labelLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        labelMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        labelSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),


      inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: AppColors.secondaryColor),
      labelStyle: const TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
      ),
    ),



      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
            minimumSize: Size(double.infinity, 48)
        ),
      ),
    );
  }
}
