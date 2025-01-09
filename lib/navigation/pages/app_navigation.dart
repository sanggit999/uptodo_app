import 'package:flutter/material.dart';
import 'package:uptodo_app/common/widgets/bottom_app_bar/bottom_app_bar.dart';
import 'package:uptodo_app/core/configs/assets/app_images.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/navigation/widgets/add_task.dart';
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
            // Index
            BasicBottomAppBar(
                isSelected: selectedIndex == 0,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                selectedIcon: AppImages.index,
                unselectedIcon: AppImages.indexOutlined,
                label: AppStrings.index),
            //Calendar
            BasicBottomAppBar(
                isSelected: selectedIndex == 1,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                selectedIcon: AppImages.calendar,
                unselectedIcon: AppImages.calendarOutlined,
                label: AppStrings.calendar),
            const SizedBox(width: 45),
            //Focus
            BasicBottomAppBar(
                isSelected: selectedIndex == 2,
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                },
                selectedIcon: AppImages.focus,
                unselectedIcon: AppImages.focusOutlined,
                label: AppStrings.focus),
            //Profile
            BasicBottomAppBar(
                isSelected: selectedIndex == 3,
                onTap: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                },
                selectedIcon: AppImages.profile,
                unselectedIcon: AppImages.profileOutlined,
                label: AppStrings.profile),
          ],
        ),
      ),
      body: pages[selectedIndex],
    );
  }

  Future<void> _showAddTask(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff363636),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
      builder: (context) {
        return const AddTask();
      },
    );
  }
}
