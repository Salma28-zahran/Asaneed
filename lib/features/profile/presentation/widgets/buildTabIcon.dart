import 'package:flutter/material.dart';

Widget buildTabIcon({
  required IconData icon,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: SizedBox(
      width: 64,
      height: 52,
      child: AnimatedScale(
        scale: isSelected ? 1.15 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: isSelected ? 1 : 0.6,
          child: Icon(
            icon,
            size: 26,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
