import 'package:flutter/material.dart';
import 'package:uptodo_app/core/configs/theme/custom_theme/app_bar_theme.dart';
import 'package:uptodo_app/core/configs/theme/custom_theme/elevate_button_theme.dart';
import 'package:uptodo_app/core/configs/theme/custom_theme/text_form_field_theme.dart';

class AppTheme {
  AppTheme._();

  static final dark = ThemeData(
    fontFamily: 'Lato',
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff8687E7),
      onPrimary: Color(0xff8687E7),
      secondary: Color(0xffFFFFFF),
      onSecondary: Color(0xff535353),
      error: Color(0xffFF0000),
      onError: Color(0xffFF0000),
      surface: Color(0xff1D1D1D),
      onSurface: Color(0xffFFFFFF),
    ),
    inputDecorationTheme: AppTextFormFieldTheme.darkInputDecoration,
    elevatedButtonTheme: AppElevateButtonTheme.darkElevatedButtonTheme,
    appBarTheme: AppAppBarTheme.appBarTheme,
  );
}
