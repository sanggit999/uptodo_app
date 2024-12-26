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
            // Hành động khi nhấn nút giữa
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
}
