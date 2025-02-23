import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uptodo_app/core/configs/assets/app_images.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/navigation/cubit/calendar_cubit.dart';
import 'package:uptodo_app/navigation/cubit/calendar_state.dart';
import 'package:uptodo_app/navigation/cubit/time_cubit.dart';

class IconDateAndTime extends StatefulWidget {
  const IconDateAndTime({super.key});

  @override
  State<IconDateAndTime> createState() => _IconDateAndTimeState();
}

class _IconDateAndTimeState extends State<IconDateAndTime> {
  @override
  void initState() {
    context.read<CalendarCubit>().resetSelectedDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        AppImages.timer,
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _showDialogDate(),
                  _buttonCancelAndChooseTime(context),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _showDialogDate() {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            return TableCalendar(
              focusedDay: state.focusedDay,
              firstDay: DateTime.utc(2010, 1, 1),
              lastDay: DateTime.utc(2999, 1, 1),
              availableGestures: AvailableGestures.all,
              locale: 'vi_VN',
              rowHeight: 45,
              daysOfWeekHeight: 45,
              headerStyle: HeaderStyle(
                  titleTextFormatter: (date, locale) {
                    final month =
                        DateFormat('MMMM', locale).format(date).toUpperCase();
                    final year = DateFormat('yyyy', locale).format(date);
                    return '$month\n$year';
                  },
                  titleTextStyle: const TextStyle(
                    fontSize: 14,
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  formatButtonVisible: false,
                  titleCentered: true),
              calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6)),
                  defaultDecoration: BoxDecoration(
                      color: const Color(0xff272727),
                      borderRadius: BorderRadius.circular(6)),
                  todayDecoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(6)),
                  weekendDecoration: BoxDecoration(
                      color: const Color(0xff272727),
                      borderRadius: BorderRadius.circular(6)),
                  weekendTextStyle: const TextStyle(color: AppColors.white),
                  isTodayHighlighted: true),
              daysOfWeekStyle: const DaysOfWeekStyle(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: AppColors.lightGray, width: 1))),
                weekdayStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: AppColors.white),
                weekendStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              selectedDayPredicate: (day) => isSameDay(state.selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                context
                    .read<CalendarCubit>()
                    .selectedDay(selectedDay, focusedDay);

                print(
                    'Selected day =>$selectedDay \nFocused day =>$focusedDay');
              },
            );
          },
        ));
  }

  Widget _buttonCancelAndChooseTime(BuildContext context) {
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
              onPressed: () {
                context.pop();
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                        backgroundColor: const Color(0xff363636),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _showDialogTime(),
                            _buttonCancelAndSave(context),
                          ],
                        ));
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0, padding: const EdgeInsets.all(16)),
              child: const Text(
                AppStrings.chooseTime,
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

  Widget _titleChooseTime() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Text(AppStrings.chooseTime,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  Widget _showDialogTime() {
    return OmniDateTimePicker(
      separator: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            _titleChooseTime(),
            const Divider(color: Colors.white),
          ],
        ),
      ),
      type: OmniDateTimePickerType.time,
      onDateTimeChanged: (value) {
        context.read<TimeCubit>().selectedTime(value);

        print('Time selected =>$value');
      },
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      is24HourMode: false,
      isShowSeconds: false,
      amText: 'Sáng',
      pmText: 'Tối',
      isForce2Digits: true,
      looping: true,
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
              onPressed: () {
                context.read<CalendarCubit>().state.selectedDay;
                context.read<TimeCubit>().state;
                context.pop();
                // print('Day =>$selectedDay \nTime =>$selectedTime');
              },
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
