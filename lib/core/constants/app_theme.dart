import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBackground,
        primaryColor: AppColors.primary,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          elevation: 2,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: GoogleFonts.orbitron(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: GoogleFonts.interTextTheme().copyWith(
          bodyLarge: GoogleFonts.inter(
            color: AppColors.lightText,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.accent),
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          background: AppColors.lightBackground,
          surface: AppColors.lightSurface,
          error: AppColors.error,
        ),
      );

  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackground,
        primaryColor: AppColors.primary,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          elevation: 2,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: GoogleFonts.orbitron(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: GoogleFonts.interTextTheme().copyWith(
          bodyLarge: GoogleFonts.inter(
            color: AppColors.darkText,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.accent),
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          background: AppColors.darkBackground,
          surface: AppColors.darkSurface,
          error: AppColors.error,
        ),
      );
}
