// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LightTheme {
  ThemeData customLightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        color: Colors.black87,
        height: 2,
        fontSize: 14,
      ),
      labelLarge: TextStyle(
          color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w600),
      headlineLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 30.0,
      ),
      bodyLarge: TextStyle(
          fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
        fontSize: 25,
        color: Colors.black45,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        color: Colors.grey,
      ),
    ),
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0),
  );
}
