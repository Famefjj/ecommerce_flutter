import 'package:flutter/material.dart';

import 'app_bar_theme.dart';
import 'bottom_sheet_theme.dart';
import 'app_colors.dart';
import 'button_theme.dart';
import 'card_theme.dart';
import 'input_theme.dart';
import 'text_theme.dart';

export 'app_bar_theme.dart';
export 'bottom_sheet_theme.dart';
export 'app_colors.dart';
export 'button_theme.dart';
export 'card_theme.dart';
export 'input_theme.dart';
export 'text_theme.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppTextTheme.fontFamily,
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: AppTextTheme.lightTextTheme,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarThemes.lightAppBarTheme,
    inputDecorationTheme: AppInputTheme.lightInputDecorationTheme,
    elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
    filledButtonTheme: AppButtonTheme.filledButtonTheme,
    outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
    textButtonTheme: AppButtonTheme.textButtonTheme,
    iconButtonTheme: AppButtonTheme.iconButtonTheme,
    floatingActionButtonTheme: AppButtonTheme.floatingActionButtonTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    cardTheme: AppCardTheme.lightCardTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AppTextTheme.fontFamily,
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: AppTextTheme.darkTextTheme,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarThemes.darkAppBarTheme,
    inputDecorationTheme: AppInputTheme.darkInputDecorationTheme,
    elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
    filledButtonTheme: AppButtonTheme.filledButtonTheme,
    outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
    textButtonTheme: AppButtonTheme.textButtonTheme,
    iconButtonTheme: AppButtonTheme.iconButtonTheme,
    floatingActionButtonTheme: AppButtonTheme.floatingActionButtonTheme,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    cardTheme: AppCardTheme.darkCardTheme,
  );
}
