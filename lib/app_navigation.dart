import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uptodo_app/core/configs/assets/app_images.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/presentation/calendar/pages/calendar.dart';
import 'package:uptodo_app/presentation/focuse/pages/focuse.dart';
import 'package:uptodo_app/presentation/index/pages/home.dart';
import 'package:uptodo_app/presentation/profile/pages/profile.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  late final List<Widget> pages;
  int selectedIndex = 0;

  int selectedHour = 0;
  int selectedMinute = 0;
  bool isAm = true;

  @override
  void initState() {
    pages = [
      const IndexPage(),
      const CalendarPage(),
      const FocusePage(),
      const ProfilePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: SizedBox(
        width: 64,
        height: 64,
        child: FloatingActionButton(
          onPressed: () {
            _showAddTask(context);
          },
          backgroundColor: AppColors.primary,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white, size: 32),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff363636),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Index
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: selectedIndex == 0
                      ? const Image(
                          image: AssetImage(AppImages.index),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                          height: 24,
                          width: 24,
                        )
                      : const Image(
                          image: AssetImage(AppImages.indexOutlined),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                          height: 24,
                          width: 24,
                        ),
                ),
                const Text(AppStrings.index,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ))
              ],
            ),
            //Calendar
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: selectedIndex == 1
                      ? const Image(
                          image: AssetImage(AppImages.calendar),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                          height: 24,
                          width: 24,
                        )
                      : const Image(
                          image: AssetImage(AppImages.calendarOutlined),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                          height: 24,
                          width: 24,
                        ),
                ),
                const Text(AppStrings.calendar,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ))
              ],
            ),
            const SizedBox(width: 45),
            //Focus
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  child: selectedIndex == 2
                      ? const Image(
                          image: AssetImage(AppImages.focus),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                          height: 24,
                          width: 24,
                        )
                      : const Image(
                          image: AssetImage(AppImages.focusOutlined),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                          height: 24,
                          width: 24,
                        ),
                ),
                const Text(AppStrings.focus,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ))
              ],
            ),
            //Profile
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                  child: selectedIndex == 3
                      ? const Image(
                          image: AssetImage(AppImages.profile),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                          height: 24,
                          width: 24,
                        )
                      : const Image(
                          image: AssetImage(AppImages.profileOutlined),
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                          height: 24,
                          width: 24,
                        ),
                ),
                const Text(AppStrings.profile,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ))
              ],
            ),
          ],
        ),
      ),
      body: pages[selectedIndex],
    );
  }

  Future<void> _showAddTask(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xff363636),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Wrap(
            children: [
              const Text(
                AppStrings.addTask,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
                    Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Image.asset(
                                  AppImages.timer,
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                ),
                                onPressed: () {
                                  _showDialogDate(context);
                                },
                              ),
                              IconButton(
                                icon: Image.asset(
                                  AppImages.tag,
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                ),
                                onPressed: () {
                                  // Logic for category
                                },
                              ),
                              IconButton(
                                icon: Image.asset(
                                  AppImages.flag,
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.fill,
                                  filterQuality: FilterQuality.high,
                                ),
                                onPressed: () {
                                  // Logic for priority
                                },
                              ),
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
                              // Logic for priority
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _showDialogDate(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xff363636),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime.utc(2010, 1, 1),
                  lastDay: DateTime.utc(2999, 1, 1),
                  locale: 'vi_VN',
                  rowHeight: 45,
                  daysOfWeekHeight: 45,
                  headerStyle: HeaderStyle(
                      titleTextFormatter: (date, locale) {
                        final month = DateFormat('MMMM', locale)
                            .format(date)
                            .toUpperCase();
                        final year = DateFormat('yyyy', locale).format(date);
                        return '$month\n$year';
                      },
                      titleTextStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                      ),
                      formatButtonVisible: false,
                      titleCentered: true),
                  calendarStyle: CalendarStyle(
                    defaultDecoration: BoxDecoration(
                        color: const Color(0xff272727),
                        borderRadius: BorderRadius.circular(6)),
                    todayDecoration: BoxDecoration(
                        color: const Color(0xff272727),
                        borderRadius: BorderRadius.circular(6)),
                    weekendDecoration: BoxDecoration(
                        color: const Color(0xff272727),
                        borderRadius: BorderRadius.circular(6)),
                    weekendTextStyle: const TextStyle(color: AppColors.white),
                  ),
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: AppColors.lightGray, width: 1))),
                    weekdayStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColors.white),
                    weekendStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
              ),
              Padding(
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
                          _showDialogTime(context);
                        },
                        style: ElevatedButton.styleFrom(
                            elevation: 0, padding: const EdgeInsets.all(16)),
                        child: const Text(
                          AppStrings.chooesTime,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _showDialogTime(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            backgroundColor: const Color(0xff363636),
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OmniDateTimePicker(
                  separator: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(AppStrings.chooesTime,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        Divider(color: Colors.white),
                      ],
                    ),
                  ),
                  type: OmniDateTimePickerType.time,
                  onDateTimeChanged: (value) {},
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  is24HourMode: false,
                  isShowSeconds: false,
                  amText: 'Sáng',
                  pmText: 'Tối',
                  isForce2Digits: true,
                  looping: true,
                ),
                Padding(
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
                )
              ],
            ));
      },
    );
  }
}
