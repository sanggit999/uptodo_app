import 'package:flutter/material.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/navigation/widgets/icon_category.dart';
import 'package:uptodo_app/navigation/widgets/icon_date_and_time.dart';
import 'package:uptodo_app/navigation/widgets/icon_priority.dart';
import 'package:uptodo_app/navigation/widgets/icon_send.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        children: [
          const Text(
            AppStrings.addTask,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
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
                ),
                const SizedBox(height: 10),
                TextField(
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
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(
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
                      child: IconSend(),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
