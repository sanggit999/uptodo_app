import 'package:flutter/material.dart';
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
                'Thêm nhiệm vụ',
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
                        hintText: 'Tiêu đề',
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
                        hintText: 'Mô tả',
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
                                  // Logic for alarm
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
}
