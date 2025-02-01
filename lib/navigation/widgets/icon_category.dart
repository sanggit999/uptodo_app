import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uptodo_app/common/cubit/category/category_display_cubit.dart';
import 'package:uptodo_app/common/cubit/category/category_display_state.dart';
import 'package:uptodo_app/common/widgets/button/basic_reactive_button.dart';
import 'package:uptodo_app/core/configs/assets/app_images.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/domain/category/entities/category.dart';
import 'package:uptodo_app/navigation/cubit/category_cubit.dart';

class IconCategory extends StatefulWidget {
  const IconCategory({super.key});

  @override
  State<IconCategory> createState() => _IconCategoryState();
}

class _IconCategoryState extends State<IconCategory> {
  @override
  void initState() {
    context.read<CategoryCubit>().resetSelection();
    super.initState();
  }

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
                        _titleChooseCategory(),
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

                            return _iconCreateCategory();
                          },
                        ),
                        _buttonAddCategory()
                      ],
                    ),
                  ));
            });
      },
    );
  }

  Widget _titleChooseCategory() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(AppStrings.chooseCategory,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  Widget _getCategories(
      BuildContext context, List<CategoryEntity> categoryEntity) {
    return BlocBuilder<CategoryCubit, String?>(
      builder: (context, state) {
        return Flexible(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Số cột trong lưới
              crossAxisSpacing: 10, // Khoảng cách ngang giữa các mục
              mainAxisSpacing: 10, // Khoảng cách dọc giữa các mục
              //childAspectRatio: 1, // Tỉ lệ chiều rộng/chiều cao
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: categoryEntity.length + 1, // Thêm 1 cho nút "Tạo mới"
            itemBuilder: (context, index) {
              // Nút "Tạo mới" ở cuối danh sách
              if (index == categoryEntity.length) {
                return GestureDetector(
                  onTap: () {
                    // Xử lý sự kiện tạo mới
                  },
                  child: Column(
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
                          color: AppColors.white,
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        AppStrings.createNew,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              }

              final category = categoryEntity[index];
              final isSelected = state == category.categoryId;

              return GestureDetector(
                onTap: () {
                  context
                      .read<CategoryCubit>()
                      .itemSelection(category.categoryId!);
                  print(
                      'Category selection =>${context.read<CategoryCubit>().state}->$index');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Color(int.parse(category.color!)),
                        borderRadius: BorderRadius.circular(4),
                        border: isSelected
                            ? Border.all(
                                color: AppColors.primary,
                                width: 5,
                              )
                            : null,
                      ),
                      child: Center(
                        child: Image.network(
                          category.icon!,
                          width: 32,
                          height: 32,
                          fit: BoxFit.contain,
                          filterQuality: FilterQuality.high,
                          scale: 1.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      category.name!,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _iconCreateCategory() {
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

  Widget _buttonAddCategory() {
    return BasicReactiveButton(
      title: AppStrings.addCategory,
      onPressed: () {
        context.read<CategoryCubit>().state;
        context.pop();
      },
    );
  }
}
