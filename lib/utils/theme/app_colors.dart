import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF06B976);
  static const Color modalBarrier = Color(0x99000000);

  static const Color buttonDisabledForeground = Color(0xFF94A3A0);
  static const Color buttonDisabledBackground = Color(0xFFE4EEEA);
  static const Color buttonDisabledBorder = Color(0xFFC7D7D1);

  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF263234);
  static const Color lightTextSecondary = Color(0xFF6B7779);

  static const Color darkBackground = Color(0xFF263234);
  static const Color darkSurface = Color(0xFF303C3E);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFD7DEDD);

  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: primary,
    brightness: Brightness.light,
    primary: primary,
    onPrimary: Colors.white,
    surface: lightSurface,
    onSurface: lightTextPrimary,
  );

  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: primary,
    brightness: Brightness.dark,
    primary: primary,
    onPrimary: Colors.white,
    surface: darkSurface,
    onSurface: darkTextPrimary,
  );
}
