import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_theme.dart';

class AppButtonTheme {
  AppButtonTheme._();

  static const double _buttonHeight = 56;
  static const double _buttonRadius = 14;
  static const double _iconButtonSize = 56;

  static const EdgeInsetsGeometry _buttonPadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 14,
  );

  static const EdgeInsetsGeometry _textButtonPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 12,
  );

  static const RoundedRectangleBorder _buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(_buttonRadius)),
  );

  static final ElevatedButtonThemeData elevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primary,
      disabledForegroundColor: AppColors.buttonDisabledForeground,
      disabledBackgroundColor: AppColors.buttonDisabledBackground,
      padding: _buttonPadding,
      textStyle: AppTextTheme.buttonTextStyle,
      elevation: 0,
      minimumSize: const Size.fromHeight(_buttonHeight),
      shape: _buttonShape,
    ).copyWith(
      elevation: const WidgetStatePropertyAll<double?>(0),
      side: WidgetStateProperty.resolveWith<BorderSide?>(
        _primaryButtonSide,
      ),
    ),
  );

  static final FilledButtonThemeData filledButtonTheme = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: AppColors.primary,
      disabledForegroundColor: AppColors.buttonDisabledForeground,
      disabledBackgroundColor: AppColors.buttonDisabledBackground,
      padding: _buttonPadding,
      textStyle: AppTextTheme.buttonTextStyle,
      minimumSize: const Size.fromHeight(_buttonHeight),
      shape: _buttonShape,
    ).copyWith(
      side: WidgetStateProperty.resolveWith<BorderSide?>(
        _primaryButtonSide,
      ),
    ),
  );

  static final OutlinedButtonThemeData outlinedButtonTheme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.primary,
      backgroundColor: Colors.transparent,
      disabledForegroundColor: AppColors.buttonDisabledForeground,
      disabledBackgroundColor: Colors.transparent,
      padding: _buttonPadding,
      textStyle: AppTextTheme.buttonTextStyle,
      minimumSize: const Size.fromHeight(_buttonHeight),
      shape: _buttonShape,
    ).copyWith(
      side: WidgetStateProperty.resolveWith<BorderSide?>(
        _outlinedButtonSide,
      ),
    ),
  );

  static final TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primary,
      backgroundColor: Colors.transparent,
      disabledForegroundColor: AppColors.buttonDisabledForeground,
      disabledBackgroundColor: Colors.transparent,
      padding: _textButtonPadding,
      textStyle: AppTextTheme.buttonTextStyle,
      minimumSize: const Size.fromHeight(_buttonHeight),
      shape: _buttonShape,
    ),
  );

  static final IconButtonThemeData iconButtonTheme = IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: AppColors.primary,
      backgroundColor: Colors.transparent,
      disabledForegroundColor: AppColors.buttonDisabledForeground,
      disabledBackgroundColor: Colors.transparent,
      iconSize: 24,
      fixedSize: const Size.square(_iconButtonSize),
      padding: EdgeInsets.zero,
      shape: _buttonShape,
    ),
  );

  static const FloatingActionButtonThemeData floatingActionButtonTheme =
      FloatingActionButtonThemeData(
    foregroundColor: Colors.white,
    backgroundColor: AppColors.primary,
    elevation: 0,
    focusElevation: 0,
    hoverElevation: 2,
    disabledElevation: 0,
    highlightElevation: 0,
    iconSize: 24,
    sizeConstraints: BoxConstraints.tightFor(width: 56, height: 56),
    smallSizeConstraints: BoxConstraints.tightFor(width: 40, height: 40),
    largeSizeConstraints: BoxConstraints.tightFor(width: 96, height: 96),
    extendedPadding: EdgeInsets.symmetric(horizontal: 24),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
  );

  static BorderSide? _primaryButtonSide(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return const BorderSide(color: AppColors.buttonDisabledBackground);
    }

    return const BorderSide(color: AppColors.primary);
  }

  static BorderSide? _outlinedButtonSide(Set<WidgetState> states) {
    if (states.contains(WidgetState.disabled)) {
      return const BorderSide(color: AppColors.buttonDisabledBorder);
    }

    return const BorderSide(color: AppColors.primary);
  }
}
