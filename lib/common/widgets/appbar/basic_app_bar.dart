import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16),
        child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const SizedBox(
              height: 50,
              width: 50,
              child: Icon(
                Icons.arrow_back_ios,
                size: 24,
                color: AppColors.white,
              ),
            )),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
