import 'package:asaneed/theme/app_theme.dart';
import 'package:flutter/material.dart';

Widget buildTabIcon({
  required String title,
  String? count,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Center(
      child: SizedBox(
        height: 52,
        width: 90,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          alignment: Alignment.center,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            scale: isSelected ? 1.15 : 1.0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: isSelected ? 1 : 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 👇 العنوان
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.w500,
                      color: AppColor.grey3,
                    ),
                  ),

                  /// 👇 العدد (اختياري)
                  if (count != null) ...[
                    const SizedBox(width: 6),
                    Text(
                      count,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColor.grey3,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}