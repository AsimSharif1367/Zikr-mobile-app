import 'package:flutter/material.dart';

class AppColors {
  static const Color mainGreen = Color(0xFF006400);
  static const Color accentGold = Color(0xFFFFD700);
  static const Color lightTop = Color(0xFFF0F8FF);
  static const Color lightBottom = Color(0xFFE6FFE6);
  static const Color darkTop = Color(0xFF042A11);
  static const Color darkBottom = Color(0xFF0D3B2A);
  static const Color textLight = Color(0xFF1A1A1A);
  static const Color textDark = Color(0xFFF5F5F5);
}

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.mainGreen,
        brightness: Brightness.light,
        primary: AppColors.mainGreen,
        secondary: AppColors.accentGold,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      useMaterial3: true,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w700,
          color: AppColors.textLight,
          letterSpacing: 0.7,
          fontFamily: 'Times New Roman',
          fontFamilyFallback: ['Georgia', 'serif'],
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0xFF333333),
          letterSpacing: 0.2,
          fontFamily: 'Arial',
          fontFamilyFallback: ['Helvetica', 'sans-serif'],
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF3E3E3E),
          letterSpacing: 0.2,
          fontFamily: 'Arial',
          fontFamilyFallback: ['Helvetica', 'sans-serif'],
        ),
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.mainGreen,
        brightness: Brightness.dark,
        primary: AppColors.mainGreen,
        secondary: AppColors.accentGold,
      ),
      scaffoldBackgroundColor: Colors.transparent,
      useMaterial3: true,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.w700,
          color: AppColors.textDark,
          letterSpacing: 0.7,
          fontFamily: 'Times New Roman',
          fontFamilyFallback: ['Georgia', 'serif'],
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Color(0xFFE5E5E5),
          letterSpacing: 0.2,
          fontFamily: 'Arial',
          fontFamilyFallback: ['Helvetica', 'sans-serif'],
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFFD8D8D8),
          letterSpacing: 0.2,
          fontFamily: 'Arial',
          fontFamilyFallback: ['Helvetica', 'sans-serif'],
        ),
      ),
    );
  }
}
