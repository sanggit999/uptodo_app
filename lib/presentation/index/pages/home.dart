import 'package:flutter/material.dart';
import 'package:uptodo_app/presentation/index/widgets/header.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [Header()],
    ));
  }
}
// Center(
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// SvgPicture.asset(AppVectors.checklist),
// const SizedBox(height: 25),
// const Text(
// AppStrings.whatDoYouWantToDoToday,
// style: TextStyle(
// fontSize: 20,
// color: AppColors.white,
// fontWeight: FontWeight.bold,
// ),
// ),
// const SizedBox(height: 8),
// const Text(
// AppStrings.tapToAddTasks,
// style: TextStyle(
// fontSize: 16,
// color: AppColors.white,
// ),
// ),
// ],
// ),
// ),