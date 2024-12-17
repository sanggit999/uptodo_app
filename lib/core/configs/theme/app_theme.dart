import 'package:flutter/material.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/configs/theme/custom_theme/elevate_button_theme.dart';
import 'package:uptodo_app/core/configs/theme/custom_theme/text_form_field_theme.dart';

class AppTheme {
  AppTheme._();

  static final dark = ThemeData(
    fontFamily: 'Lato',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.black,
    inputDecorationTheme: AppTextFormFieldTheme.darkInputDecoration,
    elevatedButtonTheme: AppElevateButtonTheme.darkElevatedButtonTheme,
  );
}
