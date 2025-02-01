import 'package:flutter/material.dart';

class BasicTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final Color? fillColor;
  final InputBorder? enabledBorder;
  final TextStyle? style;
  final String hintText;
  final TextStyle? hintStyle;
  final bool obscureText;
  final AutovalidateMode? autovalidateMode;
  final FormFieldValidator<String>? validator;
  const BasicTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.validator,
    this.textInputAction,
    this.fillColor,
    this.enabledBorder,
    this.style,
    this.autovalidateMode,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: hintStyle,
        enabledBorder: enabledBorder,
      ),
      obscureText: obscureText,
      keyboardType: TextInputType.text,
      style: style,
      validator: validator,
      autovalidateMode: autovalidateMode,
    );
  }
}
