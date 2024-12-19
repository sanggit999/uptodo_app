import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uptodo_app/common/widgets/button/basic_app_button.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16),
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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _welcome(),
                const SizedBox(height: 30),
                _subWelcome(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _loginButton(context),
                const SizedBox(height: 20),
                _createAccountButton(context)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _welcome() {
    return const Text(
      AppStrings.welcomeToUpTodo,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _subWelcome() {
    return const Text(
      AppStrings.subWelcomeToUpTodo,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return BasicAppButton(
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
    );
  }

  Widget _createAccountButton(BuildContext context) {
    return BasicAppButton(
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
    );
  }
}
