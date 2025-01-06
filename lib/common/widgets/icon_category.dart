import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_app/common/cubit/category/category_display_cubit.dart';
import 'package:uptodo_app/common/cubit/category/category_display_state.dart';
import 'package:uptodo_app/common/widgets/button/basic_reactive_button.dart';
import 'package:uptodo_app/core/configs/assets/app_images.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/domain/category/entities/category.dart';

class IconCategory extends StatelessWidget {
  const IconCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        AppImages.tag,
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
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(AppStrings.chooseCategory,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        const Divider(color: AppColors.white),
                        BlocBuilder<CategoryDisplayCubit, CategoryDisplayState>(
                          builder: (context, state) {
                            if (state is CategoryDisplayLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            if (state is CategoryDisplayLoaded) {
                              return _getCategories(
                                  context, state.categoryEntity);
                            }

                            return _createCategory();
                          },
                        ),
                        BasicReactiveButton(
                          title: AppStrings.addCategory,
                          onPressed: () {},
                        )
                      ],
                    ),
                  ));
            });
      },
    );
  }

  Widget _getCategories(
      BuildContext context, List<CategoryEntity> categoryEntity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Wrap(
        spacing: 12,
        runSpacing: 20,
        children: [
          ...categoryEntity.map((category) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: category.color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  category.name!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          }),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                AppStrings.createNew,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _createCategory() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          AppStrings.createNew,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
