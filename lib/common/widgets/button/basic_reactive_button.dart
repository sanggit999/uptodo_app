import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_app/common/cubit/button/button_cubit.dart';
import 'package:uptodo_app/common/cubit/button/button_state.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';

class BasicReactiveButton extends StatelessWidget {
  final Function()? onPressed;
  final double? width;
  final double? height;
  final String title;
  final Widget? widget;

  const BasicReactiveButton(
      {super.key,
       this.onPressed,
      this.width,
      this.height,
      this.title = '',
      this.widget});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(
      builder: (context, state) {
        return _isLoading(context, state is ButtonLoading ? true : false);
      },
    );
  }

  Widget _isLoading(BuildContext context, bool isLoading) {
    return ElevatedButton(
        onPressed: isLoading ? (){} : onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize:
              Size(width ?? MediaQuery.of(context).size.width, height ?? 50),
          backgroundColor: isLoading ? AppColors.primary : AppColors.primary,
          padding: const EdgeInsets.all(16)
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                color: AppColors.white,
              ))
            : widget ?? Text(
                title,
                style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400),
              ));
  }
}
