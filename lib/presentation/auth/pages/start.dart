import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uptodo_app/common/widgets/basic_app_button.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(16),
          child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const SizedBox(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 24,
                  color: AppColors.white,
                ),
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Text(
                  AppStrings.welcomeToUpTodo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 32,
                      color: AppColors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                Text(
                  AppStrings.subWelcomeToUpTodo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                BasicAppButton(
                  onPressed: () {
                    context.push('/login');
                  },
                  widget: Text(
                    AppStrings.login.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                BasicAppButton(
                  onPressed: () {
                    context.push('/register');
                  },
                  side: const BorderSide(color: AppColors.primary, width: 1),
                  backgroundColor: Colors.transparent,
                  widget: Text(
                    AppStrings.createAccount.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
