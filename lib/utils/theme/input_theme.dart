import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppInputTheme {
  AppInputTheme._();

  static final InputDecorationTheme lightInputDecorationTheme =
      _buildInputDecorationTheme(AppColors.lightSurface);

  static final InputDecorationTheme darkInputDecorationTheme =
      _buildInputDecorationTheme(AppColors.darkSurface);

  static InputDecorationTheme _buildInputDecorationTheme(Color fillColor) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      border: _border(BorderSide.none),
      enabledBorder: _border(BorderSide.none),
      focusedBorder: _border(const BorderSide(color: AppColors.primary)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  static OutlineInputBorder _border(BorderSide borderSide) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: borderSide,
    );
  }
}
