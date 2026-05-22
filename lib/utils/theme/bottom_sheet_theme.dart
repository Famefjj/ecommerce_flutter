import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppBottomSheetTheme {
  AppBottomSheetTheme._();

  static const double _radius = 24;

  static const ShapeBorder _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(_radius),
    ),
  );

  static const BottomSheetThemeData lightBottomSheetTheme =
      BottomSheetThemeData(
    backgroundColor: AppColors.lightSurface,
    modalBackgroundColor: AppColors.lightSurface,
    modalBarrierColor: AppColors.modalBarrier,
    shape: _shape,
    showDragHandle: true,
    clipBehavior: Clip.antiAlias,
  );

  static const BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: AppColors.darkSurface,
    modalBackgroundColor: AppColors.darkSurface,
    modalBarrierColor: AppColors.modalBarrier,
    shape: _shape,
    showDragHandle: true,
    clipBehavior: Clip.antiAlias,
  );
}
