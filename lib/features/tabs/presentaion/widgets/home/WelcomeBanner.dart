import 'package:flutter/material.dart';
import 'package:asaneed/theme/app_theme.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 362,
      height: 79,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.getPrimary6(context),
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: AppColor.getborder(context),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "أهلاً بك في أسانيد",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Cairo",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  "ادرس الأحاديث، تتبع الرواة، واكتشف أسانيد العلم.",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: "Cairo",
                    fontSize: 13,
                    color: Color(0xff6B7280),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColor.primary,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                "أ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}