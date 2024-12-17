import 'package:flutter/material.dart';
import 'package:uptodo_app/core/configs/assets/app_vectors.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/presentation/onboading/widgets/onboading.dart';

class OnboadingPage extends StatelessWidget {
  const OnboadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    AppStrings.skip,
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.white,
                        fontWeight: FontWeight.w400),
                  ))),
          Onboarding(
            image: AppVectors.onboading3,
            title: AppStrings.manageYourTasks,
            subTitle: AppStrings.subManageTasksTasks,
          )
        ],
      ),
    ));
  }
}
