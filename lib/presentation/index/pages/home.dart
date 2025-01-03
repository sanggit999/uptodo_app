import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<String> colors = [
    //   "0xffC9CC41",
    //   "0xff41CCA7",
    //   "0xff4181CC",
    //   "0xff41A2CC",
    //   "0xffCC8441",
    //   "0xff9741CC",
    //   "0xffCC4173",
    // ];

    // final List<int> prioritys = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    return Scaffold(
        body: Column(
      children: [
        //const Header(),
      ],
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

// SizedBox(
// height: 100,
// child: ListView.separated(
// scrollDirection: Axis.horizontal,
// shrinkWrap: true,
// itemBuilder: (context, index) {
// return Container(
// width: 36,
// height: 36,
// decoration: BoxDecoration(
// color: Color(int.parse(colors[index])),
// shape: BoxShape.circle,
// ),
// );
// },
// separatorBuilder: (context, index) => const SizedBox(
// width: 20,
// ),
// itemCount: colors.length),
// ),

// SizedBox(
// height: 64,
// child: ListView.separated(
// scrollDirection: Axis.horizontal,
// shrinkWrap: true,
// itemBuilder: (context, index) {
// return Container(
// width: 64,
// height: 64,
// decoration: BoxDecoration(
// color: Colors.red,
// borderRadius: BorderRadius.circular(4),
// ),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image.asset(
// AppImages.flag,
// width: 24,
// height: 24,
// fit: BoxFit.fill,
// filterQuality: FilterQuality.high,
// ),
// const SizedBox(
// height: 5,
// ),
// Text(
// prioritys[index].toString(),
// style: const TextStyle(
// color: AppColors.white,
// fontSize: 16,
// fontWeight: FontWeight.w400,
// ),
// ),
// ],
// ),
// );
// },
// separatorBuilder: (context, index) => const SizedBox(
// width: 10,
// ),
// itemCount: prioritys.length),
// )