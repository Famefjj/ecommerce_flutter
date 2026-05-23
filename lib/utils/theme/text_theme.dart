import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static const String fontFamily = 'MonaSans';

  static const TextStyle _baseTextStyle = TextStyle(
    fontFamily: fontFamily,
  );

  static final TextStyle buttonTextStyle = _baseTextStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

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
      headlineLarge: _baseTextStyle.copyWith(
        color: primaryText,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: _baseTextStyle.copyWith(
        color: primaryText,
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: _baseTextStyle.copyWith(
        color: primaryText,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: _baseTextStyle.copyWith(
        color: primaryText,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: _baseTextStyle.copyWith(
        color: primaryText,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: _baseTextStyle.copyWith(
        color: primaryText,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: _baseTextStyle.copyWith(
        color: secondaryText,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: buttonTextStyle.copyWith(
        color: primaryText, 
        fontSize: 14,
        ),
      labelMedium: _baseTextStyle.copyWith(
        color: secondaryText,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
