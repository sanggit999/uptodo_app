import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uptodo_app/core/configs/assets/app_images.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/navigation/cubit/priority_cubit.dart';

class IconPriority extends StatelessWidget {
  const IconPriority({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        AppImages.flag,
        width: 24,
        height: 24,
        fit: BoxFit.fill,
        filterQuality: FilterQuality.high,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: const Color(0xff363636),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _titleTaskPriority(),
                    const Divider(color: AppColors.white),
                    _showDialogPriority(context),
                    _buttonCancelAndSave(context),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _titleTaskPriority() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(AppStrings.taskPriority,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  Widget _showDialogPriority(BuildContext context) {
    return BlocBuilder<PriorityCubit, int>(
      builder: (context, state) {
        return Flexible(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              //childAspectRatio: 1,
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: 10,
            itemBuilder: (context, index) {
              final isSelected = state == index;
              return GestureDetector(
                onTap: () {
                  context.read<PriorityCubit>().itemSelection(index);
                  print(
                      'Priority selection =>${context.read<PriorityCubit>().state}');
                },
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : Colors.grey[800],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.flag,
                        width: 24,
                        height: 24,
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buttonCancelAndSave(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                context.pop();
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  padding: const EdgeInsets.all(16)),
              child: const Text(
                AppStrings.cancel,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0, padding: const EdgeInsets.all(16)),
              child: const Text(
                AppStrings.save,
                style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
