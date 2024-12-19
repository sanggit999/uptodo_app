import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uptodo_app/common/widgets/button/basic_app_button.dart';
import 'package:uptodo_app/common/widgets/text_form_field/basic_text_form_field.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _register(),
            const SizedBox(height: 30),
            Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _titleUserName(),
                    const SizedBox(height: 5),
                    _usernameField(),
                    const SizedBox(height: 20),
                    _titlePassword(),
                    const SizedBox(height: 5),
                    _passwordField(),
                    const SizedBox(height: 20),
                    _titleConfirmPassword(),
                    const SizedBox(height: 5),
                    _confirmPasswordField(),
                    const SizedBox(height: 100),
                    _registerButton()
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _register() {
    return const Text(
      AppStrings.register,
      style: TextStyle(
        fontSize: 32,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _usernameField() {
    return BasicTextFormField(
      controller: _usernameController,
      hintText: AppStrings.enterYourUsername,
    );
  }

  Widget _titleUserName() {
    return const Text(
      AppStrings.username,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
    );
  }

  Widget _titlePassword() {
    return const Text(
      AppStrings.password,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
    );
  }

  Widget _passwordField() {
    return BasicTextFormField(
      controller: _passwordController,
      hintText: AppStrings.enterYourPassword,
      obscureText: true,
    );
  }

  Widget _titleConfirmPassword() {
    return const Text(
      AppStrings.confirmPassword,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
    );
  }

  Widget _confirmPasswordField() {
    return BasicTextFormField(
      controller: _passwordController,
      hintText: AppStrings.confirmPassword,
      obscureText: true,
    );
  }

  Widget _registerButton() {
    return BasicAppButton(
      onPressed: () {},
      title: AppStrings.register,
    );
  }
}
