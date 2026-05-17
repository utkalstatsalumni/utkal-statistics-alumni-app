import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,

    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 2,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
  );
}
