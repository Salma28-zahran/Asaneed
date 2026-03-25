import 'package:asaneed/core/route/routes.dart';
import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(), // لعمل فتحة للزر
      notchMargin: 8,
      color: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xff2c2b2b)
          : Colors.white,
      elevation: 10,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, const Icon(Icons.group), 0),
            _buildNavItem(context, const Icon(Icons.bookmark_border), 1),
            _buildNavItem(context, const Icon(Icons.receipt_long_outlined), 2),
            const SizedBox(width: 65), // مساحة للزر الكبير
            _buildNavItem(context, const Icon(Icons.menu_book), 4),
            _buildNavItem(context, const Icon(Icons.home_outlined), 5),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, Widget icon, int index) {
    final bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: IconTheme(
          data: IconThemeData(
            color: isSelected ? Colors.white : Colors.grey,
            size: 24,
          ),
          child: icon,
        ),
      ),
    );
  }
}