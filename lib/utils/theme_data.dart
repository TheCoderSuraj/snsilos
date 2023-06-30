import 'package:flutter/material.dart';

ThemeData lightThemeData = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light(
    primary: Colors.green,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 18))),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    labelMedium: TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.w900,
      fontSize: 20,
    ),
    titleMedium: TextStyle(color: Colors.green),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: Colors.green,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    // focusColor: Colors.lightBlue,
  ),
);
