import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

Widget buildTabIcon({
  required IconData icon,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: SizedBox(
      width: 64,
      height: 52,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        alignment: Alignment.center,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          scale: isSelected ? 1.25 : 1.0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: isSelected ? 1 : 0.4,
            child: Icon(
              icon,
              size: 26,
              color: AppColor.grey3,
            ),
          ),
        ),
      ),
    ),
  );
}
