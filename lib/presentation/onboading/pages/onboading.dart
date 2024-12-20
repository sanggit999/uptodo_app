import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uptodo_app/core/configs/assets/app_vectors.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';
import 'package:uptodo_app/core/constants/app_strings.dart';
import 'package:uptodo_app/presentation/onboading/cubit/onboading_cubit.dart';
import 'package:uptodo_app/presentation/onboading/widgets/onboading_page_view.dart';

class OnboadingPage extends StatelessWidget {
  OnboadingPage({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboadingCubit(),
      child: Scaffold(body: BlocBuilder<OnboadingCubit, int>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _skip(context),
                _pageView(context, state),
                _backAndNext(context, state)
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _skip(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: TextButton(
            onPressed: () {
              context.push('/start');
            },
            child: Text(
              AppStrings.skip.toUpperCase(),
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.lightGray,
                fontWeight: FontWeight.w400,
              ),
            )));
  }

  Widget _pageView(BuildContext context, int index) {
    return Expanded(
        child: PageView(
      controller: _pageController,
      onPageChanged: (index) {
        context.read<OnboadingCubit>().jumpToPage(index);
      },
      children: [
        OnboardingPageView(
          image: AppVectors.onboading1,
          title: AppStrings.manageYourTasks,
          subTitle: AppStrings.subManageTasksTasks,
          currentIndex: index,
        ),
        OnboardingPageView(
          image: AppVectors.onboading2,
          title: AppStrings.createDailyRoutine,
          subTitle: AppStrings.subCreateDailyRoutine,
          currentIndex: index,
        ),
        OnboardingPageView(
          image: AppVectors.onboading3,
          title: AppStrings.organizeYourTasks,
          subTitle: AppStrings.subOrganizeYourTasks,
          currentIndex: index,
        ),
      ],
    ));
  }

  Widget _backAndNext(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        index > 0
            ? TextButton(
                onPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  context.read<OnboadingCubit>().back();
                },
                child: Text(
                  AppStrings.back.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.lightGray,
                    fontWeight: FontWeight.w400,
                  ),
                ))
            : const SizedBox(),
        index < 2
            ? ElevatedButton(
                onPressed: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                  context.read<OnboadingCubit>().next();
                },
                child: Text(
                  AppStrings.next.toUpperCase(),
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              )
            : ElevatedButton(
                onPressed: () {
                  context.push('/start');
                },
                child: Text(
                  AppStrings.getStarted.toUpperCase(),
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              )
      ],
    );
  }
}
