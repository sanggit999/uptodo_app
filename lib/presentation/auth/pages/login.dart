import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
