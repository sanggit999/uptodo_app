import 'package:flutter/material.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final String title;
  final Color? backgroundColor;
  final BorderSide? side;
  final Widget? widget;

  const BasicAppButton(
      {super.key,
      required this.onPressed,
      this.width,
      this.height,
      this.title = '',
      this.widget,
      this.backgroundColor,
      this.side});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            side: side,
            backgroundColor: backgroundColor,
            minimumSize:
                Size(width ?? MediaQuery.of(context).size.width, height ?? 50)),
        child: widget ??
            Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ));
  }
}
