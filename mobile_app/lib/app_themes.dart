// lib/app_themes.dart
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.orange,
    // Accent color, often used for buttons, etc.
    // accentColor: Colors.orangeAccent, // Deprecated, use colorScheme.secondary
    colorScheme: ColorScheme.light(
      primary: Colors.orange, // Primary brand color
      secondary: Colors.orangeAccent, // A complementary color
      surface: Colors.white, // Default background for cards, dialogs, etc.
      onSurface: Colors.black, // Color for text/icons on surface
      background: Colors.white, // Main Scaffold background
      onBackground: Colors.black, // Color for text/icons on background
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white, // White app bar background
      foregroundColor: Colors.black, // Black icons/text on app bar
      elevation: 0, // No shadow
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      headlineMedium: TextStyle(color: Colors.black),
      headlineSmall: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange, // Orange background for primary buttons
        foregroundColor: Colors.white, // White text/icon color
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.orange, // Orange text/icon color
        side: const BorderSide(color: Colors.orange),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.orange, // Cursor color for text fields
      selectionColor: Colors.orangeAccent, // Highlight color
      selectionHandleColor: Colors.orange, // Handle color
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.orange, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      hintStyle: TextStyle(color: Colors.grey.shade600),
    ),
    dividerColor: Colors.grey.shade300,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.orange, // Still keep primary brand color consistent
    colorScheme: ColorScheme.dark(
      primary: Colors.orange,
      secondary: Colors.orangeAccent,
      surface: Colors.grey[850]!, // Darker surface for cards, dialogs
      onSurface: Colors.white,
      background: Colors.grey[900]!, // Main Scaffold background
      onBackground: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900], // Dark app bar
      foregroundColor: Colors.white, // White icons/text
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange, // Orange background for primary buttons
        foregroundColor: Colors.white,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.orange, // Orange text/icon color
        side: const BorderSide(color: Colors.orange),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.orange,
      selectionColor: Colors.orangeAccent,
      selectionHandleColor: Colors.orange,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.orange, width: 2.0),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade600, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      hintStyle: TextStyle(color: Colors.grey.shade400),
    ),
    dividerColor: Colors.grey.shade700,
  );
}
