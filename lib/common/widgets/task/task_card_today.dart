import 'package:flutter/material.dart';
import 'package:uptodo_app/core/configs/assets/app_images.dart';
import 'package:uptodo_app/core/configs/theme/app_colors.dart';

class TaskCardToday extends StatelessWidget {
  const TaskCardToday({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff363636),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.radio_button_unchecked, color: Colors.white70),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Do Math Homework',
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Today At 16:45',
                      style: TextStyle(
                          color: Color(0xffAFAFAF),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AppImages.flag,
                                width: 14,
                                height: 14,
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                'University',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                AppImages.flag,
                                width: 14,
                                height: 14,
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
