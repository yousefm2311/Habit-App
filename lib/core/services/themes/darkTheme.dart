// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData customDarkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color.fromARGB(221, 7, 7, 7),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Colors.white70,
        height: 2,
        fontSize: 14,
      ),
      headlineLarge: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w500,
        fontSize: 30.0,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        color: Colors.white70,
      ),
      bodyMedium: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Color.fromARGB(221, 17, 16, 16),
    ),
  );
}
