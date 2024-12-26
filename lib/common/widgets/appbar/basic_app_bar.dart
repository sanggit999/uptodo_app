import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? actions;

  const BasicAppBar({
    super.key,
    this.actions,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? const Text(''),
      centerTitle: true,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      elevation: 0,
      actions: [actions ?? const SizedBox()],
      leading: IconButton(
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
