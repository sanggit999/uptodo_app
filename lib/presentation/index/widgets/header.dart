import 'package:flutter/material.dart';
import 'package:uptodo_app/core/configs/assets/app_images.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_sort(), _title(), _profileImage()],
      ),
    );
  }

  Widget _sort() {
    return IconButton(
        onPressed: () {},
        icon: Image.asset(
          AppImages.sort,
          height: 24,
          width: 24,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
        ));
  }

  Widget _title() {
    return const Text(
      AppStrings.index,
      style: TextStyle(
        fontSize: 20,
        color: AppColors.white,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _profileImage() {
    return Container(
      height: 42,
      width: 42,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.profileImage)),
          shape: BoxShape.circle),
    );
  }
}
