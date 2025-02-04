import 'package:flutter/material.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();

  static InputDecorationTheme darkInputDecoration = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.darkGray.withOpacity(0.1),
    hintStyle: const TextStyle(
        color: AppColors.lightGray, fontWeight: FontWeight.w400),
    contentPadding: const EdgeInsets.all(12),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: AppColors.lightGray,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: AppColors.lightGray,
        width: 1,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 1,
      ),
    ),
  );
}
