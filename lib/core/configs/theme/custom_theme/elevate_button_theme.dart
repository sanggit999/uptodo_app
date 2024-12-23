import 'package:flutter/material.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';

class AppElevateButtonTheme {
  AppElevateButtonTheme._();

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    disabledBackgroundColor: AppColors.primary.withOpacity(0.5),
    elevation: 0,
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ));
}
