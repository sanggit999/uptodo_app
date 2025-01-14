import 'package:flutter/material.dart';
import 'package:uptodo_app/core/configs/assets/app_images.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/navigation/widgets/icon_category.dart';
import 'package:uptodo_app/navigation/widgets/icon_date_and_time.dart';
import 'package:uptodo_app/navigation/widgets/icon_priority.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();

  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              AppStrings.addTask,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    controller: _titleController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff363636),
                      hintText: AppStrings.title,
                      helperStyle: const TextStyle(color: Color(0xffAFAFAF)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.white.withOpacity(0.5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.8),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Không được để trống tiêu đề';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _descriptionController,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff363636),
                      hintText: AppStrings.description,
                      helperStyle: const TextStyle(color: Color(0xffAFAFAF)),
                      enabledBorder: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.white.withOpacity(0.5),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    style: TextStyle(
                      color: AppColors.white.withOpacity(0.8),
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Không được để trống mô tả';
                      } else {
                        return null;
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(
                  flex: 9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconDateAndTime(),
                      IconCategory(),
                      IconPriority(),
                    ],
                  ),
                ),
                Expanded(
                  child: IconButton(
                      icon: Image.asset(
                        AppImages.send,
                        width: 24,
                        height: 24,
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
