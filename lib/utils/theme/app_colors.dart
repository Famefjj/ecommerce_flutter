import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF2563EB);

  static const Color lightBackground = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF64748B);

  static const Color darkBackground = Color(0xFF0F172A);
  static const Color darkSurface = Color(0xFF1E293B);
  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFFCBD5E1);

  static final ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: primary,
    brightness: Brightness.light,
    surface: lightSurface,
  );

  static final ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: primary,
    brightness: Brightness.dark,
    surface: darkSurface,
  );
}
