
import 'package:demo_golden_owl/common/constant/color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(

      fontFamily: 'Rubik',
      scaffoldBackgroundColor: AppColors.backgroundColor,
      primaryColor: AppColors.primaryColor,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        displayMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        displaySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        headlineLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        titleMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        bodyLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        bodySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        labelLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        labelMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        labelSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
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
            minimumSize: Size(double.infinity, 55)
        ),
      ),
    );
  }
}
