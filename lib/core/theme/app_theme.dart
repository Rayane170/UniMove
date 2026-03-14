import 'package:flutter/material.dart';

class AppTheme {

  static const Color primaryGreen = Color(0xFF22C55E);

  // ================= DARK =================

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Roboto",

    scaffoldBackgroundColor: const Color(0xFF0D1117),

    primaryColor: primaryGreen,

    cardColor: const Color(0xFF1B1E24),

    dividerColor: Colors.white12,

    colorScheme: const ColorScheme.dark(
      primary: primaryGreen,
      secondary: primaryGreen,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0D1117),
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white70),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1B1E24),
      selectedItemColor: primaryGreen,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),

   cardTheme: CardThemeData(
      color: const Color(0xFF1B1E24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1F2937),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );



  // ================= LIGHT =================

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Roboto",

    scaffoldBackgroundColor: Colors.white,

    primaryColor: primaryGreen,

    cardColor: const Color(0xFFF3F4F6),

    dividerColor: Colors.black12,

    colorScheme: const ColorScheme.light(
      primary: primaryGreen,
      secondary: primaryGreen,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),

    iconTheme: const IconThemeData(
      color: Colors.black,
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black54),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFF3F4F6),
      selectedItemColor: primaryGreen,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFFF3F4F6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 50),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFF3F4F6),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );

}