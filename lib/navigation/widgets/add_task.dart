import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo_app/common/widgets/text_form_field/basic_text_form_field.dart';
import 'package:uptodo_app/core/configs/assets/app_images.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/core/network/dio_client.dart';
import 'package:uptodo_app/data/task/models/task_req.dart';
import 'package:uptodo_app/data/task/repositories/task_repository_impl.dart';
import 'package:uptodo_app/data/task/sources/task_api_service.dart';
import 'package:uptodo_app/domain/task/usecases/add_task.dart';
import 'package:uptodo_app/navigation/cubit/calendar_cubit.dart';
import 'package:uptodo_app/navigation/cubit/category_cubit.dart';
import 'package:uptodo_app/navigation/cubit/priority_cubit.dart';
import 'package:uptodo_app/navigation/cubit/task_cubit.dart';
import 'package:uptodo_app/navigation/cubit/task_state.dart';
import 'package:uptodo_app/navigation/cubit/time_cubit.dart';
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
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: BlocListener<TaskCubit, TaskState>(
            listener: (context, state) {
              if (state is TaskLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              }

              if (state is TaskSuccess) {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                DelightToastBar(
                        builder: (context) => const ToastCard(
                              color: AppColors.primary,
                              leading: Icon(
                                Icons.notifications,
                                size: 28,
                              ),
                              title: Center(
                                child: Text(
                                  'Thêm nhiệm vụ thành công',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                        position: DelightSnackbarPosition.top,
                        autoDismiss: true,
                        snackbarDuration: Durations.extralong4)
                    .show(context);
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _titleAddTask(),
                const SizedBox(height: 20),
                _formTitleAndDescription(),
                const SizedBox(height: 16),
                _iconButtons(),
              ],
            )),
      ),
    );
  }

  Widget _titleAddTask() {
    return const Text(
      AppStrings.addTask,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  Widget _formTitleAndDescription() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BasicTextFormField(
              textInputAction: TextInputAction.next,
              controller: _titleController,
              fillColor: const Color(0xff363636),
              hintText: AppStrings.title,
              hintStyle: const TextStyle(color: Color(0xffAFAFAF)),
              enabledBorder: InputBorder.none,
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
              autovalidateMode: AutovalidateMode.onUserInteraction),
          const SizedBox(height: 10),
          BasicTextFormField(
              textInputAction: TextInputAction.done,
              controller: _descriptionController,
              fillColor: const Color(0xff363636),
              hintText: AppStrings.description,
              hintStyle: const TextStyle(color: Color(0xffAFAFAF)),
              enabledBorder: InputBorder.none,
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
              autovalidateMode: AutovalidateMode.onUserInteraction),
        ],
      ),
    );
  }

  Widget _iconButtons() {
    return Row(
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
              onPressed: () async {
                final date = context.read<CalendarCubit>().state.selectedDay;

                final time = context.read<TimeCubit>().state;

                final category = context.read<CategoryCubit>().state;

                final priority = context.read<PriorityCubit>().state;

                if (_formKey.currentState!.validate()) {
                  if (category == null) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Thông báo!'),
                        content: const Text('Bạn chưa chọn Category nào!'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Đóng'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    context.read<TaskCubit>().execute(
                        useCase: AddTaskUseCase(TaskRepositoryImpl(
                            TaskApiServiceImpl(DioClient()))),
                        params: TaskReq(
                            title: _titleController.text,
                            description: _descriptionController.text,
                            dueDate: date,
                            dueHour: time,
                            category: category,
                            priority: priority,
                            isCompleted: false,
                            createdAt: DateTime.now()));
                  }
                }
              }),
        ),
      ],
    );
  }
}
