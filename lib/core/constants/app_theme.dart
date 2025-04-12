import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.lightBackground,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.lightBackground,
        surface: AppColors.lightSurface,
        error: AppColors.error,
      ),
      textTheme: _textTheme(AppColors.textPrimary),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightSurface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        titleTextStyle: _headline6(AppColors.textPrimary),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      cardColor: AppColors.card,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        background: AppColors.darkBackground,
        surface: AppColors.darkSurface,
        error: AppColors.error,
      ),
      textTheme: _textTheme(AppColors.darkText),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkSurface,
        foregroundColor: AppColors.darkText,
        elevation: 0,
        titleTextStyle: _headline6(AppColors.darkText),
        iconTheme: const IconThemeData(color: AppColors.darkText),
      ),
      cardColor: AppColors.darkSurface,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  static TextTheme _textTheme(Color textColor) {
    return TextTheme(
      displayLarge: _displayLarge(textColor),
      displayMedium: _displayMedium(textColor),
      displaySmall: _displaySmall(textColor),
      headlineLarge: _headline1(textColor),
      headlineMedium: _headline2(textColor),
      headlineSmall: _headline3(textColor),
      titleLarge: _headline4(textColor),
      titleMedium: _headline5(textColor),
      titleSmall: _headline6(textColor),
      bodyLarge: _bodyLarge(textColor),
      bodyMedium: _bodyMedium(textColor),
      bodySmall: _bodySmall(textColor),
      labelLarge: _button(textColor),
      labelMedium: _caption(textColor),
    );
  }

  static TextStyle _displayLarge(Color color) => GoogleFonts.inter(fontSize: 57, fontWeight: FontWeight.w400, color: color);
  static TextStyle _displayMedium(Color color) => GoogleFonts.inter(fontSize: 45, fontWeight: FontWeight.w400, color: color);
  static TextStyle _displaySmall(Color color) => GoogleFonts.inter(fontSize: 36, fontWeight: FontWeight.w400, color: color);
  static TextStyle _headline1(Color color) => GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w700, color: color);
  static TextStyle _headline2(Color color) => GoogleFonts.inter(fontSize: 28, fontWeight: FontWeight.w600, color: color);
  static TextStyle _headline3(Color color) => GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w600, color: color);
  static TextStyle _headline4(Color color) => GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600, color: color);
  static TextStyle _headline5(Color color) => GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w500, color: color);
  static TextStyle _headline6(Color color) => GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500, color: color);
  static TextStyle _bodyLarge(Color color) => GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400, color: color);
  static TextStyle _bodyMedium(Color color) => GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400, color: color);
  static TextStyle _bodySmall(Color color) => GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: color);
  static TextStyle _button(Color color) => GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: color);
  static TextStyle _caption(Color color) => GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w400, color: color);
}
