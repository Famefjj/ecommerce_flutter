import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static const String fontFamily = 'PlusJakartaSans';

  static final TextTheme lightTextTheme = _buildTextTheme(
    AppColors.lightTextPrimary,
    AppColors.lightTextSecondary,
  );

  static final TextTheme darkTextTheme = _buildTextTheme(
    AppColors.darkTextPrimary,
    AppColors.darkTextSecondary,
  );

  static TextTheme _buildTextTheme(Color primaryText, Color secondaryText) {
    return TextTheme(
      headlineLarge: TextStyle(
        color: primaryText,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: TextStyle(
        color: primaryText,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        color: primaryText,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: primaryText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: primaryText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: primaryText,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: secondaryText,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        color: primaryText,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(
        color: secondaryText,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
