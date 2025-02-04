import 'package:flutter/material.dart';
import 'package:uptodo_app/common/widgets/task/task_card_completed.dart';
import 'package:uptodo_app/common/widgets/task/task_card_today.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    // final _searchController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _searchTask(),
        const SizedBox(height: 30),
        _taskToday(),
        const SizedBox(height: 30),
        _taskCompleted(),
      ],
    );
  }

  Widget _searchTask() {
    return TextField(
      //controller: _searchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.darkGray.withOpacity(0.1),
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: const Icon(
          Icons.search,
          size: 24,
        ),
        hintText: AppStrings.searchForYourTask,
      ),
    );
  }

  Widget _taskToday() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            AppStrings.today,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(height: 20),
        const TaskCardToday()
      ],
    );
  }

  Widget _taskCompleted() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            AppStrings.completed,
            style: TextStyle(
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(height: 20),
        const TaskCardCompleted()
      ],
    );
  }
}
