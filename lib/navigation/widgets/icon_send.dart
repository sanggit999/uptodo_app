import 'package:flutter/material.dart';
import 'package:uptodo_app/core/configs/assets/app_images.dart';

class IconSend extends StatelessWidget {
  const IconSend({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        AppImages.send,
        width: 24,
        height: 24,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
      ),
      onPressed: () {
        // Logic for priority
      },
    );
  }
}
