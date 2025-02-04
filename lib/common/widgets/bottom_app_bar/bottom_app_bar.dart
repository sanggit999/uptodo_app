import 'package:flutter/material.dart';

class BasicBottomAppBar extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String selectedIcon;
  final String unselectedIcon;
  final String label;

  const BasicBottomAppBar({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(isSelected ? selectedIcon : unselectedIcon),
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
            height: 24,
            width: 24,
          ),
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
