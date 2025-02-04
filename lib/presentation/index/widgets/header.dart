import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_app/common/cubit/user/user_display_cubit.dart';
import 'package:uptodo_app/common/cubit/user/user_display_state.dart';
import 'package:uptodo_app/core/configs/assets/app_images.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/domain/auth/entities/user.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _sort(),
        _title(),
        BlocBuilder<UserDisplayCubit, UserDisplayState>(
          builder: (context, state) {
            if (state is UserDisplayLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is UserDisplayLoaded) {
              return _profileImage(state.userEntity);
            }

            return const SizedBox();
          },
        ),
      ],
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

  Widget _profileImage(UserEntity userEntity) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: userEntity.image?.isEmpty ?? true
                ? const AssetImage(AppImages.profileImage)
                : NetworkImage(userEntity.image!),
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
          shape: BoxShape.circle),
    );
  }
}
