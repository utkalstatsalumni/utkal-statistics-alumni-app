import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF1565C0);

  static const Color secondaryPurple = Color(0xFF6A1B9A);

  static const Color accentOrange = Color(0xFFFF8F00);

  static const Color backgroundColor = Color(0xFFF4F7FB);

  static const Color cardColor = Colors.white;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: backgroundColor,

    colorScheme: ColorScheme.light(
      primary: primaryBlue,
      secondary: secondaryPurple,
      tertiary: accentOrange,
      surface: cardColor,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryBlue,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryPurple,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(55),
        elevation: 4,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: secondaryPurple, width: 2),
      ),
    ),

    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 4,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),

    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Color(0xFF1B1B1B),
      ),

      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),

      bodyLarge: TextStyle(fontSize: 16),
    ),
  );
}
