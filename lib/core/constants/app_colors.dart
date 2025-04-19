import 'package:flutter/material.dart';

class AppColors {
  // Primary colors
  static const Color primary = Color(0xFFE10600);
  static const Color secondary = Color(0xFF1E1E1E);

  // Background colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color card = Colors.white;

  // Text colors
  static const Color textPrimary = Color(0xFF1E1E1E);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFFAAAAAA);

  // Button colors
  static const Color buttonPrimary = Color(0xFFE10600);
  static const Color buttonSecondary = Color(0xFF1E1E1E);

  // Status colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFB300);
  static const Color info = Color(0xFF2196F3);

  // Light Theme
  static const Color lightBackground = Color(0xFFf5f2f0);
  static const Color lightSurface = Color(0xFFF5F5F5);
  static const Color lightText = Color(0xFF1C1C1C);

  // Dark Theme
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkText = Color(0xFFFFFFFF);

  // Gradients
  static const List<Color> primaryGradient = [
    Color(0xFFE10600),
    Color(0xFFFF2D26),
  ];

  static const Color mercedes = Color(0xFF27F4D2); // Tiffany Green
  static const Color ferrari = Color(0xFFE80020); // Ferrari Red
  static const Color redBull = Color(0xFF3671C6); // Red Bull Blue
  static const Color mclaren = Color(0xFFFF8000); // Papaya Orange
  static const Color astonMartin = Color(0xFF229971); // British Racing Green
  static const Color alpine = Color(0xFF00A1E8); // Alpine Blue
  static const Color racingBulls = Color(0xFF6692FF); // Racing Bulls Blue
  static const Color haas = Color(0xFFB6BABD); // Haas Grey
  static const Color sauber = Color(0xFF52E252); // Kick Green (Sauber)
  static const Color williams = Color(0xFF1868DB); // Williams Blue

  static const Gradient mercedesGradient = LinearGradient(
    colors: [Color(0xFF00A19B), Color(0xFF0A0A0A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient ferrariGradient = LinearGradient(
    colors: [Color(0xFFDC0000), Color(0xFF7B0000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient redBullGradient = LinearGradient(
    colors: [Color(0xFF3671C6), Color(0xFF1E1E1E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient mclarenGradient = LinearGradient(
    colors: [Color(0xFFFF8700), Color(0xFF1C1C1C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient astonMartinGradient = LinearGradient(
    colors: [Color(0xFF006F62), Color(0xFF1B2F2A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient alpineGradient = LinearGradient(
    colors: [Color(0xFFFF69B4), Color(0xFF0090FF)], // Blue to Hot Pink
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient racingBullsGradient = LinearGradient(
    colors: [Color(0xFF6692FF), Color(0xFF1C2A47)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient haasGradient = LinearGradient(
    colors: [Color(0xFF2B2B2B), Color(0xFFEA2D2E)], // dark gray to Haas red
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient sauberGradient = LinearGradient(
    colors: [Color(0xFF006400), Color(0xFF00FF00)], // Bright green to dark green
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient williamsGradient = LinearGradient(
    colors: [Color(0xFF0082FA), Color(0xFF0A1A3F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Gradient fastestLapGradient = LinearGradient(
    colors: [Color(0xFF9B30FF), Color(0xFF6A0DAD)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
